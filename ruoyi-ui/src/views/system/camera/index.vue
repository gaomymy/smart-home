<template>
  <div class="camera-container">
    <div class="contain">
      <video ref="video" class="camera-video" autoplay></video>
      <div class="controls">
        <button @click="startCamera">开启摄像头</button>
        <button @click="stopCamera">关闭摄像头</button>
      </div>
    </div>
    <!-- 右侧显示实时值的列表 -->
    <div class="real-time-values">
      <ul>
        <li>总人数: {{ cameraData.total_people }}</li>
        <li>镜头中家庭成员: {{ cameraData.family_members.join(', ') }}</li>
        <li>镜头中客人的人数: {{ cameraData.guests }}</li>
        <li>镜头中陌生人的人数: {{ cameraData.strangers }}</li>
        <li v-for="(stranger, index) in cameraData.strangers_info" :key="index">
          陌生人{{ index + 1 }} - 年龄: {{ stranger.age }}, 性别: {{ stranger.gender }}
        </li>
        <li>家中是否有人摔倒: {{ cameraData.fall_detected ? '是' : '否' }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      cameraData: {
        total_people: 0,
        family_members: [],
        guests: 0,
        strangers: 0,
        strangers_info: [],
        fall_detected: false
      },
      monitoring: false  // 是否在监测摔倒
    };
  },
  mounted() {
    this.fetchCameraData();
    setInterval(this.fetchCameraData, 5000); // 每5秒获取一次数据
    document.addEventListener('visibilitychange', this.handleVisibilityChange);
  },
  methods: {
    // 获取摄像头数据
    async fetchCameraData() {
      try {
        const response = await axios.get('http://localhost:5000/get_fall_status');
        this.cameraData = response.data;
      } catch (error) {
        console.error('无法获取摄像头数据:', error);
      }
    },

    // 启动摄像头并启动摔倒监测
    async startCamera() {
      try {
        const stream = await navigator.mediaDevices.getUserMedia({ video: true });
        this.stream = stream;
        this.$refs.video.srcObject = stream;
        await this.startMonitoring();  // 启动摔倒监测
      } catch (err) {
        console.error("摄像头启动失败:", err);
      }
    },

    // 停止摄像头并停止摔倒监测
    async stopCamera() {
      if (this.stream) {
        this.stream.getTracks().forEach(track => track.stop());
        this.$refs.video.srcObject = null;
        await this.stopMonitoring();  // 停止摔倒监测
      }
    },

    // 请求后端启动摔倒监测
    async startMonitoring() {
      try {
        const response = await axios.post('http://localhost:5000/start_monitoring');
        console.log(response.data.status);
        this.monitoring = true;
      } catch (error) {
        console.error('无法启动监测:', error);
      }
    },

    // 请求后端停止摔倒监测
    async stopMonitoring() {
      try {
        const response = await axios.post('http://localhost:5000/stop_monitoring');
        console.log(response.data.status);
        this.monitoring = false;
      } catch (error) {
        console.error('无法停止监测:', error);
      }
    },

    // 处理页面可见性变化
    handleVisibilityChange() {
      if (document.visibilityState === 'hidden') {
        this.stopCamera();  // 页面隐藏时停止摄像头
      }
    }
  },
  beforeDestroy() {
    this.stopCamera();
    document.removeEventListener('visibilitychange', this.handleVisibilityChange);
  }
};
</script>

<style scoped>
.camera-container {
  display: flex;
  flex-direction: row;
  margin-top: 100px;
  margin-left: 120px;
}
.contain {
  display: flex;
  flex-direction: column;
}
.camera-video {
  width: 680px;
  height: 610px;
  border: 2px solid #000;
  object-fit: cover;
}

.controls {
  margin-top: 10px;
}

button {
  margin: 5px;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}

.real-time-values {
  margin-left: 50px;
  padding: 20px;
  background-color: #f4f4f4;
  border: 1px solid #ddd;
  border-radius: 10px;
}

.real-time-values ul {
  list-style-type: none;
  padding: 0;
}

.real-time-values li {
  margin-bottom: 10px;
  font-size: 16px;
}
</style>
