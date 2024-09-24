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
import com.ruoyi.system.domain.Sensor;
import com.ruoyi.system.service.ISensorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 传感器表Controller
 * 
 * @author ruoyi
 * @date 2024-07-14
 */
@RestController
@RequestMapping("/system/sensor")
public class SensorController extends BaseController
{
    @Autowired
    private ISensorService sensorService;

    /**
     * 查询传感器表列表
     */
    @PreAuthorize("@ss.hasPermi('system:sensor:list')")
    @GetMapping("/list")
    public TableDataInfo list(Sensor sensor)
    {
        startPage();
        List<Sensor> list = sensorService.selectSensorList(sensor);
        return getDataTable(list);
    }

    /**
     * 导出传感器表列表
     */
    @PreAuthorize("@ss.hasPermi('system:sensor:export')")
    @Log(title = "传感器表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Sensor sensor)
    {
        List<Sensor> list = sensorService.selectSensorList(sensor);
        ExcelUtil<Sensor> util = new ExcelUtil<Sensor>(Sensor.class);
        util.exportExcel(response, list, "传感器表数据");
    }

    /**
     * 获取传感器表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sensor:query')")
    @GetMapping(value = "/{sensorId}")
    public AjaxResult getInfo(@PathVariable("sensorId") Long sensorId)
    {
        return success(sensorService.selectSensorBySensorId(sensorId));
    }

    /**
     * 新增传感器表
     */
    @PreAuthorize("@ss.hasPermi('system:sensor:add')")
    @Log(title = "传感器表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Sensor sensor)
    {
        return toAjax(sensorService.insertSensor(sensor));
    }

    /**
     * 修改传感器表
     */
    @PreAuthorize("@ss.hasPermi('system:sensor:edit')")
    @Log(title = "传感器表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Sensor sensor)
    {
        return toAjax(sensorService.updateSensor(sensor));
    }

    /**
     * 删除传感器表
     */
    @PreAuthorize("@ss.hasPermi('system:sensor:remove')")
    @Log(title = "传感器表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sensorIds}")
    public AjaxResult remove(@PathVariable Long[] sensorIds)
    {
        return toAjax(sensorService.deleteSensorBySensorIds(sensorIds));
    }
}
