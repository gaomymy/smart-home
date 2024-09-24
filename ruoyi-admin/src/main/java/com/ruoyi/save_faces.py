#实现了捕获人脸，并存储照片在detected_faces#


from ultralytics import YOLO
import cv2
from ultralytics.utils.plotting import Annotator, colors

import dlib

import os

# 初始化Dlib的面部检测器
face_detector = dlib.get_frontal_face_detector()
predictor_path = r'data_dlib\shape_predictor_68_face_landmarks.dat'

if not os.path.exists(predictor_path):
    raise FileNotFoundError(f"{predictor_path} 文件不存在，请检查路径。")

predictor = dlib.shape_predictor(predictor_path)

def process_camera_feed(model, save_path='detected_faces'):
    # 创建保存目录
    if not os.path.exists(save_path):
        os.makedirs(save_path)

    # 打开摄像头
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        print("无法打开摄像头")
        return

    frame_count = 0  # 帧计数器

    while True:
        # 读取摄像头帧
        ret, frame = cap.read()
        if not ret:
            print("无法读取摄像头帧")
            break

        # 使用YOLO模型进行预测
        results = model.predict(source=frame, show=False)  # 关闭模型自带的显示功能

        # 显示预测结果
        for result in results:
            annotator = Annotator(frame)
            if result.boxes is not None:
                for box in result.boxes:
                    c = int(box.cls)  # 获取分类
                    if c == 0:  # 只保留类别为“person”的结果，类别索引 0 通常表示人
                        b = box.xyxy[0]  # 获取边界框坐标
                        label = f'{model.names[c]} {float(box.conf):.2f}'  # 转换张量为浮点数再格式化
                        annotator.box_label(b, label, color=colors(c))

                        # 提取人的区域并检测人脸
                        x_min, y_min, x_max, y_max = map(int, b)
                        person_img = frame[y_min:y_max, x_min:x_max]
                        gray = cv2.cvtColor(person_img, cv2.COLOR_BGR2GRAY)
                        faces = face_detector(gray)

                        for face in faces:
                            x1 = face.left()
                            y1 = face.top()
                            x2 = face.right()
                            y2 = face.bottom()

                            face_img = person_img[y1:y2, x1:x2]
                            if face_img.size > 0:
                                frame_count += 1
                                face_filename = os.path.join(save_path, f'face_{frame_count}.jpg')
                                cv2.imwrite(face_filename, face_img)
                                print(f"保存人脸截图: {face_filename}")

        # 在窗口中显示结果
        cv2.imshow("YOLOv8 Object Detection", frame)

        # 按下 'q' 键退出循环
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # 释放摄像头并关闭所有窗口
    cap.release()
    cv2.destroyAllWindows()

if __name__ == '__main__':

    try:
        # 加载YOLO模型
        model = YOLO('yolov8n.pt')

        # 处理摄像头实时视频
        process_camera_feed(model)
    except FileNotFoundError as e:
        print(f"文件错误: {e}")
    except Exception as e:
        print(f"发生错误: {e}")
