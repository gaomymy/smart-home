package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 传感器表对象 sensor
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
public class Sensor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 传感器序号 */
    private Long sensorId;

    /** 房间序号 */
    @Excel(name = "房间序号")
    private Long roomId;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 计量数量 */
    @Excel(name = "计量数量")
    private Long measure;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    public void setSensorId(Long sensorId) 
    {
        this.sensorId = sensorId;
    }

    public Long getSensorId() 
    {
        return sensorId;
    }
    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setMeasure(Long measure) 
    {
        this.measure = measure;
    }

    public Long getMeasure() 
    {
        return measure;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sensorId", getSensorId())
            .append("roomId", getRoomId())
            .append("type", getType())
            .append("measure", getMeasure())
            .append("startTime", getStartTime())
            .toString();
    }
}
