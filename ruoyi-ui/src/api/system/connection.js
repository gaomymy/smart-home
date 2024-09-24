import request from '@/utils/request'

// 查询连接表列表
export function listConnection(query) {
  return request({
    url: '/system/connection/list',
    method: 'get',
    params: query
  })
}

// 查询连接表详细
export function getConnection(id) {
  return request({
    url: '/system/connection/' + id,
    method: 'get'
  })
}

// 新增连接表
export function addConnection(data) {
  return request({
    url: '/system/connection',
    method: 'post',
    data: data
  })
}

// 修改连接表
export function updateConnection(data) {
  return request({
    url: '/system/connection',
    method: 'put',
    data: data
  })
}

// 删除连接表
export function delConnection(id) {
  return request({
    url: '/system/connection/' + id,
    method: 'delete'
  })
}
