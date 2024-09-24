import cv2
from ultralytics import YOLO

# 加载 YOLOv8n 模型
model = YOLO('best.pt')

# 打开摄像头
cap = cv2.VideoCapture(0)

if not cap.isOpened():
    print("无法打开摄像头")
    exit()

while True:
    # 读取摄像头帧
    ret, frame = cap.read()
    if not ret:
        print("无法读取摄像头帧")
        break

    # 使用 YOLO 模型进行预测
    results = model.predict(source=frame, show=False)  # 关闭模型自带显示功能

    # 显示检测结果
    for result in results:
        for box in result.boxes:
            b = box.xyxy[0]  # 获取边界框坐标
            c = int(box.cls)  # 获取分类
            conf = box.conf.item()  # 将张量转换为浮点数
            label = f'{model.names[c]} {conf:.2f}'  # 标签信息

            # 绘制边界框
            cv2.rectangle(frame, (int(b[0]), int(b[1])), (int(b[2]), int(b[3])), (0, 255, 0), 2)
            cv2.putText(frame, label, (int(b[0]), int(b[1])-10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

    # 在窗口中显示结果
    cv2.imshow("YOLOv8 Object Detection", frame)

    # 按 'q' 键退出循环
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# 释放摄像头并关闭所有窗口
cap.release()
cv2.destroyAllWindows()
