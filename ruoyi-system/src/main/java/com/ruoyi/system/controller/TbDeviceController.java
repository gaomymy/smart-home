package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.util.StringUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.TbDeviceHistory;
import com.ruoyi.system.service.ITbDeviceHistoryService;
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
import com.ruoyi.system.domain.TbDevice;
import com.ruoyi.system.service.ITbDeviceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备管理Controller
 *
 * @author ruoyi
 * @date 2024-07-03
 */
@RestController
@RequestMapping("/system/device")
public class TbDeviceController extends BaseController
{
    @Autowired
    private ITbDeviceService tbDeviceService;
    @Autowired
    private ITbDeviceHistoryService tbDeviceHistoryService;

    /**
     * 查询设备管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:device:list')")
    @GetMapping("/list")
    public TableDataInfo list(TbDevice tbDevice)
    {
        startPage();
        List<TbDevice> list = tbDeviceService.selectTbDeviceList(tbDevice);
        return getDataTable(list);
    }

    /**
     * 导出设备管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:device:export')")
    @Log(title = "设备管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TbDevice tbDevice)
    {
        List<TbDevice> list = tbDeviceService.selectTbDeviceList(tbDevice);
        ExcelUtil<TbDevice> util = new ExcelUtil<TbDevice>(TbDevice.class);
        util.exportExcel(response, list, "设备管理数据");
    }

    /**
     * 获取设备管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:device:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tbDeviceService.selectTbDeviceById(id));
    }

    /**
     * 数据统计类型
     * @return
     */
    @GetMapping(value = "/getDeviceType")
    public AjaxResult getDeviceType()
    {
        return success(tbDeviceService.getDeviceType());
    }
    /**
     * 数据统计状态
     * @return
     */
    @GetMapping(value = "/getDeviceStatus")
    public AjaxResult getDeviceStatus()
    {
        return success(tbDeviceService.getDeviceStatus());
    }


    /**
     * 新增设备管理
     */
    @PreAuthorize("@ss.hasPermi('system:device:add')")
    @Log(title = "设备管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TbDevice tbDevice)
    {
        return toAjax(tbDeviceService.insertTbDevice(tbDevice));
    }

    /**
     * 修改设备管理
     */
    @PreAuthorize("@ss.hasPermi('system:device:edit')")
    @Log(title = "设备管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TbDevice tbDevice)
    {
        TbDevice tbDevice1 = tbDeviceService.selectTbDeviceById(tbDevice.getId());
        if (tbDevice1!=null && StringUtils.isNotEmpty(tbDevice1.getTemperature()) &&
                StringUtils.isNotEmpty(tbDevice.getTemperature()) &&
                !tbDevice1.getTemperature().equals(tbDevice.getTemperature())){
            TbDeviceHistory tbDeviceHistory = new TbDeviceHistory();
            tbDeviceHistory.setDeviceId(tbDevice.getId());
            tbDeviceHistory.setTemperature(tbDevice.getTemperature());
            tbDeviceHistory.setStatus(tbDevice.getStatus());
            tbDeviceHistory.setUpdateTime(DateUtils.getNowDate());
            tbDeviceHistoryService.insertTbDeviceHistory(tbDeviceHistory);
        }

        if (tbDevice1!=null && StringUtils.isNotEmpty(tbDevice1.getHumidity()) &&
                StringUtils.isNotEmpty(tbDevice.getHumidity()) &&
                !tbDevice1.getHumidity().equals(tbDevice.getHumidity())){
            TbDeviceHistory tbDeviceHistory = new TbDeviceHistory();
            tbDeviceHistory.setDeviceId(tbDevice.getId());
            tbDeviceHistory.setHumidity(tbDevice.getHumidity());
            tbDeviceHistory.setStatus(tbDevice.getStatus());
            tbDeviceHistory.setUpdateTime(DateUtils.getNowDate());
            tbDeviceHistoryService.insertTbDeviceHistory(tbDeviceHistory);
        }

        return toAjax(tbDeviceService.updateTbDevice(tbDevice));
    }

    /**
     * 删除设备管理
     */
    @PreAuthorize("@ss.hasPermi('system:device:remove')")
    @Log(title = "设备管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tbDeviceService.deleteTbDeviceByIds(ids));
    }
}
