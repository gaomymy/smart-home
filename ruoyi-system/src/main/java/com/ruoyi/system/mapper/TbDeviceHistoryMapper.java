package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TbDeviceHistory;

/**
 * 设备历史数据Mapper接口
 *
 * @author ruoyi
 * @date 2024-07-04
 */
public interface TbDeviceHistoryMapper
{
    /**
     * 查询设备历史数据
     *
     * @param id 设备历史数据主键
     * @return 设备历史数据
     */
    public TbDeviceHistory selectTbDeviceHistoryById(Long id);

    /**
     * 查询设备历史数据列表
     *
     * @param tbDeviceHistory 设备历史数据
     * @return 设备历史数据集合
     */
    public List<TbDeviceHistory> selectTbDeviceHistoryList(TbDeviceHistory tbDeviceHistory);

    /**
     * 新增设备历史数据
     *
     * @param tbDeviceHistory 设备历史数据
     * @return 结果
     */
    public int insertTbDeviceHistory(TbDeviceHistory tbDeviceHistory);

    /**
     * 修改设备历史数据
     *
     * @param tbDeviceHistory 设备历史数据
     * @return 结果
     */
    public int updateTbDeviceHistory(TbDeviceHistory tbDeviceHistory);

    /**
     * 删除设备历史数据
     *
     * @param id 设备历史数据主键
     * @return 结果
     */
    public int deleteTbDeviceHistoryById(Long id);

    /**
     * 批量删除设备历史数据
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTbDeviceHistoryByIds(Long[] ids);

    List<TbDeviceHistory> getDeviceTemperature();

    List<TbDeviceHistory> getDeviceHumidity();
}
