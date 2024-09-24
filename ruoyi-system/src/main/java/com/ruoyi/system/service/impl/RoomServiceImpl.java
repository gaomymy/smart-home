package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RoomMapper;
import com.ruoyi.system.domain.Room;
import com.ruoyi.system.service.IRoomService;

/**
 * 房间表Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
@Service
public class RoomServiceImpl implements IRoomService 
{
    @Autowired
    private RoomMapper roomMapper;

    /**
     * 查询房间表
     * 
     * @param roomId 房间表主键
     * @return 房间表
     */
    @Override
    public Room selectRoomByRoomId(Long roomId)
    {
        return roomMapper.selectRoomByRoomId(roomId);
    }

    /**
     * 查询房间表列表
     * 
     * @param room 房间表
     * @return 房间表
     */
    @Override
    public List<Room> selectRoomList(Room room)
    {
        return roomMapper.selectRoomList(room);
    }

    /**
     * 新增房间表
     * 
     * @param room 房间表
     * @return 结果
     */
    @Override
    public int insertRoom(Room room)
    {
        return roomMapper.insertRoom(room);
    }

    /**
     * 修改房间表
     * 
     * @param room 房间表
     * @return 结果
     */
    @Override
    public int updateRoom(Room room)
    {
        return roomMapper.updateRoom(room);
    }

    /**
     * 批量删除房间表
     * 
     * @param roomIds 需要删除的房间表主键
     * @return 结果
     */
    @Override
    public int deleteRoomByRoomIds(Long[] roomIds)
    {
        return roomMapper.deleteRoomByRoomIds(roomIds);
    }

    /**
     * 删除房间表信息
     * 
     * @param roomId 房间表主键
     * @return 结果
     */
    @Override
    public int deleteRoomByRoomId(Long roomId)
    {
        return roomMapper.deleteRoomByRoomId(roomId);
    }
}
