package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Room;
import com.ruoyi.system.service.IRoomService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房间表Controller
 *
 * @author ruoyi
 * @date 2024-07-14
 */
@RestController
@RequestMapping("/system/room")
public class RoomController extends BaseController
{
    @Autowired
    private IRoomService roomService;

    /**
     * 查询房间表列表
     */
    @PreAuthorize("@ss.hasPermi('system:room:list')")
    @GetMapping("/list")
    public TableDataInfo list(Room room)
    {
        startPage();
        List<Room> list = roomService.selectRoomList(room);
        return getDataTable(list);
    }

    /**
     * 导出房间表列表
     */
    @PreAuthorize("@ss.hasPermi('system:room:export')")
    @Log(title = "房间表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Room room)
    {
        List<Room> list = roomService.selectRoomList(room);
        ExcelUtil<Room> util = new ExcelUtil<Room>(Room.class);
        util.exportExcel(response, list, "房间表数据");
    }

    /**
     * 获取房间表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:room:query')")
    @GetMapping(value = "/{roomId}")
    public AjaxResult getInfo(@PathVariable("roomId") Long roomId)
    {
        return success(roomService.selectRoomByRoomId(roomId));
    }

    /**
     * 新增房间表
     */
    @PreAuthorize("@ss.hasPermi('system:room:add')")
    @Log(title = "房间表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Room room)
    {
        room.setUserId(SecurityUtils.getUserId());
        room.setUsername(SecurityUtils.getUsername());
        return toAjax(roomService.insertRoom(room));
    }

    /**
     * 修改房间表
     */
    @PreAuthorize("@ss.hasPermi('system:room:edit')")
    @Log(title = "房间表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Room room)
    {
        return toAjax(roomService.updateRoom(room));
    }

    /**
     * 删除房间表
     */
    @PreAuthorize("@ss.hasPermi('system:room:remove')")
    @Log(title = "房间表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomIds}")
    public AjaxResult remove(@PathVariable Long[] roomIds)
    {

        return toAjax(roomService.deleteRoomByRoomIds(roomIds));
    }
}
