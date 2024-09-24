package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备管理对象 tb_device
 *
 * @author ruoyi
 * @date 2024-07-03
 */
public class TbDevice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 设备类型 */
    @Excel(name = "设备类型")
    private String deviceType;

    /** 设备序列号 */
    @Excel(name = "设备序列号")
    private String serialNumber;
    private Integer serialNumber1;
    private String function1;

    private String sensorId;


    public String getSensorId() {
        return sensorId;
    }

    public void setSensorId(String sensorId) {
        this.sensorId = sensorId;
    }

    public Integer getSerialNumber1() {
        return serialNumber1;
    }

    public void setSerialNumber1(Integer serialNumber1) {
        this.serialNumber1 = serialNumber1;
    }

    public String getFunction1() {
        return function1;
    }

    public void setFunction1(String function1) {
        this.function1 = function1;
    }

    /** 购买日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "购买日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purchaseDate;

    /** 保修期截止日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "保修期截止日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date warrantyExp;

    /** 设备状态 */
    @Excel(name = "设备状态")
    private String status;

    /** 设备所在位置 */
    @Excel(name = "设备所在位置")
    private String location;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;
    private String count;
    /** 房间序号 */
    @Excel(name = "房间序号")
    private Long roomId;
    /** 温度 */
    @Excel(name = "温度")
    private String temperature;

    /** 湿度 */
    @Excel(name = "湿度")
    private String humidity;

    /** 压力 */
    @Excel(name = "压力")
    private String pressure;

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    public String getPressure() {
        return pressure;
    }

    public void setPressure(String pressure) {
        this.pressure = pressure;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setDeviceName(String deviceName)
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName()
    {
        return deviceName;
    }
    public void setDeviceType(String deviceType)
    {
        this.deviceType = deviceType;
    }

    public String getDeviceType()
    {
        return deviceType;
    }
    public void setSerialNumber(String serialNumber)
    {
        this.serialNumber = serialNumber;
    }

    public String getSerialNumber()
    {
        return serialNumber;
    }
    public void setPurchaseDate(Date purchaseDate)
    {
        this.purchaseDate = purchaseDate;
    }

    public Date getPurchaseDate()
    {
        return purchaseDate;
    }
    public void setWarrantyExp(Date warrantyExp)
    {
        this.warrantyExp = warrantyExp;
    }

    public Date getWarrantyExp()
    {
        return warrantyExp;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setLocation(String location)
    {
        this.location = location;
    }

    public String getLocation()
    {
        return location;
    }
    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getRemarks()
    {
        return remarks;
    }

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public Long getRoomId()
    {
        return roomId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("deviceName", getDeviceName())
                .append("deviceType", getDeviceType())
                .append("serialNumber", getSerialNumber())
                .append("purchaseDate", getPurchaseDate())
                .append("warrantyExp", getWarrantyExp())
                .append("status", getStatus())
                .append("location", getLocation())
                .append("remarks", getRemarks())
                .append("temperature", getTemperature())
                .append("roomId", getRoomId())
                .toString();
    }
}
