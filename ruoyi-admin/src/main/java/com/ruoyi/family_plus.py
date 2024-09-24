#实现了通过gui界面录入家庭成员的脸，并进行命名，存储在familiy_member_data文件下的家庭成员文件下#



# Copyright (C) 2018-2021 coneypo
# SPDX-License-Identifier: MIT

# Author:   coneypo
# Blog:     http://www.cnblogs.com/AdaminXie
# GitHub:   https://github.com/coneypo/Dlib_face_recognition_from_camera
# Mail:     coneypo@foxmail.com

# 家庭成员人脸录入 并提取特征

import dlib
import numpy as np
import cv2
import os
import shutil
import time
import logging
import tkinter as tk
from tkinter import font as tkFont
from PIL import Image, ImageTk
import csv
import pandas as pd

# Dlib 正向人脸检测器 / Use frontal face detector of Dlib
detector = dlib.get_frontal_face_detector()
predictor = dlib.shape_predictor(r'data_dlib\shape_predictor_68_face_landmarks.dat')
face_reco_model = dlib.face_recognition_model_v1(r"data_dlib\dlib_face_recognition_resnet_model_v1.dat")
# 要读取人脸图像文件的路径 / Path of cropped faces
path_images_from_camera = r"family_member_data\\"

class Face_Register:
    def __init__(self):
        self.current_frame_faces_cnt = 0  # 当前帧中人脸计数器 / cnt for counting faces in current frame
        self.existing_faces_cnt = 0  # 已录入的人脸计数器 / cnt for counting saved faces
        self.ss_cnt = 0  # 录入 person_n 人脸时图片计数器 / cnt for screen shots

        # Tkinter GUI
        self.win = tk.Tk()
        self.win.title("Face Register @coneypo")
        self.win.geometry("1300x550")

        # GUI left part
        self.frame_left_camera = tk.Frame(self.win)
        self.label = tk.Label(self.win)
        self.label.pack(side=tk.LEFT)
        self.frame_left_camera.pack()

        # GUI right part
        self.frame_right_info = tk.Frame(self.win)
        self.label_cnt_face_in_database = tk.Label(self.frame_right_info, text=str(self.existing_faces_cnt))
        self.label_fps_info = tk.Label(self.frame_right_info, text="")
        self.input_name = tk.Entry(self.frame_right_info)
        self.input_name_char = ""
        self.label_warning = tk.Label(self.frame_right_info)
        self.label_face_cnt = tk.Label(self.frame_right_info, text="Faces in current frame: ")
        self.log_all = tk.Label(self.frame_right_info)

        self.font_title = tkFont.Font(family='Helvetica', size=20, weight='bold')
        self.font_step_title = tkFont.Font(family='Helvetica', size=15, weight='bold')
        self.font_warning = tkFont.Font(family='Helvetica', size=15, weight='bold')

        self.path_photos_from_camera = r"family_member_data\\"
        self.current_face_dir = ""
        self.font = cv2.FONT_ITALIC

        # Current frame and face ROI position
        self.current_frame = np.ndarray
        self.face_ROI_image = np.ndarray
        self.face_ROI_width_start = 0
        self.face_ROI_height_start = 0
        self.face_ROI_width = 0
        self.face_ROI_height = 0
        self.ww = 0
        self.hh = 0

        self.out_of_range_flag = False
        self.face_folder_created_flag = False

        # FPS
        self.frame_time = 0
        self.frame_start_time = 0
        self.fps = 0
        self.fps_show = 0
        self.start_time = time.time()

        self.cap = cv2.VideoCapture(0)  # Get video stream from camera

    # 删除之前存的人脸数据文件夹 / Delete old face folders
    def GUI_clear_data(self):
        folders_rd = os.listdir(self.path_photos_from_camera)
        for folder in folders_rd:
            folder_path = os.path.join(self.path_photos_from_camera, folder)
            if os.path.isdir(folder_path):
                shutil.rmtree(folder_path)
        if os.path.isfile(os.path.join(self.path_photos_from_camera, "family_features.csv")):
            os.remove(os.path.join(self.path_photos_from_camera, "family_features.csv"))
        self.label_cnt_face_in_database['text'] = "0"
        self.existing_faces_cnt = 0
        self.log_all["text"] = "Face images and `features_all.csv` removed!"

    def GUI_get_input_name(self):
        self.input_name_char = self.input_name.get()
        self.create_face_folder()
        self.label_cnt_face_in_database['text'] = str(self.existing_faces_cnt)

    def GUI_info(self):
        tk.Label(self.frame_right_info, text="Face register", font=self.font_title).grid(row=0, column=0, columnspan=3, sticky=tk.W, padx=2, pady=20)
        tk.Label(self.frame_right_info, text="FPS: ").grid(row=1, column=0, columnspan=2, sticky=tk.W, padx=5, pady=2)
        self.label_fps_info.grid(row=1, column=2, sticky=tk.W, padx=5, pady=2)
        tk.Label(self.frame_right_info, text="Faces in database: ").grid(row=2, column=0, columnspan=2, sticky=tk.W, padx=5, pady=2)
        self.label_cnt_face_in_database.grid(row=2, column=2, columnspan=3, sticky=tk.W, padx=5, pady=2)
        tk.Label(self.frame_right_info, text="Faces in current frame: ").grid(row=3, column=0, columnspan=2, sticky=tk.W, padx=5, pady=2)
        self.label_face_cnt.grid(row=3, column=2, columnspan=3, sticky=tk.W, padx=5, pady=2)
        self.label_warning.grid(row=4, column=0, columnspan=3, sticky=tk.W, padx=5, pady=2)

        # Step 1: Clear old data
        tk.Label(self.frame_right_info, font=self.font_step_title, text="Step 1: Clear face photos").grid(row=5, column=0, columnspan=2, sticky=tk.W, padx=5, pady=20)
        tk.Button(self.frame_right_info, text='Clear', command=self.GUI_clear_data).grid(row=6, column=0, columnspan=3, sticky=tk.W, padx=5, pady=2)

        # Step 2: Input name and create folders for face
        tk.Label(self.frame_right_info, font=self.font_step_title, text="Step 2: Input name").grid(row=7, column=0, columnspan=2, sticky=tk.W, padx=5, pady=20)
        tk.Label(self.frame_right_info, text="Name: ").grid(row=8, column=0, sticky=tk.W, padx=5, pady=0)
        self.input_name.grid(row=8, column=1, sticky=tk.W, padx=0, pady=2)
        tk.Button(self.frame_right_info, text='Input', command=self.GUI_get_input_name).grid(row=8, column=2, padx=5)

        # Step 3: Save current face in frame
        tk.Label(self.frame_right_info, font=self.font_step_title, text="Step 3: Save face image").grid(row=9, column=0, columnspan=2, sticky=tk.W, padx=5, pady=20)
        tk.Button(self.frame_right_info, text='Save current face', command=self.save_current_face).grid(row=10, column=0, columnspan=3, sticky=tk.W)

        # Show log in GUI
        self.log_all.grid(row=11, column=0, columnspan=20, sticky=tk.W, padx=5, pady=20)
        self.frame_right_info.pack()

    # 新建保存人脸图像文件和数据 CSV 文件夹 / Mkdir for saving photos and csv
    def pre_work_mkdir(self):
        if os.path.isdir(self.path_photos_from_camera):
            pass
        else:
            os.mkdir(self.path_photos_from_camera)

    # 如果有之前录入的人脸, 在之前 person_x 的序号按照 person_x+1 开始录入 / Start from person_x+1
    def check_existing_faces_cnt(self):
        if os.listdir(self.path_photos_from_camera):
            person_list = os.listdir(self.path_photos_from_camera)
            person_num_list = []
            for person in person_list:
                person_path = os.path.join(self.path_photos_from_camera, person)
                if os.path.isdir(person_path) and person.startswith("person_"):
                    try:
                        person_order = int(person.split('_')[1])
                        person_num_list.append(person_order)
                    except ValueError:
                        logging.warning(f"Invalid folder name format: {person}")
            self.existing_faces_cnt = max(person_num_list) if person_num_list else 0
        else:
            self.existing_faces_cnt = 0

    # 更新 FPS / Update FPS of Video stream
    def update_fps(self):
        now = time.time()
        if str(self.start_time).split(".")[0] != str(now).split(".")[0]:
            self.fps_show = self.fps
        self.start_time = now
        self.frame_time = now - self.frame_start_time
        self.fps = 1.0 / self.frame_time
        self.frame_start_time = now
        self.label_fps_info["text"] = str(self.fps.__round__(2))

    def create_face_folder(self):
        self.existing_faces_cnt += 1
        if self.input_name_char:
            self.current_face_dir = self.path_photos_from_camera + "person_" + str(self.existing_faces_cnt) + "_" + self.input_name_char
        else:
            self.current_face_dir = self.path_photos_from_camera + "person_" + str(self.existing_faces_cnt)
        os.makedirs(self.current_face_dir)
        self.log_all["text"] = "\"" + self.current_face_dir + "/\" created!"
        logging.info("\n%-40s %s", "新建的人脸文件夹 / Create folders:", self.current_face_dir)
        self.ss_cnt = 0
        self.face_folder_created_flag = True

    def save_current_face(self):
        if self.face_folder_created_flag:
            if self.current_frame_faces_cnt == 1:
                if not self.out_of_range_flag:
                    self.ss_cnt += 1
                    self.face_ROI_image = np.zeros((int(self.face_ROI_height * 2), self.face_ROI_width * 2, 3), np.uint8)
                    for ii in range(self.face_ROI_height * 2):
                        for jj in range(self.face_ROI_width * 2):
                            self.face_ROI_image[ii][jj] = self.current_frame[self.face_ROI_height_start - self.hh + ii][self.face_ROI_width_start - self.ww + jj]
                    self.log_all["text"] = "\"" + self.current_face_dir + "/img_face_" + str(self.ss_cnt) + ".jpg\"" + " saved!"
                    self.face_ROI_image = cv2.cvtColor(self.face_ROI_image, cv2.COLOR_BGR2RGB)
                    save_path = self.current_face_dir + "/img_face_" + str(self.ss_cnt) + ".jpg"
                    save_result = cv2.imwrite(save_path, self.face_ROI_image)
                    if save_result:
                        logging.info("%-40s %s/img_face_%s.jpg", "写入本地 / Save into：", str(self.current_face_dir), str(self.ss_cnt) + ".jpg")
                    else:
                        logging.error("保存图像失败 / Failed to save image at %s", save_path)
                else:
                    self.log_all["text"] = "Please do not out of range!"
            else:
                self.log_all["text"] = "No face in current frame!"
        else:
            self.log_all["text"] = "Please run step 2!"

    def get_frame(self):
        try:
            if self.cap.isOpened():
                ret, frame = self.cap.read()
                return ret, cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        except:
            print("Error: No video input!!!")

    def process(self):
        ret, self.current_frame = self.get_frame()
        faces = detector(self.current_frame, 0)
        if ret:
            self.update_fps()
            self.label_face_cnt["text"] = str(len(faces))
            if len(faces) != 0:
                for k, d in enumerate(faces):
                    self.face_ROI_width_start = d.left()
                    self.face_ROI_height_start = d.top()
                    self.face_ROI_height = (d.bottom() - d.top())
                    self.face_ROI_width = (d.right() - d.left())
                    self.hh = int(self.face_ROI_height / 2)
                    self.ww = int(self.face_ROI_width / 2)

                    if (d.right() + self.ww) > 640 or (d.bottom() + self.hh > 480) or (d.left() - self.ww < 0) or (d.top() - self.hh < 0):
                        self.label_warning["text"] = "OUT OF RANGE"
                        self.label_warning['fg'] = 'red'
                        self.out_of_range_flag = True
                        color_rectangle = (255, 0, 0)
                    else:
                        self.out_of_range_flag = False
                        self.label_warning["text"] = ""
                        color_rectangle = (255, 255, 255)
                    self.current_frame = cv2.rectangle(self.current_frame,
                                                       tuple([d.left() - self.ww, d.top() - self.hh]),
                                                       tuple([d.right() + self.ww, d.bottom() + self.hh]),
                                                       color_rectangle, 2)
            self.current_frame_faces_cnt = len(faces)
            img_Image = Image.fromarray(self.current_frame)
            img_PhotoImage = ImageTk.PhotoImage(image=img_Image)
            self.label.img_tk = img_PhotoImage
            self.label.configure(image=img_PhotoImage)
        self.win.after(20, self.process)

    def run(self):
        self.pre_work_mkdir()
        self.check_existing_faces_cnt()
        self.GUI_info()
        self.process()
        self.win.mainloop()

