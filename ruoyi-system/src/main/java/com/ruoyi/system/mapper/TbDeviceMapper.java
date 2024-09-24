package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TbDevice;

/**
 * 设备管理Mapper接口
 *
 * @author ruoyi
 * @date 2024-07-03
 */
public interface TbDeviceMapper
{
    /**
     * 查询设备管理
     *
     * @param id 设备管理主键
     * @return 设备管理
     */
    public TbDevice selectTbDeviceById(Long id);

    /**
     * 查询设备管理列表
     *
     * @param tbDevice 设备管理
     * @return 设备管理集合
     */
    public List<TbDevice> selectTbDeviceList(TbDevice tbDevice);

    /**
     * 新增设备管理
     *
     * @param tbDevice 设备管理
     * @return 结果
     */
    public int insertTbDevice(TbDevice tbDevice);

    /**
     * 修改设备管理
     *
     * @param tbDevice 设备管理
     * @return 结果
     */
    public int updateTbDevice(TbDevice tbDevice);

    /**
     * 删除设备管理
     *
     * @param id 设备管理主键
     * @return 结果
     */
    public int deleteTbDeviceById(Long id);

    /**
     * 批量删除设备管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTbDeviceByIds(Long[] ids);

    public List<TbDevice>  getDeviceType();

    List<TbDevice> getDeviceStatus();

}
