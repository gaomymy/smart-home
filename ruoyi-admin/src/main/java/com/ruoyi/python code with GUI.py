import cv2
import mediapipe as mp
import numpy as np
from tkinter import filedialog
from tkinter import *
from PIL import Image, ImageTk

# 初始化Tkinter窗口
root = Tk()
root.geometry("1920x1080+0+0")
root.state("zoomed")
root.config(bg="#3a3b3c")
root.title("Eldering Monitoring")

# 选择视频路径
def path_select():
    global video_path, cap
    video_path = filedialog.askopenfilename()
    cap = cv2.VideoCapture(video_path)
    text = Label(root, text="Recorded Video  ", bg="#3a3b3c", fg="#ffffff", font=("Calibri", 20))
    text.place(x=250, y=150)

# 实时视频
def video_live():
    global video_path, cap
    video_path = 0
    cap = cv2.VideoCapture(video_path)
    text = Label(root, text="Live Video Feed", bg="#3a3b3c", fg="#ffffff", font=("Calibri", 20))
    text.place(x=250, y=150)

# 界面按钮和标签
live_btn = Button(root, height=1, text='LIVE', width=8, fg='magenta', font=("Calibri", 14, "bold"), command=lambda: video_live())
live_btn.place(x=1200, y=20)
text = Label(root, text="  For Live Video", bg="#3a3b3c", fg="#ffffff", font=("Calibri", 20))
text.place(x=1000, y=30)

browse_btn = Button(root, height=1, width=8, text='VIDEO', fg='magenta', font=("Calibri", 14, "bold"), command=lambda: path_select())
browse_btn.place(x=1200, y=90)
text = Label(root, text="To Browse Video", bg="#3a3b3c", fg="#ffffff", font=("Calibri", 20))
text.place(x=1000, y=90)

ttl = Label(root, text="ELDERING MONITORING", bg="#4f4d4a", fg="#fffbbb", font=("Calibri", 40))
ttl.place(x=100, y=50)

Video_frame = Frame(root, height=720, width=1080, bg="#3a3b3c")
Video_Label = Label(root)
Video_frame.place(x=15, y=200)
Video_Label.place(x=15, y=200)

# 计算角度函数
def calculate_angle(a, b, c):
    a = np.array(a)  # 第一个点
    b = np.array(b)  # 中间点
    c = np.array(c)  # 结束点
    
    radians = np.arctan2(c[1] - b[1], c[0] - b[0]) - np.arctan2(a[1] - b[1], a[0] - b[0])
    angle = np.abs(radians * 180.0 / np.pi)
    
    if angle > 180.0:
        angle = 360 - angle
        
    return angle

# 初始化Mediapipe和视频捕获
mp_drawing = mp.solutions.drawing_utils
mp_pose = mp.solutions.pose
video_path = 0
cap = cv2.VideoCapture(video_path)

# 计数器和阶段变量
counter = 0
stage = None