def return_128d_features(path_img):
    img_rd = cv2.imread(path_img)
    faces = detector(img_rd, 1)
    logging.info("%-40s %-20s", "检测到人脸的图像 / Image with faces detected:", path_img)
    if len(faces) != 0:
        shape = predictor(img_rd, faces[0])
        face_descriptor = face_reco_model.compute_face_descriptor(img_rd, shape)
    else:
        face_descriptor = 0
        logging.warning("no face")
    return face_descriptor

def return_features_mean_personX(path_face_personX):
    features_list_personX = []
    photos_list = os.listdir(path_face_personX)
    if photos_list:
        for i in range(len(photos_list)):
            logging.info("%-40s %-20s", "正在读的人脸图像 / Reading image:", path_face_personX + "/" + photos_list[i])
            features_128d = return_128d_features(path_face_personX + "/" + photos_list[i])
            if features_128d == 0:
                i += 1
            else:
                features_list_personX.append(features_128d)
    else:
        logging.warning("文件夹内图像文件为空 / Warning: No images in%s/", path_face_personX)
    if features_list_personX:
        features_mean_personX = np.array(features_list_personX, dtype=object).mean(axis=0)
    else:
        features_mean_personX = np.zeros(128, dtype=object, order='C')
    return features_mean_personX

def save_family_features(features, file_path):
    with open(file_path, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Feature'] + list(range(128)))  # Assuming 128 feature length
        for feature in features:
            writer.writerow(['Family Member'] + list(feature))

def main():
    logging.basicConfig(level=logging.INFO)
    Face_Register_con = Face_Register()
    Face_Register_con.run()

    person_list = os.listdir(r"family_member_data\\")
    person_list.sort()
    with open(r"family_member_data\family_features.csv", "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        for person in person_list:
            person_path = os.path.join(r"family_member_data\\", person)
            if os.path.isdir(person_path):
                logging.info("%sperson_%s", path_images_from_camera, person)
                features_mean_personX = return_features_mean_personX(path_images_from_camera + person)
                if len(person.split('_', 2)) == 2:
                    person_name = person
                else:
                    person_name = person.split('_', 2)[-1]
                features_mean_personX = np.insert(features_mean_personX, 0, person_name, axis=0)
                writer.writerow(features_mean_personX)
                logging.info('\n')
        logging.info("所有录入人脸数据存入 / Save all the features of faces registered into: data/family_features_to_csv.csv")
    family_features = pd.read_csv(r'family_member_data\family_features.csv',header=None) 
    visitor_features = pd.read_csv(r'visitor_data\visitor_features.csv',header=None)
    combined_features = pd.concat([family_features, visitor_features])
    combined_features.to_csv(r'combined_features.csv', index=False, header=False)
    print("合并完成，文件保存为 combined_features.csv")
if __name__ == '__main__':
    main()                 
