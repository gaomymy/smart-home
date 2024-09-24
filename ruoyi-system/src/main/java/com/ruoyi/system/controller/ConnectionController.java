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
import com.ruoyi.system.domain.Connection;
import com.ruoyi.system.service.IConnectionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 连接表Controller
 *
 * @author ruoyi
 * @date 2024-07-14
 */
@RestController
@RequestMapping("/system/connection")
public class ConnectionController extends BaseController
{
    @Autowired
    private IConnectionService connectionService;

    /**
     * 查询连接表列表
     */
    @PreAuthorize("@ss.hasPermi('system:connection:list')")
    @GetMapping("/list")
    public TableDataInfo list(Connection connection)
    {
        startPage();
        List<Connection> list = connectionService.selectConnectionList(connection);
        return getDataTable(list);
    }

    /**
     * 导出连接表列表
     */
    @PreAuthorize("@ss.hasPermi('system:connection:export')")
    @Log(title = "连接表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Connection connection)
    {
        List<Connection> list = connectionService.selectConnectionList(connection);
        ExcelUtil<Connection> util = new ExcelUtil<Connection>(Connection.class);
        util.exportExcel(response, list, "连接表数据");
    }

    /**
     * 获取连接表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:connection:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(connectionService.selectConnectionById(id));
    }

    /**
     * 新增连接表
     */
    @PreAuthorize("@ss.hasPermi('system:connection:add')")
    @Log(title = "连接表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Connection connection)
    {
        return toAjax(connectionService.insertConnection(connection));
    }

    /**
     * 修改连接表
     */
    @PreAuthorize("@ss.hasPermi('system:connection:edit')")
    @Log(title = "连接表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Connection connection)
    {
        return toAjax(connectionService.updateConnection(connection));
    }

    /**
     * 删除连接表
     */
    @PreAuthorize("@ss.hasPermi('system:connection:remove')")
    @Log(title = "连接表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(connectionService.deleteConnectionByIds(ids));
    }
}
