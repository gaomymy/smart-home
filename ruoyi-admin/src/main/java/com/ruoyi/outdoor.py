from ultralytics import YOLO
import cv2
from ultralytics.utils.plotting import Annotator, colors
import os
import dlib
import numpy as np
import pandas as pd
import time
import logging

# Dlib 正向人脸检测器 / Use frontal face detector of Dlib
detector = dlib.get_frontal_face_detector()

# Dlib 人脸 landmark 特征点检测器 / Get face landmarks
predictor = dlib.shape_predictor(r'data_dlib\shape_predictor_68_face_landmarks.dat')

# Dlib Resnet 人脸识别模型, 提取 128D 的特征矢量 / Use Dlib resnet50 model to get 128D face descriptor
face_reco_model = dlib.face_recognition_model_v1(r"data_dlib\dlib_face_recognition_resnet_model_v1.dat")

class Face_Recognizer:
    def __init__(self):
        self.font = cv2.FONT_ITALIC

        # 已识别的客人编号
        self.guest_count = 0
        self.guest_features = []  # 存储所有客人的特征
        self.guest_labels = {}  # 映射每个客人的特征到编号

        # 保存人脸特征的数组和名字
        self.face_features_known_list = []
        self.face_name_known_list = []

        # 是否开门的标志
        self.door_open = False

    # 从 CSV 文件读取家庭成员信息
    def get_face_database(self):
        if os.path.exists(r"family_member_data\family_features.csv"):
            path_features_known_csv = r"family_member_data\family_features.csv"
            csv_rd = pd.read_csv(path_features_known_csv, header=None)
            for i in range(csv_rd.shape[0]):
                features_someone_arr = []
                self.face_name_known_list.append(csv_rd.iloc[i][0])
                for j in range(1, 129):
                    if csv_rd.iloc[i][j] == '':
                        features_someone_arr.append('0')
                    else:
                        features_someone_arr.append(csv_rd.iloc[i][j])
                self.face_features_known_list.append(features_someone_arr)
            logging.info("Loaded %d faces from family database.", len(self.face_features_known_list))
            return True
        else:
            logging.warning("No family features found!")
            return False

    def is_existing_guest(self, face_descriptor):
        """判断人是否为已识别的客人"""
        for guest_features, guest_label in self.guest_labels.items():
            distance = np.linalg.norm(np.array(guest_features) - np.array(face_descriptor))
            if distance < 0.4:
                return guest_label
        return None

    def process(self, stream, model):
        if self.get_face_database():
            while stream.isOpened():
                flag, img_rd = stream.read()
                kk = cv2.waitKey(1)

                # 使用 YOLO 进行物体检测
                results = model.predict(source=img_rd, show=False)
                annotator = Annotator(img_rd)

                # 使用 dlib 检测人脸
                faces = detector(img_rd, 0)

                self.door_open = False  # 初始化开门状态
                family_member_detected = False
                current_guest_labels = []

                for result in results:
                    for box in result.boxes:
                        b = box.xyxy[0]
                        c = int(box.cls)
                        label = f'{model.names[c]} {float(box.conf):.2f}'
                        annotator.box_label(b, label, color=colors(c))

                for i, d in enumerate(faces):
                    shape = predictor(img_rd, d)
                    face_descriptor = face_reco_model.compute_face_descriptor(img_rd, shape)

                    # 初始化为陌生人
                    recognized_label = "stranger"

                    # 与家庭成员进行匹配
                    min_distance = 999999
                    for j in range(len(self.face_features_known_list)):
                        distance = np.linalg.norm(np.array(self.face_features_known_list[j]) - np.array(face_descriptor))
                        if distance < min_distance:
                            min_distance = distance
                            recognized_label = self.face_name_known_list[j]

                    # 如果是家庭成员，允许开门
                    if min_distance < 0.4:
                        family_member_detected = True
                        self.door_open = True
                    else:
                        # 检查是否是已识别的客人
                        existing_guest_label = self.is_existing_guest(face_descriptor)
                        if existing_guest_label:
                            recognized_label = existing_guest_label
                        else:
                            # 添加新客人并生成编号
                            self.guest_count += 1
                            guest_label = f"guest-{self.guest_count}"
                            self.guest_labels[tuple(face_descriptor)] = guest_label
                            recognized_label = guest_label

                    # 打标签
                    cv2.putText(img_rd, recognized_label, (d.left(), d.top() - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 255, 0), 2)

                # 显示是否开门
                if self.door_open:
                    cv2.putText(img_rd, "Door: Open", (20, 80), self.font, 1, (0, 255, 0), 2, cv2.LINE_AA)
                else:
                    cv2.putText(img_rd, "Door: Closed", (20, 80), self.font, 1, (0, 0, 255), 2, cv2.LINE_AA)

                # 在窗口中显示视频和检测框
                cv2.imshow("camera", img_rd)

                if kk == ord('q'):
                    break

    def run(self, model):
        cap = cv2.VideoCapture(0)  # 打开摄像头
        self.process(cap, model)
        cap.release()
        cv2.destroyAllWindows()

def main():
    logging.basicConfig(level=logging.INFO)
    face_recognizer = Face_Recognizer()

    # 加载 YOLO 模型
    model = YOLO('yolov8n.pt')
    face_recognizer.run(model)

if __name__ == '__main__':
    main()
