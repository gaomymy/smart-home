import cv2 as cv
import numpy as np
import time
import argparse

def getFaceBox(net, frame, conf_threshold=0.7):
    frameOpencvDnn = frame.copy()
    frameHeight = frame.shape[0]
    frameWidth = frame.shape[1]
    blob = cv.dnn.blobFromImage(frame, 1.0, (300, 300), [104, 117, 123], False, False)
    net.setInput(blob)
    detections = net.forward()
    bboxes = []
    for i in range(detections.shape[2]):
        confidence = detections[0, 0, i, 2]
        if confidence > conf_threshold:
            x1 = int(detections[0, 0, i, 3]*frameWidth)
            y1 = int(detections[0, 0, i, 4]*frameHeight)
            x2 = int(detections[0, 0, i, 5]*frameWidth)
            y2 = int(detections[0, 0, i, 6]*frameHeight)
            bboxes.append([x1, y1, x2, y2])
            cv.rectangle(frameOpencvDnn, (x1, y1), (x2, y2), (0, 255, 0), 2, 8)
    return frameOpencvDnn, bboxes

parser = argparse.ArgumentParser(description='Use this script to run age and gender recognition using OpenCV.')
parser.add_argument('--input', help='Path to input image or video file. Skip this argument to capture frames from a camera.', default="")
parser.add_argument("--device", default="cpu", help="Device to inference on")

args = parser.parse_args()

faceProto = r"opencv_face_detector.pbtxt"
faceModel = r"opencv_face_detector_uint8.pb"

ageProto = r"age_deploy.prototxt"
ageModel = r"age_net.caffemodel"

genderProto = r"gender_deploy.prototxt"
genderModel = r"gender_net.caffemodel"

MODEL_MEAN_VALUES = (78.4263377603, 87.7689143744, 114.895847746)
ageList = ['0-2', '4-6', '8-12', '15-20', '25-32', '38-43', '48-53', '60-100']
genderList = ['Male', 'Female']

# 加载网络
ageNet = cv.dnn.readNet(ageModel, ageProto)
genderNet = cv.dnn.readNet(genderModel, genderProto)
faceNet = cv.dnn.readNet(faceModel, faceProto)

if args.device == "cpu":
    ageNet.setPreferableBackend(cv.dnn.DNN_TARGET_CPU)
    genderNet.setPreferableBackend(cv.dnn.DNN_TARGET_CPU)
    faceNet.setPreferableBackend(cv.dnn.DNN_TARGET_CPU)
    print("Using CPU device")
elif args.device == "gpu":
    ageNet.setPreferableBackend(cv.dnn.DNN_BACKEND_CUDA)
    ageNet.setPreferableTarget(cv.dnn.DNN_TARGET_CUDA)
    genderNet.setPreferableBackend(cv.dnn.DNN_BACKEND_CUDA)
    genderNet.setPreferableTarget(cv.dnn.DNN_TARGET_CUDA)
    faceNet.setPreferableBackend(cv.dnn.DNN_BACKEND_CUDA)
    faceNet.setPreferableTarget(cv.dnn.DNN_TARGET_CUDA)
    print("Using GPU device")

# 打开视频文件或摄像头
cap = cv.VideoCapture(args.input if args.input else 0)

if not cap.isOpened():
    print("Error: Unable to open video stream or file")
    exit()

padding = 20
while True:
    t = time.time()
    hasFrame, frame = cap.read()
    if not hasFrame:
        print("Error: Can't receive frame (stream end?). Exiting ...")
        break

    frameFace, bboxes = getFaceBox(faceNet, frame)
    if not bboxes:
        print("No face detected, checking next frame.")
        cv.imshow("Age Gender Demo", frameFace)
        if cv.waitKey(1) == ord('q'):
            break
        continue

    for bbox in bboxes:
        face = frame[max(0, bbox[1]-padding):min(bbox[3]+padding, frame.shape[0]-1),
                     max(0, bbox[0]-padding):min(bbox[2]+padding, frame.shape[1]-1)]

        blob = cv.dnn.blobFromImage(face, 1.0, (227, 227), MODEL_MEAN_VALUES, swapRB=False)
        genderNet.setInput(blob)
        genderPreds = genderNet.forward()
        gender = genderList[genderPreds[0].argmax()]
        print(f"Gender: {gender}, conf: {genderPreds[0].max():.3f}")

        ageNet.setInput(blob)
        agePreds = ageNet.forward()
        age = ageList[agePreds[0].argmax()]
        print(f"Age: {age}, conf: {agePreds[0].max():.3f}")

        label = f"{gender}, {age}"
        label_y = bbox[1] - 10 if bbox[1] - 10 > 10 else bbox[1] + 20
        cv.putText(frameFace, label, (bbox[0], label_y), cv.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2, cv.LINE_AA)

    cv.imshow("Age Gender Demo", frameFace)
    print(f"Time: {time.time() - t:.3f}")
    if cv.waitKey(1) == ord('q'):
        break

cap.release()
cv.destroyAllWindows()
