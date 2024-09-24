package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ConnectionMapper;
import com.ruoyi.system.domain.Connection;
import com.ruoyi.system.service.IConnectionService;

/**
 * 连接表Service业务层处理
 *
 * @author ruoyi
 * @date 2024-07-14
 */
@Service
public class ConnectionServiceImpl implements IConnectionService
{
    @Autowired
    private ConnectionMapper connectionMapper;

    /**
     * 查询连接表
     *
     * @param id 连接表主键
     * @return 连接表
     */
    @Override
    public Connection selectConnectionById(Long id)
    {
        return connectionMapper.selectConnectionById(id);
    }

    /**
     * 查询连接表列表
     *
     * @param connection 连接表
     * @return 连接表
     */
    @Override
    public List<Connection> selectConnectionList(Connection connection)
    {
        return connectionMapper.selectConnectionList(connection);
    }

    /**
     * 新增连接表
     *
     * @param connection 连接表
     * @return 结果
     */
    @Override
    public int insertConnection(Connection connection)
    {
        return connectionMapper.insertConnection(connection);
    }

    /**
     * 修改连接表
     *
     * @param connection 连接表
     * @return 结果
     */
    @Override
    public int updateConnection(Connection connection)
    {
        return connectionMapper.updateConnection(connection);
    }

    /**
     * 批量删除连接表
     *
     * @param ids 需要删除的连接表主键
     * @return 结果
     */
    @Override
    public int deleteConnectionByIds(Long[] ids)
    {
        return connectionMapper.deleteConnectionByIds(ids);
    }

    /**
     * 删除连接表信息
     *
     * @param id 连接表主键
     * @return 结果
     */
    @Override
    public int deleteConnectionById(Long id)
    {
        return connectionMapper.deleteConnectionById(id);
    }
}
