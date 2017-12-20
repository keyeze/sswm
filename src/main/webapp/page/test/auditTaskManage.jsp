<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CMDB-审计任务管理页面</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/lib/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/css/jquery-custom-init.css">
<script type="text/javascript">
	var ctx ="<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/lib/custom/plugins/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/functionmodule/cmdbmanage/js/auditTaskManage.js"></script>

</head>
<body class="easyui-layout" border="false">
	<div data-options="region:'north'" style="height: 120px;" border="false">
		<div id="grid_search_div" class="datagrid-toolbar">
			<label>操作</label> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="dynamic-tbar-icon-search" onclick="ATMfn.QueryAuditTask();">查询</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="dynamic-tbar-icon-reset" onclick="ATMfn.ClearAuditTask()">重置</a>
		</div>
		<div style="padding: 5px 0px 0px 10px;">
			<table border="0" width="97%">
				<tr>
					<td width="100px">调度名称：</td>
					<td width="180px"><input class="easyui-textbox" id="sel_name" name="sel_name" style="width: 165px;"></input></td>
					<td width="100px">描述：</td>
					<td width="180px"><input class="easyui-textbox" id="sel_describe" name="sel_describe" style="width: 165px;"></input></td>
				</tr>
			</table>
		</div>
	</div>
	<div data-options="region:'center'" border="false">
		<table id="audit_grid" ></table>
	</div>
	<div id="audit_add_win"  align="center">
		<div style="padding-left: 35px">
			<table border="0" width="97%" cellpadding="10">
				<tr>
					<td width="500px" colspan="3">调度名称：<input class="easyui-textbox" type="text" id="name" name="name" style="width: 375px;"></input></td>
				</tr>
				<tr>
					<td width="150px">
						<table id="wait_audit_project_grid" class="easyui-datagrid" data-options="fitColumns:true" style="width: 180px; height: 180px">
							<thead>
								<tr>
									<th data-options="field:'id',hidden : true">ID</th>
									<th data-options="field:'name',width:150">待审计项</th>
								</tr>
							</thead>
						</table>
					</td>
					<td align="center"><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="ATMfn.AddAuditProject()"></a><br>
						<p>
							<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" onclick="ATMfn.DelAuditProject()"></a></td>
					<td>
						<table id="audit_project_grid" class="easyui-datagrid" data-options="fitColumns:true" style="width: 180px; height: 180px">
							<thead>
								<tr>
									<th data-options="field:'id',hidden : true">ID</th>
									<th data-options="field:'name',width:150">审计项</th>
								</tr>
							</thead>
						</table>
					</td>
				</tr>
				<tr>
					<td valign="middle" colspan="3">
							抽样范围：<select id="samplingrange" class="easyui-combobox" data-options="panelHeight:'auto'" name="samplingrange" style="width: 150px;">
									<option value="20%" selected="selected">20%</option>
									<option value="50%">50%</option>
									<option value="80%">80%</option>
									<option value="100%">100%</option>
							</select>
					</td>
				</tr>
				<tr>
					<td width="500px" colspan="3">触发规则：<input id="minute" name="minute" value="*">分
					<input id="hour" name="hour" value="*">时
					<input id="day" name="day" value="*">日
					<input id="month" name="month" value="*">月
					<input id="year" name="year" value="*">年
					</td>
				</tr>
				<tr>
					<td width="500px" colspan="3">描&nbsp;&nbsp;述：<input class="easyui-textbox" data-options="multiline:true" id="describe" name="describe" style="width: 375px; height: 40px;"></input></td>
				</tr>
			</table>
		</div>

		<div id="btn-div" style="postion:relative;padding-top: 20px;height: 30px"  border="false" >
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'dynamic-tbar-icon-add'" onclick="ATMfn.AddAuditTask();">生成调度任务</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'dynamic-tbar-icon-reset'" onclick="ATMfn.ResetAuditTask();">重置</a>
		</div>
	</div>
	<div id="execution_situation_win">
		<table id="execution_situation_grid"></table>
	</div>
</body>
</html>