package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Room;

/**
 * 房间表Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
public interface RoomMapper 
{
    /**
     * 查询房间表
     * 
     * @param roomId 房间表主键
     * @return 房间表
     */
    public Room selectRoomByRoomId(Long roomId);

    /**
     * 查询房间表列表
     * 
     * @param room 房间表
     * @return 房间表集合
     */
    public List<Room> selectRoomList(Room room);

    /**
     * 新增房间表
     * 
     * @param room 房间表
     * @return 结果
     */
    public int insertRoom(Room room);

    /**
     * 修改房间表
     * 
     * @param room 房间表
     * @return 结果
     */
    public int updateRoom(Room room);

    /**
     * 删除房间表
     * 
     * @param roomId 房间表主键
     * @return 结果
     */
    public int deleteRoomByRoomId(Long roomId);

    /**
     * 批量删除房间表
     * 
     * @param roomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRoomByRoomIds(Long[] roomIds);
}
