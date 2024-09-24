import dlib
import numpy as np
import cv2
import os
import pandas as pd
import logging
import csv
from ultralytics import YOLO
from ultralytics.utils.plotting import Annotator

# Dlib 人脸检测器
detector = dlib.get_frontal_face_detector()

# 人脸 landmark 特征点检测器
predictor = dlib.shape_predictor(r'data_dlib\shape_predictor_68_face_landmarks.dat')

# 人脸识别模型，提取128D特征矢量
face_reco_model = dlib.face_recognition_model_v1(r"data_dlib\dlib_face_recognition_resnet_model_v1.dat")

class Face_Recognizer:
    def __init__(self):
        self.font = cv2.FONT_ITALIC

        # 保存陌生人图像
        self.stranger_save_path = r"visitor_data"
        self.stranger_feature_path = r"visitor_data\visitor_features.csv"
        self.stranger_count = self.get_existing_stranger_count()
        self.visitor_features = []  # 保存客人的特征
        self.visitor_names = {}  # 保存客人编号，例如 {feature_hash: guest-1}

        if not os.path.exists(self.stranger_save_path):
            os.makedirs(self.stranger_save_path)

        # 加载现有访客特征
        self.load_stranger_features()

    def get_existing_stranger_count(self):
        directories = os.listdir(self.stranger_save_path)
        count = sum(1 for dir in directories if dir.startswith("person_"))
        return count

    def load_stranger_features(self):
        """从CSV文件加载访客特征"""
        if os.path.exists(self.stranger_feature_path):
            df = pd.read_csv(self.stranger_feature_path, header=None)
            for index, row in df.iterrows():
                guest_name = row[0]
                guest_features = list(map(float, row[1:].tolist()))  # 将特征转换为浮点数
                self.visitor_names[tuple(guest_features)] = guest_name  # 使用特征作为键，标号作为值
                self.visitor_features.append(guest_features)
            logging.info("Loaded visitor features from %s", self.stranger_feature_path)

    def save_stranger_features(self):
        """更新CSV文件，每次重写文件，确保文件格式正确"""
        with open(self.stranger_feature_path, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile)
            for features, guest_name in self.visitor_names.items():
                writer.writerow([guest_name] + list(map(float, features)))  # 确保特征为浮点数
        logging.info("Updated visitor_features.csv with new entries")

    def save_stranger_image(self, img, bbox, count, person_dir):
        """保存陌生人图片"""
        x, y, w, h = bbox.left(), bbox.top(), bbox.width(), bbox.height()
        face_img = img[y:y+h, x:x+w]
        save_path = os.path.join(person_dir, f"img_face_{count}.jpg")
        cv2.imwrite(save_path, face_img)
        logging.info(f"Stranger image saved to {save_path}")

    def get_face_database(self):
        """加载家庭成员数据库"""
        self.face_name_known_list = []
        self.face_features_known_list = []
        if os.path.exists(r"family_member_data\family_features.csv"):
            path_features_known_csv = r"family_member_data\family_features.csv"
            csv_rd = pd.read_csv(path_features_known_csv, header=None)
            for i in range(csv_rd.shape[0]):
                features_someone_arr = []
                self.face_name_known_list.append(csv_rd.iloc[i][0])
                for j in range(1, 129):
                    features_someone_arr.append(csv_rd.iloc[i][j] if csv_rd.iloc[i][j] != '' else '0')
                self.face_features_known_list.append(features_someone_arr)
            logging.info("Faces in Database： %d", len(self.face_features_known_list))
            return 1
        else:
            logging.warning("'family_features.csv' not found!")
            return 0

    def is_existing_guest(self, face_descriptor):
        """判断陌生人是否已经被标记为客人，并返回客人的编号"""
        for guest_features, guest_name in self.visitor_names.items():
            distance = np.linalg.norm(np.array(guest_features) - np.array(face_descriptor))
            if distance < 0.4:  # 如果距离小于阈值，则认为是已经标记的客人
                return guest_name
        return None

    def process(self, stream, model):
        if self.get_face_database():
            while stream.isOpened():
                flag, img_rd = stream.read()
                original_img = img_rd.copy()  # 保留原图
                kk = cv2.waitKey(1)

                # 使用YOLO进行对象检测，只检测“人”（类别索引为0）
                results = model.predict(source=img_rd, show=False)
                annotator = Annotator(img_rd)

                total_people_count = 0
                family_member_count = 0
                guest_count = 0
                family_member_names = []
                guest_names = []

                for result in results:
                    for box in result.boxes:
                        c = int(box.cls)
                        if c == 0:  # 只检测“人”
                            b = box.xyxy[0]
                            total_people_count += 1

                faces = detector(img_rd, 0)

                family_member_present = False
                strangers_detected = []

                for k, d in enumerate(faces):
                    shape = predictor(img_rd, d)
                    face_descriptor = face_reco_model.compute_face_descriptor(img_rd, shape)
                    min_distance = 999999
                    min_index = -1

                    for i in range(len(self.face_features_known_list)):
                        distance = np.linalg.norm(np.array(self.face_features_known_list[i]) - np.array(face_descriptor))
                        if distance < min_distance:
                            min_distance = distance
                            min_index = i

                    if min_distance < 0.4:
                        recognized_name = self.face_name_known_list[min_index]
                        family_member_present = True
                        family_member_names.append(recognized_name)
                        family_member_count += 1
                        # 标注家庭成员
                        cv2.putText(img_rd, f"Family: {recognized_name}", (d.left(), d.top() - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 255, 0), 2)
                    else:
                        # 判断此陌生人是否已经被定义为客人
                        existing_guest_name = self.is_existing_guest(face_descriptor)
                        if existing_guest_name:
                            guest_names.append(existing_guest_name)
                            guest_count += 1
                            # 标注客人
                            cv2.putText(img_rd, existing_guest_name, (d.left(), d.top() - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 255, 255), 2)
                        else:
                            strangers_detected.append((d, face_descriptor))
                            guest_names.append("Stranger")
                            guest_count += 1
                            # 标注陌生人
                            cv2.putText(img_rd, "Stranger", (d.left(), d.top() - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 0, 255), 2)

                # 保存陌生人照片并标记为客人
                if family_member_present and strangers_detected:
                    person_dir = os.path.join(self.stranger_save_path, f"person_{self.stranger_count + 1}")
                    os.makedirs(person_dir, exist_ok=True)

                    for idx, (stranger_bbox, features) in enumerate(strangers_detected):
                        for i in range(3):  # 保存3张不同的脸部照片
                            self.save_stranger_image(original_img, stranger_bbox, i + 1, person_dir)
                        self.stranger_count += 1
                        guest_label = f"guest-{self.stranger_count}"
                        self.visitor_features.append(features)  # 记录该陌生人的特征，标记为客人
                        self.visitor_names[tuple(features)] = guest_label

                # 更新CSV文件，确保保存最新的访客信息
                self.save_stranger_features()

                family_features = pd.read_csv(r'family_member_data\family_features.csv', header=None)
                visitor_features = pd.read_csv(r'visitor_data\visitor_features.csv', header=None)
                combined_features = pd.concat([family_features, visitor_features])
                combined_features.to_csv(r'combined_features.csv', index=False, header=False)
                print("合并完成，文件保存为 combined_features.csv")
                # 打印每帧信息
                print(f"陌生人与家庭成员同框，共检测到{total_people_count}人，其中家庭成员{family_member_count}人，客人{guest_count}人。")
                print(f"家庭成员名字: {family_member_names}")
                print(f"客人名字: {guest_names}")

                # 在窗口中显示视频和检测框
                cv2.imshow("camera", img_rd)

                if kk == ord('q'):
                    break

    def run(self, model):
        cap = cv2.VideoCapture(0)
        self.process(cap, model)
        cap.release()
        cv2.destroyAllWindows()

def main():
    logging.basicConfig(level=logging.INFO)
    Face_Recognizer_con = Face_Recognizer()
    model = YOLO('yolov8n.pt')
    Face_Recognizer_con.run(model)

if __name__ == '__main__':
    main()

