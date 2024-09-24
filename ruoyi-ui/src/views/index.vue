<template>
  <div class="app-container home">
    <!-- 添加视频 -->
    <video class="background-video" autoplay loop muted>
      <source src="../assets/images/video.mp4" type="video/mp4">
      您的浏览器不支持 HTML5 视频。
    </video>
  </div>
</template>

<script>
export default {
  name: "Index",
};
</script>

<style scoped lang="scss">
.app-container {
  position: relative;
  width: 100%; /* 视口宽度 */
  height: calc(100vh - 82px); /* 视口高度 */
  overflow: hidden; /* 防止内容溢出 */
}

.background-video {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 100%;
  height: 100%;
  object-fit: cover; /* 确保视频覆盖整个元素 */
  transform: translate(-50%, -50%);
  z-index: -1; /* 将视频置于其他内容之后 */
}
</style>
