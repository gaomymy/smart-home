package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Connection;

/**
 * 连接表Service接口
 *
 * @author ruoyi
 * @date 2024-07-14
 */
public interface IConnectionService
{
    /**
     * 查询连接表
     *
     * @param id 连接表主键
     * @return 连接表
     */
    public Connection selectConnectionById(Long id);

    /**
     * 查询连接表列表
     *
     * @param connection 连接表
     * @return 连接表集合
     */
    public List<Connection> selectConnectionList(Connection connection);

    /**
     * 新增连接表
     *
     * @param connection 连接表
     * @return 结果
     */
    public int insertConnection(Connection connection);

    /**
     * 修改连接表
     *
     * @param connection 连接表
     * @return 结果
     */
    public int updateConnection(Connection connection);

    /**
     * 批量删除连接表
     *
     * @param ids 需要删除的连接表主键集合
     * @return 结果
     */
    public int deleteConnectionByIds(Long[] ids);

    /**
     * 删除连接表信息
     *
     * @param id 连接表主键
     * @return 结果
     */
    public int deleteConnectionById(Long id);
}
