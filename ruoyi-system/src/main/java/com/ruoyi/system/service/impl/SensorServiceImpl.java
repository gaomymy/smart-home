package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SensorMapper;
import com.ruoyi.system.domain.Sensor;
import com.ruoyi.system.service.ISensorService;

/**
 * 传感器表Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
@Service
public class SensorServiceImpl implements ISensorService 
{
    @Autowired
    private SensorMapper sensorMapper;

    /**
     * 查询传感器表
     * 
     * @param sensorId 传感器表主键
     * @return 传感器表
     */
    @Override
    public Sensor selectSensorBySensorId(Long sensorId)
    {
        return sensorMapper.selectSensorBySensorId(sensorId);
    }

    /**
     * 查询传感器表列表
     * 
     * @param sensor 传感器表
     * @return 传感器表
     */
    @Override
    public List<Sensor> selectSensorList(Sensor sensor)
    {
        return sensorMapper.selectSensorList(sensor);
    }

    /**
     * 新增传感器表
     * 
     * @param sensor 传感器表
     * @return 结果
     */
    @Override
    public int insertSensor(Sensor sensor)
    {
        return sensorMapper.insertSensor(sensor);
    }

    /**
     * 修改传感器表
     * 
     * @param sensor 传感器表
     * @return 结果
     */
    @Override
    public int updateSensor(Sensor sensor)
    {
        return sensorMapper.updateSensor(sensor);
    }

    /**
     * 批量删除传感器表
     * 
     * @param sensorIds 需要删除的传感器表主键
     * @return 结果
     */
    @Override
    public int deleteSensorBySensorIds(Long[] sensorIds)
    {
        return sensorMapper.deleteSensorBySensorIds(sensorIds);
    }

    /**
     * 删除传感器表信息
     * 
     * @param sensorId 传感器表主键
     * @return 结果
     */
    @Override
    public int deleteSensorBySensorId(Long sensorId)
    {
        return sensorMapper.deleteSensorBySensorId(sensorId);
    }
}
