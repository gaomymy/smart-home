<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="deviceName">
        <el-input
          v-model="queryParams.deviceName"
          placeholder="请输入设备名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备类型" prop="deviceType">
        <el-select v-model="queryParams.deviceType" placeholder="请选择设备类型" clearable>
          <el-option
            v-for="dict in dict.type.sys_device_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label-width="90px"  label="设备序列号" prop="serialNumber">
        <el-input
          v-model="queryParams.serialNumber"
          placeholder="请输入设备序列号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="购买日期" prop="purchaseDate">
        <el-date-picker clearable
          v-model="queryParams.purchaseDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择购买日期">
        </el-date-picker>
      </el-form-item>
      <!-- <el-form-item label="房间序号" prop="roomId">
        <el-input
          v-model="queryParams.roomId"
          placeholder="请输入房间序号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="设备状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择设备状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_device"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
      <el-form-item>
      <el-switch
        v-model="lampSwitch"
        inactive-text="灯"
        @change="switchChange"
      >
      </el-switch>
      </el-form-item>
      <el-form-item>
      <el-switch
        v-model="airSwitch"
        inactive-text="空调"
        @change="switchChange"
      ></el-switch>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:device:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:device:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:device:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:device:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="deviceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="设备名称" align="center" prop="deviceName" />
      <el-table-column label="设备类型" align="center" prop="deviceType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_device_type" :value="scope.row.deviceType"/>
        </template>
      </el-table-column>
      <el-table-column label="设备序列号" align="center" prop="serialNumber" />
      <el-table-column label="购买日期" align="center" prop="purchaseDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.purchaseDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房间序号" align="center" prop="roomId" />
      <el-table-column label="保修期截止日期" align="center" prop="warrantyExp" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.warrantyExp, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="设备状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_device" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="设备所在位置"  align="center" prop="location" />
      <el-table-column label="温度℃" align="center" prop="temperature" />
      <el-table-column label="湿度" align="center" prop="humidity" />
      <el-table-column label="备注" align="center" prop="remarks" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:device:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:device:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改设备管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="设备名称" prop="deviceName">
          <el-input v-model="form.deviceName" placeholder="请输入设备名称" />
        </el-form-item>
        <el-form-item label="设备类型" prop="deviceType">
          <el-select v-model="form.deviceType" placeholder="请选择设备类型">
            <el-option
              v-for="dict in dict.type.sys_device_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="设备序列号" prop="serialNumber">
          <el-input v-model="form.serialNumber" placeholder="请输入设备序列号" />
        </el-form-item>
        <el-form-item label="购买日期" prop="purchaseDate">
          <el-date-picker clearable
            v-model="form.purchaseDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择购买日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="房间序号" prop="roomId">
          <!-- <el-input v-model="form.roomId" placeholder="请输入房间序号" /> -->
          <el-select v-model="form.roomId" placeholder="请选择房间序号">
            <el-option
              v-for="dict in roomList"
              :key="dict.roomId"
              :label="dict.roomId"
              :value="dict.roomId"
            ></el-option>
       </el-select>
        </el-form-item>
        <el-form-item label="保修期截止日期" prop="warrantyExp">
          <el-date-picker clearable
            v-model="form.warrantyExp"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择保修期截止日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="设备状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择设备状态">
            <el-option
              v-for="dict in dict.type.sys_device"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="设备所在位置" prop="location">
          <el-input v-model="form.location" placeholder="请输入设备所在位置" />
        </el-form-item>
        <el-form-item label="温度℃" prop="temperature">
          <el-input v-model="form.temperature" placeholder="请输入温度℃" />
        </el-form-item>
        <el-form-item label="湿度" prop="humidity">
          <el-input v-model="form.humidity" placeholder="请输入湿度" />
        </el-form-item>
        <el-form-item label="备注" prop="remarks">
          <el-input v-model="form.remarks" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDevice, getDevice, delDevice, addDevice, updateDevice } from "@/api/system/device";
import { listRoom } from "@/api/system/room";
export default {
  name: "Device",
  dicts: ['sys_device', 'sys_device_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      lampSwitch:false,
      airSwitch:false,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      roomList:[],
      // 设备管理表格数据
      deviceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceName: null,
        deviceType: null,
        serialNumber: null,
        purchaseDate: null,
        warrantyExp: null,
        status: null,
        location: null,
        remarks: null,
        roomId: null,
        humidity: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
   
  },
  methods: {
    /** 查询设备管理列表 */
    getList() {
      this.loading = true;
      listDevice(this.queryParams).then(response => {
        this.deviceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    switchChange(){
      console.log('this.lampSwitch',this.lampSwitch)
      if(this.lampSwitch || this.airSwitch){
      this.$modal.msgSuccess("设备已打开");
      }else{
          this.$modal.msgSuccess("设备已关闭");
      }
    },
    getRoomList() {
      // this.loading = true;
      listRoom(this.queryParams).then(response => {
        this.roomList = response.rows;
        console.log("this.",this.roomList)
        // this.total = response.total;
        this.loading = false;
      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        deviceName: null,
        deviceType: null,
        serialNumber: null,
        purchaseDate: null,
        warrantyExp: null,
        status: null,
        location: null,
        remarks: null,
        roomId: null,
        humidity: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.getRoomList();
      setTimeout(() => {
        this.reset();
        this.open = true;
        this.title = "添加设备管理";
      }, 100);
     
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDevice(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改设备管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDevice(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDevice(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除设备管理编号为"' + ids + '"的数据项？').then(function() {
        return delDevice(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/device/export', {
        ...this.queryParams
      }, `device_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
