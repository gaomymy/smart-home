package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.TbDeviceHistory;
import com.ruoyi.system.service.ITbDeviceHistoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备历史数据Controller
 *
 * @author ruoyi
 * @date 2024-07-04
 */
@RestController
@RequestMapping("/system/history")
public class TbDeviceHistoryController extends BaseController
{
    @Autowired
    private ITbDeviceHistoryService tbDeviceHistoryService;

    /**
     * 查询设备历史数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:history:list')")
    @GetMapping("/list")
    public TableDataInfo list(TbDeviceHistory tbDeviceHistory)
    {
        startPage();
        List<TbDeviceHistory> list = tbDeviceHistoryService.selectTbDeviceHistoryList(tbDeviceHistory);
        return getDataTable(list);
    }

    /**
     * 导出设备历史数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:history:export')")
    @Log(title = "设备历史数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TbDeviceHistory tbDeviceHistory)
    {
        List<TbDeviceHistory> list = tbDeviceHistoryService.selectTbDeviceHistoryList(tbDeviceHistory);
        ExcelUtil<TbDeviceHistory> util = new ExcelUtil<TbDeviceHistory>(TbDeviceHistory.class);
        util.exportExcel(response, list, "设备历史数据数据");
    }

    /**
     * 获取设备历史数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:history:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbDeviceHistoryService.selectTbDeviceHistoryById(id));
    }

    /**
     * 新增设备历史数据
     */
    @PreAuthorize("@ss.hasPermi('system:history:add')")
    @Log(title = "设备历史数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TbDeviceHistory tbDeviceHistory)
    {
        return toAjax(tbDeviceHistoryService.insertTbDeviceHistory(tbDeviceHistory));
    }

    /**
     * 修改设备历史数据
     */
    @PreAuthorize("@ss.hasPermi('system:history:edit')")
    @Log(title = "设备历史数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TbDeviceHistory tbDeviceHistory)
    {
        return toAjax(tbDeviceHistoryService.updateTbDeviceHistory(tbDeviceHistory));
    }

    /**
     * 删除设备历史数据
     */
    @PreAuthorize("@ss.hasPermi('system:history:remove')")
    @Log(title = "设备历史数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbDeviceHistoryService.deleteTbDeviceHistoryByIds(ids));
    }

    @GetMapping(value = "/getDeviceTemperature")
    public AjaxResult getDeviceTemperature()
    {
        List<TbDeviceHistory> deviceTemperature = tbDeviceHistoryService.getDeviceTemperature();
        return success(deviceTemperature);
    }

    @GetMapping(value = "/getDeviceHumidity")
    public AjaxResult getDeviceHumidity()
    {
        List<TbDeviceHistory> deviceTemperature = tbDeviceHistoryService.getDeviceHumidity();
        return success(deviceTemperature);
    }

}
