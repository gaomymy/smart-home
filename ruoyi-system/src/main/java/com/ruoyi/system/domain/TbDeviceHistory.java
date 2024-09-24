package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 设备历史数据对象 tb_device_history
 *
 * @author ruoyi
 * @date 2024-07-04
 */
public class TbDeviceHistory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 设备id */
    @Excel(name = "设备id")
    private Long deviceId;

    /** 更新时间 */
    private Date updateTime;

    /** 温度 */
    @Excel(name = "温度")
    private String temperature;

    /** 湿度 */
    @Excel(name = "湿度")
    private String humidity;

    /** 压力 */
    @Excel(name = "压力")
    private String pressure;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setDeviceId(Long deviceId)
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId()
    {
        return deviceId;
    }
    public void setTemperature(String temperature)
    {
        this.temperature = temperature;
    }

    public String getTemperature()
    {
        return temperature;
    }
    public void setHumidity(String humidity)
    {
        this.humidity = humidity;
    }

    public String getHumidity()
    {
        return humidity;
    }
    public void setPressure(String pressure)
    {
        this.pressure = pressure;
    }

    public String getPressure()
    {
        return pressure;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deviceId", getDeviceId())
            .append("updateTime", getUpdateTime())
            .append("temperature", getTemperature())
            .append("humidity", getHumidity())
            .append("pressure", getPressure())
            .append("status", getStatus())
            .toString();
    }
}
