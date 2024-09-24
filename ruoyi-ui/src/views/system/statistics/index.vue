<template>
  <div class="app-container">
    <el-container>

      <el-row>
        <div id="img1" style="width: 600px;height:400px;"></div>
        <div id="img2" style="width: 600px;height:400px;"></div>
      </el-row>

      <el-row  >
        <div id="img3" style="width: 600px;height:400px;"></div>
        <div id="img4" style="width: 600px;height:400px;"></div>
      </el-row>

  </el-container>

</div>

</template>

<script>
import { getDeviceType,getDeviceTemperature,getDeviceHumidity } from "@/api/system/device";
import { set } from "nprogress";

export default {
  // name: 'StatisticOverview',
  dicts: ['sys_device', 'sys_device_type'],
  data () {
    return {
      examNames: [],
      passRate: [],
      //横柱状图
      examNames1: [],
      passRate1: [],
      //饼图的数据
      pieData: [],
      temperatureNames: [],
      temperatureRate: []
    }
  },
  created () {

     setTimeout(() => {
         this.getExamPassRate();
         this.getDeviceTemp();
    this.getExamNumbers()
    this.getDeviceHumi();
    }, 1000);
 
  },
  methods: {
    async getExamPassRate () {
      await getDeviceType().then((resp) => {
            let arr1=[]
            let arr2=[]
              let arr =[]
        if (resp.code === 200) {
          console.log('resp=',resp)
          console.log('sys_device_type',this.dict.type.sys_device_type)
            this.dict.type.sys_device_type.forEach(element => {
              resp.data.forEach(ele=>{
              if(ele.deviceType==element.value){
                arr2.push(element.label);
                arr1.push(ele.count);
              }
            })
            });
         
          console.log("=11==arr1==",arr1)
                    console.log("==22=arr2==",arr2)

            arr.push(arr2.join(","))
          arr.push(arr1.join(","))
         console.log("arr",arr)
          this.examNames = arr[0].split(',')
          this.passRate = arr[1].split(',')
          console.log("=== this.passRate ===", this.passRate )
          this.drawLine()
          // this.drawBrokenLine()
          // this.drawImg4()
        }
      })
    },
    async getDeviceTemp() {
      await getDeviceTemperature().then((resp) => {
            let arr1=[]
            let arr2=[]
              let arr =[]
        if (resp.code === 200) {
          //todo
          console.log('resp=',resp)
              resp.data.forEach(ele=>{
                console.log(ele.updateTime,"===")
                let formattedDate = this.formatISODateTime(ele.updateTime);
                arr2.push(formattedDate);
                arr1.push(ele.temperature);
              // }
            })
            // });
           
          console.log("=11==arr1==",arr1)
                    console.log("==22=arr2==",arr2)

            arr.push(arr2.join(","))
          arr.push(arr1.join(","))
         console.log("arr",arr)
          this.temperatureNames = arr[0].split(',')
          this.temperatureRate = arr[1].split(',')
          console.log("=== this.passRate ===", this.passRate )
          // this.drawLine()
          this.drawBrokenLine()
          // this.drawImg4()
        }
      })
    },
   


     formatISODateTime(isoString) {
    const date = new Date(isoString);
    const padZero = (num) => (num < 10 ? '0' : '') + num;

    const year = date.getFullYear();
    const month = padZero(date.getMonth() + 1); // 月份从0开始，因此加1
    const day = padZero(date.getDate());
    const hours = padZero(date.getHours());
    const minutes = padZero(date.getMinutes());
    const seconds = padZero(date.getSeconds());

    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
},
    drawLine () {
      // 基于准备好的dom，初始化echarts实例
      let myChart= this.$echarts.init(document.getElementById('img1'))
      // 绘制图表
      myChart.setOption({
        title: {
          text: '统计柱状图',
          subtext: 'dashbord1',
          x: 'center',
          y: 'top',
          textAlign: 'center'
        },
        tooltip: {},
        xAxis: {
         type: 'category',
          data: this.examNames
        },
        yAxis: {
        type: 'value',
        axisTick:{
            show: false //不显示坐标轴刻度线
         },
        axisLine: {
            show: false, //不显示坐标轴线
         },
        },
        series: [{
          name: '',
          type: 'bar',
          data: this.passRate,
          showBackground: true,
          itemStyle: {
              normal: {
                color: function (params) {
                  let colorList = [
                    // 每根颜色顺序
                     "rgba(255, 156, 71, 0.39)",
                    "#00CED1",
                    "#3a8ee6",
                    "#5daf34",
                   "#cf9236",
                    "rgba(255, 91, 71, 0.39)",
                    "rgba(255, 91, 71, 0.39)",
                  ];
                  return colorList[params.dataIndex];
                },
              },
            },
        }]
      })
    },
   async  getExamNumbers () {
      await getDeviceType().then((resp) => {

          console.log("res===",resp)
        
            let arr1=[]
            let arr2=[]
            let arr =[]
            this.dict.type.sys_device_type.forEach(element => {
              resp.data.forEach(ele=>{
              if(ele.deviceType==element.value){
                arr2.push(element.label);
                arr1.push(ele.count);
              }
            })
            });
          console.log("===arr1==",arr1)
                    console.log("===arr2==",arr2)

          arr.push(arr2.join(","))
          arr.push(arr1.join(","))
      let examNames =  arr[0].split(',')
          let examNumbers = arr[1].split(',')
          console.log("==examNames===",examNames)
          console.log("==examNumbers===",examNumbers)
        examNames.forEach((item, index) => {
          this.pieData.push({
            name: item,
            value: parseInt(examNumbers[index])
          })
        })
        this.drawPie()
      })
    },
    async getDeviceHumi() {
      await getDeviceHumidity().then((resp) => {
            let arr1=[]
            let arr2=[]
              let arr =[]
        if (resp.code === 200) {
          //todo
          console.log('resp=',resp)
              resp.data.forEach(ele=>{
                console.log(ele.updateTime,"===")
                let formattedDate = this.formatISODateTime(ele.updateTime);
                arr2.push(formattedDate);
                arr1.push(ele.humidity);
            })
            arr.push(arr2.join(","))
          arr.push(arr1.join(","))
         console.log("arr",arr)
          this.examNames1 = arr[0].split(',')
          this.passRate1 = arr[1].split(',')
          
     
          console.log('temperatureNames=', this.examNames1)
          console.log('temperatureRate=',this.passRate1 )
          // this.drawLine()
          // this.drawBrokenLine()
          this.drawImg4()
        }
      })
    },








    //电影次数饼图
    drawPie () {
      // 基于准备好的dom，初始化echarts实例
      let myChart= this.$echarts.init(document.getElementById('img2'))
      myChart.setOption({
        title: {
          text: '统计饼图',
          subtext: 'dashbord2',
          x: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c}次 ({d}%)'
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: this.pieData
        },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: false },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
        series: [
          {
            name: '电影次数',
            type: 'pie',
            radius: ['20%', '70%'], // 设置饼图的内半径和外半径，实现边框的效果
            data: this.pieData,
            center: ['50%', '50%'],
            roseType: 'area',
            itemStyle: {
                borderRadius: 100
              },
            itemStyle: {
              normal: {
                shadowBlur: 200,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            },
            itemStyle: {
              normal: {
                color: function (params) {
                  let colorList = [
                    // 每根颜色顺序
                   "rgba(255, 156, 71, 0.39)",
                    "#00CED1",
                    "#3a8ee6",
                    "#5daf34",
                    "#cf9236",
                    "rgba(255, 91, 71, 0.39)",
                    "rgba(255, 91, 71, 0.39)",
                  ];
                  return colorList[params.dataIndex];
                },
              },
            },
          }
        ]
      })
    },
    //通过率的折线图
    drawBrokenLine () {
      //初始化ehcharts实例
      let myChart = this.$echarts.init(document.getElementById('img3'))
      //指定图表的配置项和数据
      var option = {
        //标题
        title: {
          text: '统计折线图',
          x: 'center'
        },
        //x轴
        xAxis: {
          data: this.temperatureNames
        },
        // this.temperatureNames = arr[0].split(',')
        // this.temperatureRate 
        //y轴没有显式设置，根据值自动生成y轴
        yAxis: {},
        //数据-data是最终要显示的数据
        series: [{
          name: '',
          type: 'line',
          areaStyle: {
            normal: {color: '#FFFAFA'}
          },
          itemStyle: {//设置端点颜色
              normal: {
                color: '#409eff' // 设置线条上点的颜色（和图例的颜色）
              }
          },
          data: this.temperatureRate,
          
        }],
      }
      //使用刚刚指定的配置项和数据项显示图表
      myChart.setOption(option)
    },
    drawImg4 () {
      let  myChart = this.$echarts.init(document.getElementById('img4'))
      myChart.setOption({
        color: ['#cd5c5c'],
        textStyle: {
          color: 'black'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          },
          formatter: '{a} <br/>{b} : {c}'
        },

        grid: {
          containLabel: true
        },
        xAxis: {
          type: 'value',
          boundaryGap: [0, 0.01],
          axisLine: {
            lineStyle: {
              color: '#fff'
            },
          },
          'axisLabel': {
            'interval': 0,
            fontSize: 18,
            formatter: '{value}',
          }
        },
        yAxis: {
          axisLine: {
            lineStyle: {
              color: '#fff'
            },
          },
          'axisLabel': {
            'interval': 0,
            fontSize: 18,
          },
          type: 'category',
          data: this.examNames1
        },

        // examNames1 passRate1
        series: [{
          name: '',
          type: 'bar',
          data: this.passRate1,
          itemStyle: {
              normal: {
                color: function (params) {
                  let colorList = [
                    // 每根颜色顺序
                     "rgba(255, 156, 71, 0.39)",
                    "#00CED1",
                    "#3a8ee6",
                    "#5daf34",
                   "#cf9236",
                    "rgba(255, 91, 71, 0.39)",
                    "rgba(255, 91, 71, 0.39)",
                  ];
                  return colorList[params.dataIndex];
                },
              },
            },
          
        }]
      })
    }
  }
}
</script>

<style scoped lang="scss">

.el-container {
  width: 100%;
  height: 100%;
}

.el-container {
  animation: leftMoveIn .7s ease-in;
  #img3{
    left: 430px !important;
  }
}

@keyframes leftMoveIn {
  0% {
    transform: translateX(-100%);
    opacity: 0;
  }
  100% {
    transform: translateX(0%);
    opacity: 1;
  }
}
</style>