# 设置Mediapipe实例
with mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.5) as pose:
    while cap.isOpened():
        ret, frame = cap.read()
        if ret:
            # 转换图像为RGB
            image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            image.flags.writeable = False
        
            # 处理图像
            results = pose.process(image)
        
            # 转换回BGR
            image.flags.writeable = True
            image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
            
            # 提取地标
            try:
                landmarks = results.pose_landmarks.landmark
                
                # 获取身体部位坐标
                left_eye = [landmarks[mp_pose.PoseLandmark.LEFT_EYE.value].x, landmarks[mp_pose.PoseLandmark.LEFT_EYE.value].y]
                left_hip = [landmarks[mp_pose.PoseLandmark.LEFT_HIP.value].x, landmarks[mp_pose.PoseLandmark.LEFT_HIP.value].y]
                left_heel = [landmarks[mp_pose.PoseLandmark.LEFT_HEEL.value].x, landmarks[mp_pose.PoseLandmark.LEFT_HEEL.value].y]
                right_eye = [landmarks[mp_pose.PoseLandmark.RIGHT_EYE.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_EYE.value].y]
                right_hip = [landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_HIP.value].y]
                right_heel = [landmarks[mp_pose.PoseLandmark.RIGHT_HEEL.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_HEEL.value].y]
                right_index = [landmarks[mp_pose.PoseLandmark.RIGHT_INDEX.value].x, landmarks[mp_pose.PoseLandmark.RIGHT_INDEX.value].y] 
                left_index = [landmarks[mp_pose.PoseLandmark.LEFT_INDEX.value].x, landmarks[mp_pose.PoseLandmark.LEFT_INDEX.value].y]

                # 计算角度
                angle1 = calculate_angle(left_eye, left_hip, left_heel)
                angle2 = calculate_angle(right_eye, right_hip, right_heel)

                # 显示角度
                cv2.putText(image, str(angle1), tuple(np.multiply(left_hip, [640, 480]).astype(int)), 
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2, cv2.LINE_AA)
                cv2.putText(image, str(angle2), tuple(np.multiply(right_hip, [640, 480]).astype(int)), 
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2, cv2.LINE_AA)

                # 判断姿态和状态
                if ((left_eye[0]>=0.41 and left_eye[0]<=0.43) and (left_hip[0]>=0.44 and left_hip[0]<=0.46) and (left_heel[0]>=0.41 and left_heel[0]<=0.43) or (right_eye[0]>=0.41 and right_eye[0]<=0.43) and (right_hip[0]<=0.43 and right_hip[0]>=0.41) and (right_heel[0]>=0.37 and right_heel[0]<=0.39)):
                    if ((left_eye[1]>=0.24 and left_eye[1]<=0.33) and (left_hip[1]<=0.35 and left_hip[1]>=0.45) and (left_heel[1]<=0.74 and left_heel[1]>=0.72) or (right_eye[1]<=0.30 and right_eye[1]>=0.24) and (right_hip[1]<=0.50 and right_hip[1]>=0.32) and (right_heel[1]>=0.71 and right_heel[1]<=0.73)):
                        stage = "safe :)"
                else:
                    if angle1 != angle2 and (angle1 > 170 and angle2 > 170):
                        if (((right_index[0] < 0.70 and right_index[0] > 0.20) and (right_index[1] < 0.56 and right_index[1] > 0.15)) or ((left_index[0] < 0.55 and left_index[0] > 0.18) and (left_index[1] < 0.56 and left_index[1] > 0.15))):
                            stage = "Hanging on !!"
                        else:
                            stage = "fallen :("    
                    elif angle1 != angle2 and (angle1 < 140 or angle2 < 140):
                        stage = "Trying to Walk"
                    elif angle1 != angle2 and ((angle1 < 168 and angle1 > 140) and (angle2 < 168 and angle2 > 140)):
                        stage = "Barely Walking"
                    else:
                        pass
                
            except:
                pass
            
            # 显示状态框
            cv2.rectangle(image, (0, 0), (350, 125), (245, 117, 16), -1)
            cv2.putText(image, 'Condition:', (15, 12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
            cv2.putText(image, str("Calculating Angles"), (100, 12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1, cv2.LINE_AA)
            cv2.putText(image, 'STAGE:', (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 0), 1, cv2.LINE_AA)
            cv2.putText(image, stage, (10, 100), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255, 255, 255), 2, cv2.LINE_AA)

            # 绘制姿态
            mp_drawing.draw_landmarks(image, results.pose_landmarks, mp_pose.POSE_CONNECTIONS,
                                    mp_drawing.DrawingSpec(color=(245, 117, 66), thickness=2, circle_radius=2), 
                                    mp_drawing.DrawingSpec(color=(245, 66, 230), thickness=2, circle_radius=2))

            # 显示视频窗口
            cv2.imshow('Mediapipe Feed', image)

            # 更新 Tkinter 窗口
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            image = ImageTk.PhotoImage(Image.fromarray(image).resize((1080, 720), Image.LANCZOS))
            Video_Label["image"] = image
            root.update()

            # 按下 'q' 键退出
            if cv2.waitKey(10) & 0xFF == ord('q'):
                break

        else:
            cap.set(cv2.CAP_PROP_POS_FRAMES, 0)  # 循环播放视频

    cap.release()
    cv2.destroyAllWindows()

root.mainloop()
