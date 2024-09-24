import request from '@/utils/request'

// 查询设备管理列表
export function listDevice(query) {
  return request({
    url: '/system/device/list',
    method: 'get',
    params: query
  })
}

export function getDeviceType() {
  return request({
    url: '/system/device/getDeviceType',
    method: 'get',
  })
}

export function getDeviceTemperature() {
  return request({
    url: '/system/history/getDeviceTemperature',
    method: 'get',
  })
}
export function getDeviceHumidity() {
  return request({
    url: '/system/history/getDeviceHumidity',
    method: 'get',
  })
}

// 查询设备管理详细
export function getDevice(id) {
  return request({
    url: '/system/device/' + id,
    method: 'get'
  })
}

// 新增设备管理
export function addDevice(data) {
  return request({
    url: '/system/device',
    method: 'post',
    data: data
  })
}



// 修改设备管理
export function updateDevice(data) {
  return request({
    url: '/system/device',
    method: 'put',
    data: data
  })
}

// 删除设备管理
export function delDevice(id) {
  return request({
    url: '/system/device/' + id,
    method: 'delete'
  })
}
