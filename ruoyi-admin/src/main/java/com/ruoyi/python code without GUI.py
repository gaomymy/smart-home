from flask import Flask, jsonify, request
import cv2
import mediapipe as mp
import numpy as np
import threading

app = Flask(__name__)

# 初始化摔倒状态
fall_status = {"fallen": False}
monitoring_active = False  # 是否在监控摔倒状态

def calculate_angle(a, b, c):
    a = np.array(a)
    b = np.array(b)
    c = np.array(c)

    radians = np.arctan2(c[1] - b[1], c[0] - b[0]) - np.arctan2(a[1] - b[1], a[0] - b[0])
    angle = np.abs(radians * 180.0 / np.pi)

    if angle > 180.0:
        angle = 360 - angle

    return angle

def start_fall_detection():
    global fall_status, monitoring_active
    mp_drawing = mp.solutions.drawing_utils
    mp_pose = mp.solutions.pose
    cap = cv2.VideoCapture(0)  # 使用摄像头
    monitoring_active = True

    with mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.5) as pose:
        while cap.isOpened() and monitoring_active:
            ret, frame = cap.read()
            if not ret:
                break

            image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            image.flags.writeable = False
            results = pose.process(image)
            image.flags.writeable = True
            image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)

            try:
                landmarks = results.pose_landmarks.landmark
                left_eye = [landmarks[mp_pose.PoseLandmark.LEFT_EYE.value].x, landmarks[mp_pose.PoseLandmark.LEFT_EYE.value].y]
                left_hip = [landmarks[mp_pose.PoseLandmark.LEFT_HIP.value].x, landmarks[mp_pose.PoseLandmark.LEFT_HIP.value].y]
                left_heel = [landmarks[mp_pose.PoseLandmark.LEFT_HEEL.value].x, landmarks[mp_pose.PoseLandmark.LEFT_HEEL.value].y]
                right_eye = [landmarks[mp_pose.PoseLandmark.RIGHT_EYE.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_EYE.value].y]
                right_hip = [landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value].y]
                right_heel = [landmarks[mp_pose.PoseLandmark.RIGHT_HEEL.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_HEEL.value].y]
                right_index = [landmarks[mp_pose.PoseLandmark.RIGHT_INDEX.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_INDEX.value].y]
                left_index = [landmarks[mp_pose.PoseLandmark.LEFT_INDEX.value].x, landmarks[mp_pose.PoseLandmark.LEFT_INDEX.value].y]

                angle1 = calculate_angle(left_eye, left_hip, left_heel)
                angle2 = calculate_angle(right_eye, right_hip, right_heel)

                if angle1 != angle2 and (angle1 > 170 and angle2 > 170):
                    if (((right_index[0] < 0.70 and right_index[0] > 0.20) and (right_index[1] < 0.56 and right_index[1] > 0.15)) or ((left_index[0] < 0.55 and left_index[0] > 0.18) and (left_index[1] < 0.56 and left_index[1] > 0.15))):
                        fall_status["fallen"] = True
                    else:
                        fall_status["fallen"] = True
                else:
                    fall_status["fallen"] = True

            except Exception as e:
                print("检测错误:", e)

            mp_drawing.draw_landmarks(image, results.pose_landmarks, mp_pose.POSE_CONNECTIONS)
            cv2.imshow('Mediapipe Feed', image)

            if cv2.waitKey(10) & 0xFF == ord('q'):
                break

    cap.release()
    cv2.destroyAllWindows()

# 启动监测
@app.route('/start_monitoring', methods=['POST'])
def start_monitoring():
    global monitoring_active
    if not monitoring_active:
        monitoring_thread = threading.Thread(target=start_fall_detection)
        monitoring_thread.start()
        return jsonify({"status": "监测已启动"}), 200
    else:
        return jsonify({"status": "监测已经在运行"}), 200

# 停止监测
@app.route('/stop_monitoring', methods=['POST'])
def stop_monitoring():
    global monitoring_active
    monitoring_active = False
    return jsonify({"status": "监测已停止"}), 200

# 获取摔倒状态
@app.route('/get_fall_status', methods=['GET'])
def get_fall_status():
    return jsonify(fall_status)

if __name__ == '__main__':
    app.run(debug=True)
