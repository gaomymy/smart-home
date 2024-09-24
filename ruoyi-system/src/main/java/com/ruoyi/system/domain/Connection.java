package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 连接表对象 connection
 *
 * @author ruoyi
 * @date 2024-07-14
 */
public class Connection extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 传感器序号 */
    @Excel(name = "传感器序号")
    private Long sensorId;

    /** 设备序号 */
    @Excel(name = "设备序号")
    private Long deviceId;

    /** 序列号 */
    @Excel(name = "序列号")
    private Long serialNumber;

    /** 功能 */
    @Excel(name = "功能")
    private String function1;

    /** 主键id */
    private Long id;

    public void setSensorId(Long sensorId)
    {
        this.sensorId = sensorId;
    }

    public Long getSensorId()
    {
        return sensorId;
    }
    public void setDeviceId(Long deviceId)
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId()
    {
        return deviceId;
    }
    public void setSerialNumber(Long serialNumber)
    {
        this.serialNumber = serialNumber;
    }

    public Long getSerialNumber()
    {
        return serialNumber;
    }
    public void setFunction1(String function1)
    {
        this.function1 = function1;
    }

    public String getFunction1()
    {
        return function1;
    }
    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("sensorId", getSensorId())
                .append("deviceId", getDeviceId())
                .append("serialNumber", getSerialNumber())
                .append("function1", getFunction1())
                .append("id", getId())
                .toString();
    }
}
