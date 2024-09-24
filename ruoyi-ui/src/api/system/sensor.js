import request from '@/utils/request'

// 查询传感器表列表
export function listSensor(query) {
  return request({
    url: '/system/sensor/list',
    method: 'get',
    params: query
  })
}

// 查询传感器表详细
export function getSensor(sensorId) {
  return request({
    url: '/system/sensor/' + sensorId,
    method: 'get'
  })
}

// 新增传感器表
export function addSensor(data) {
  return request({
    url: '/system/sensor',
    method: 'post',
    data: data
  })
}

// 修改传感器表
export function updateSensor(data) {
  return request({
    url: '/system/sensor',
    method: 'put',
    data: data
  })
}

// 删除传感器表
export function delSensor(sensorId) {
  return request({
    url: '/system/sensor/' + sensorId,
    method: 'delete'
  })
}
