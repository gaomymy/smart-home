package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TbDeviceHistoryMapper;
import com.ruoyi.system.domain.TbDeviceHistory;
import com.ruoyi.system.service.ITbDeviceHistoryService;

/**
 * 设备历史数据Service业务层处理
 *
 * @author ruoyi
 * @date 2024-07-04
 */
@Service
public class TbDeviceHistoryServiceImpl implements ITbDeviceHistoryService
{
    @Autowired
    private TbDeviceHistoryMapper tbDeviceHistoryMapper;

    /**
     * 查询设备历史数据
     *
     * @param id 设备历史数据主键
     * @return 设备历史数据
     */
    @Override
    public TbDeviceHistory selectTbDeviceHistoryById(Long id)
    {
        return tbDeviceHistoryMapper.selectTbDeviceHistoryById(id);
    }

    /**
     * 查询设备历史数据列表
     *
     * @param tbDeviceHistory 设备历史数据
     * @return 设备历史数据
     */
    @Override
    public List<TbDeviceHistory> selectTbDeviceHistoryList(TbDeviceHistory tbDeviceHistory)
    {
        return tbDeviceHistoryMapper.selectTbDeviceHistoryList(tbDeviceHistory);
    }

    /**
     * 新增设备历史数据
     *
     * @param tbDeviceHistory 设备历史数据
     * @return 结果
     */
    @Override
    public int insertTbDeviceHistory(TbDeviceHistory tbDeviceHistory)
    {
        return tbDeviceHistoryMapper.insertTbDeviceHistory(tbDeviceHistory);
    }

    /**
     * 修改设备历史数据
     *
     * @param tbDeviceHistory 设备历史数据
     * @return 结果
     */
    @Override
    public int updateTbDeviceHistory(TbDeviceHistory tbDeviceHistory)
    {
        tbDeviceHistory.setUpdateTime(DateUtils.getNowDate());
        return tbDeviceHistoryMapper.updateTbDeviceHistory(tbDeviceHistory);
    }

    /**
     * 批量删除设备历史数据
     *
     * @param ids 需要删除的设备历史数据主键
     * @return 结果
     */
    @Override
    public int deleteTbDeviceHistoryByIds(Long[] ids)
    {
        return tbDeviceHistoryMapper.deleteTbDeviceHistoryByIds(ids);
    }

    /**
     * 删除设备历史数据信息
     *
     * @param id 设备历史数据主键
     * @return 结果
     */
    @Override
    public int deleteTbDeviceHistoryById(Long id)
    {
        return tbDeviceHistoryMapper.deleteTbDeviceHistoryById(id);
    }

    @Override
    public List<TbDeviceHistory> getDeviceTemperature() {
        return tbDeviceHistoryMapper.getDeviceTemperature();
    }

    @Override
    public List<TbDeviceHistory> getDeviceHumidity() {
        return tbDeviceHistoryMapper.getDeviceHumidity();
    }
}
