package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.TbDeviceHistory;
import com.ruoyi.system.mapper.TbDeviceHistoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TbDeviceMapper;
import com.ruoyi.system.domain.TbDevice;
import com.ruoyi.system.service.ITbDeviceService;

/**
 * 设备管理Service业务层处理
 *
 * @author ruoyi
 * @date 2024-07-03
 */
@Service
public class TbDeviceServiceImpl implements ITbDeviceService
{
    @Autowired
    private TbDeviceMapper tbDeviceMapper;
    @Autowired
    private TbDeviceHistoryMapper tbDeviceHistoryMapper;

    /**
     * 查询设备管理
     *
     * @param id 设备管理主键
     * @return 设备管理
     */
    @Override
    public TbDevice selectTbDeviceById(Long id)
    {
        return tbDeviceMapper.selectTbDeviceById(id);
    }

    /**
     * 查询设备管理列表
     *
     * @param tbDevice 设备管理
     * @return 设备管理
     */
    @Override
    public List<TbDevice> selectTbDeviceList(TbDevice tbDevice)
    {
        return tbDeviceMapper.selectTbDeviceList(tbDevice);
    }

    /**
     * 新增设备管理
     *
     * @param tbDevice 设备管理
     * @return 结果
     */
    @Override
    public int insertTbDevice(TbDevice tbDevice)
    {
        return tbDeviceMapper.insertTbDevice(tbDevice);
    }

    /**
     * 修改设备管理
     *
     * @param tbDevice 设备管理
     * @return 结果
     */
    @Override
    public int updateTbDevice(TbDevice tbDevice)
    {
        return tbDeviceMapper.updateTbDevice(tbDevice);
    }

    /**
     * 批量删除设备管理
     *
     * @param ids 需要删除的设备管理主键
     * @return 结果
     */
    @Override
    public int deleteTbDeviceByIds(Long[] ids)
    {
        return tbDeviceMapper.deleteTbDeviceByIds(ids);
    }

    /**
     * 删除设备管理信息
     *
     * @param id 设备管理主键
     * @return 结果
     */
    @Override
    public int deleteTbDeviceById(Long id)
    {
        return tbDeviceMapper.deleteTbDeviceById(id);
    }

    @Override
    public  List<TbDevice>  getDeviceType() {
        return tbDeviceMapper.getDeviceType();
    }

    @Override
    public List<TbDevice> getDeviceStatus() {
        return tbDeviceMapper.getDeviceStatus();
    }
}
