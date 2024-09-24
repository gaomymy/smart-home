package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Sensor;

/**
 * 传感器表Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
public interface SensorMapper 
{
    /**
     * 查询传感器表
     * 
     * @param sensorId 传感器表主键
     * @return 传感器表
     */
    public Sensor selectSensorBySensorId(Long sensorId);

    /**
     * 查询传感器表列表
     * 
     * @param sensor 传感器表
     * @return 传感器表集合
     */
    public List<Sensor> selectSensorList(Sensor sensor);

    /**
     * 新增传感器表
     * 
     * @param sensor 传感器表
     * @return 结果
     */
    public int insertSensor(Sensor sensor);

    /**
     * 修改传感器表
     * 
     * @param sensor 传感器表
     * @return 结果
     */
    public int updateSensor(Sensor sensor);

    /**
     * 删除传感器表
     * 
     * @param sensorId 传感器表主键
     * @return 结果
     */
    public int deleteSensorBySensorId(Long sensorId);

    /**
     * 批量删除传感器表
     * 
     * @param sensorIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSensorBySensorIds(Long[] sensorIds);
}
