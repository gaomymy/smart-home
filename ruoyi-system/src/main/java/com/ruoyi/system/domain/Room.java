package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房间表对象 room
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
public class Room extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房间序号 */
    private Long roomId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roomId", getRoomId())
            .append("userId", getUserId())
            .append("type", getType())
            .append("username", getUsername())
            .toString();
    }
}
