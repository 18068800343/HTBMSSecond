/* 局部响应-混凝土应变
 * @author xn 
 * */
function strainc(){
	$("#dataTable").css('height','2000px');
	$("#dataTable").empty();
	$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
			+" <li class='active'></li>"
			+"</ul></div>"
			+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
               +" </div>");
	var straincDom=$("#myTabOne1").html('');
	$.ajax({
		type: 'POST',
		url: '../BrgMonitorServlet',
		dataType: 'json',
		data:{
			type:"getStrainc",
			bridge_id:$('#scanStruct').val(),
			item_first:$('#item_first').val(),
			item_second:$('#item_second').val(),
			mode:$('#time_picker').val(),
		},
		success : function(json){
			if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
				errMessage("该传感器无数据");
				return;
			}
			var straincs=json.obj[0];
			var chanelNums=json.obj[1];
			var pointsNos=json.obj[2];
			projectImage=json.obj[3].projectImage;
			straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
					"<tr align='center'>"+
						"<td>"+"通道号"+"</td>"+
						"<td>"+"测点号"+"</td>"+
						"<td>"+"最大值"+"</td>"+
						"<td>"+"0.95分位点值"+"</td>"+
						"<td>"+"最小值"+"</td>"+
						"<td>"+"0.05分位点值"+"</td>"+
						"<td>"+"平均值"+"</td>"+
						"<td>"+"方差值"+"</td>"+
						"<td>"+"状态"+"</td>"+
					"</tr>"+
			"</tfoot>");
		 	for(var i=0;i<chanelNums.length;i++){
		 		var mark={};
		 		mark.max="";
		 		mark.tantile_95="";
		 		mark.min="";
		 		mark.tantile_5="";
		 		mark.avg="";
		 		mark.variance="";
		 		mark.type="";
		 		if(straincs[i]!=null&&straincs[i]!=""){
		 			mark=straincs[i];
		 		}
				$("#strainc").append("<tr>"+
						"<td >"+chanelNums[i]+"</td>"+
						"<td>"+pointsNos[i]+"</td>"+
						"<td data-type='max'><a>"+mark.max+"</a></td>"+
						"<td data-type='tantile_95'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
						"<td data-type='min'><a data-id='min'>"+mark.min+"</a></td>"+
						"<td data-type='tantile_5'><a data-id='tantile_5'>"+mark.tantile_5+"</a></td>"+
						"<td data-type='avg'><a data-id='avg'>"+mark.avg+"</a></td>"+
						"<td data-type='variance'><a data-id='variance'>"+mark.variance+"</a></td>"+
						"<td data-type='type'><a data-id='type'>"+mark.type+"</a></td>"+
					"</tr>");
			}
		}
	});
}
//局部响应-钢应变
function strains(){
	
	$("#dataTable").empty();
	$("#dataTable").css('height','1200px');
	$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
			+" <li class='active'></li>"
			+"</ul></div>"
			+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
               +" </div>");
	var straincDom=$("#myTabOne1").html('');
	$.ajax({
		type: 'POST',
		url: '../BrgMonitorServlet',
		dataType: 'json',
		data:{
			type:"getStrains",
			bridge_id:$('#scanStruct').val(),
			item_first:$('#item_first').val(),
			item_second:$('#item_second').val(),
			mode:$('#time_picker').val(),
		},
		success : function(json){
			if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
				errMessage("该传感器无数据");
				return;
			}
			var strainss=json.obj[0];
			var chanelNums=json.obj[1];
			var pointsNos=json.obj[2];
			projectImage=json.obj[3].projectImage;
			straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
					"<tr align='center'>"+
						"<td>"+"通道号"+"</td>"+
						"<td>"+"测点号"+"</td>"+
						"<td>"+"最大值"+"</td>"+
						"<td>"+"0.95分位点值"+"</td>"+
						"<td>"+"最小值"+"</td>"+
						"<td>"+"0.05分位点值"+"</td>"+
						"<td>"+"平均值"+"</td>"+
						"<td>"+"方差值"+"</td>"+
						"<td>"+"状态"+"</td>"+
					"</tr>"+
			"</tfoot>");
		 	for(var i=0;i<chanelNums.length;i++){
		 		var mark={};
		 		mark.max="";
		 		mark.tantile_95="";
		 		mark.min="";
		 		mark.tantile_5="";
		 		mark.avg="";
		 		mark.variance="";
		 		mark.type="";
		 		if(strainss[i]!=null&&strainss[i]!=""){
		 			mark=strainss[i];
		 		}
				$("#strainc").append("<tr>"+
						"<td>"+chanelNums[i]+"</td>"+
						"<td>"+pointsNos[i]+"</td>"+
						"<td data-type='max'><a data-id='max'>"+mark.max+"</a></td>"+
						"<td data-type='tantile_95'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
						"<td data-type='min'><a data-id='min'>"+mark.min+"</a></td>"+
						"<td data-type='tantile_5'><a data-id='tantile_5'>"+mark.tantile_5+"</a></td>"+
						"<td data-type='avg'><a data-id='avg'>"+mark.avg+"</a></td>"+
						"<td data-type='variance'><a data-id='variance'>"+mark.variance+"</a></td>"+
						"<td data-type='type'><a data-id='type'>"+mark.type+"</a></td>"+
					"</tr>");
			}
		}
	});
}	
//整体响应-动位移
function dynadisp(){
	$("#dataTable").css('height','500px');
	$("#dataTable").empty();
	$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
			+" <li class='active'></li>"
			+"</ul></div>"
			+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
               +" </div>");
	var straincDom=$("#myTabOne1").html('');
	$.ajax({
		type: 'POST',
		url: '../BrgMonitorServlet',
		dataType: 'json',
		data:{
			type:"getDynadisp",
			bridge_id:$('#scanStruct').val(),
			item_first:$('#item_first').val(),
			item_second:$('#item_second').val(),
			mode:$('#time_picker').val(),
		},
		success : function(json){
			var dynadisps=json.obj[0];
			var chanelNums=json.obj[1];
			var pointsNos=json.obj[2];
			projectImage=json.obj[3].projectImage;
			straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
					"<tr align='center'>"+
						"<td>"+"通道号"+"</td>"+
						"<td>"+"测点号"+"</td>"+
						"<td>"+"最大值"+"</td>"+
						"<td>"+"0.95分位点值"+"</td>"+
						"<td>"+"平均值"+"</td>"+
						"<td>"+"方差值"+"</td>"+
						"<td>"+"状态"+"</td>"+
					"</tr>"+
			"</tfoot>");
		 	for(var i=0;i<chanelNums.length;i++){
		 		if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
					errMessage("该传感器无数据");
					return;
				}
		 		var mark={};
		 		mark.max="";
		 		mark.tantile_95="";
		 		mark.min="";
		 		mark.tantile_5="";
		 		mark.avg="";
		 		mark.variance="";
		 		mark.type="";
		 		if(dynadisps[i]!=null&&dynadisps[i]!=""){
		 			mark=dynadisps[i];
		 		}
				$("#strainc").append("<tr>"+
						"<td><a data-id='"+chanelNums[i]+"'>"+chanelNums[i]+"</a></td>"+
						"<td><a data-id='"+pointsNos[i]+"'>"+pointsNos[i]+"</a></td>"+
						"<td data-type='max'><a data-id='max'>"+mark.max+"</a></td>"+
						"<td data-type='tantile_95'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
						"<td data-type='avg'><a data-id='avg'>"+mark.avg+"</a></td>"+
						"<td data-type='variance'><a data-id='variance'>"+mark.variance+"</a></td>"+
						"<td data-type='type'><a data-id='type'>"+mark.type+"</a></td>"+
					"</tr>");
			}
		}
	});
}	
//荷载环境-温度
function temp(){
	$("#dataTable").css('height','500px');
	$("#dataTable").empty();
	$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
			+" <li class='active'></li>"
			+"</ul></div>"
			+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
               +" </div>");
	var straincDom=$("#myTabOne1").html('');
	$.ajax({
		type: 'POST',
		url: '../BrgMonitorServlet',
		dataType: 'json',
		data:{
			type:"getTemp",
			bridge_id:$('#scanStruct').val(),
			item_first:$('#item_first').val(),
			item_second:$('#item_second').val(),
			mode:$('#time_picker').val(),
		},
		success : function(json){
			if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
				errMessage("该传感器无数据");
				return;
			}
			var temp=json.obj[0];
			var chanelNums=json.obj[1];
			var pointsNos=json.obj[2];
			projectImage=json.obj[3].projectImage;
			straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
					"<tr align='center'>"+
						"<td>"+"通道号"+"</td>"+
						"<td>"+"测点号"+"</td>"+
						"<td>"+"平均值"+"</td>"+
						"<td>"+"状态"+"</td>"+
					"</tr>"+
			"</tfoot>");
		 	for(var i=0;i<chanelNums.length;i++){
		 		var mark={};
		 		mark.max="";
		 		mark.tantile_95="";
		 		mark.min="";
		 		mark.tantile_5="";
		 		mark.avg="";
		 		mark.variance="";
		 		mark.type="";
		 		if(temp[i]!=null&&temp[i]!=""){
		 			mark=temp[i];
		 		}
				$("#strainc").append("<tr>"+
						"<td><a data-id='"+chanelNums[i]+"'>"+chanelNums[i]+"</a></td>"+
						"<td><a data-id='"+pointsNos[i]+"'>"+pointsNos[i]+"</a></td>"+
						"<td data-type='avg'><a data-id='avg' >"+mark.avg+"</a></td>"+
						"<td data-type='type'><a data-id='type'>"+mark.type+"</a></td>"+
					"</tr>");
			}
		}
	});
}
//局部响应-索力
function cableforce(){
	$("#dataTable").css('height','500px');
	$("#dataTable").empty();
	$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
			+" <li class='active'></li>"
			+"</ul></div>"
			+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
               +" </div>");
	var straincDom=$("#myTabOne1").html('');
	$.ajax({
		type: 'POST',
		url: '../BrgMonitorServlet',
		dataType: 'json',
		data:{
			type:"getCableforce",
			bridge_id:$('#scanStruct').val(),
			item_first:$('#item_first').val(),
			item_second:$('#item_second').val(),
			mode:$('#time_picker').val(),
		},
		success : function(json){
			if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
				errMessage("该传感器无数据");
				return;
			}
			var cableforces=json.obj[0];
			var chanelNums=json.obj[1];
			var pointsNos=json.obj[2];
			projectImage=json.obj[3].projectImage;
			straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
					"<tr align='center'>"+
						"<td>"+"通道号"+"</td>"+
						"<td>"+"测点号"+"</td>"+
						"<td>"+"平均值"+"</td>"+
						"<td>"+"状态"+"</td>"+
					"</tr>"+
			"</tfoot>");
		 	for(var i=0;i<chanelNums.length;i++){
		 		var mark={};
		 		mark.max="";
		 		mark.tantile_95="";
		 		mark.min="";
		 		mark.tantile_5="";
		 		mark.avg="";
		 		mark.variance="";
		 		mark.type="";
		 		if(cableforces[i]!=null&&cableforces[i]!=""){
		 			mark=cableforces[i];
		 		}
				$("#strainc").append("<tr>"+
						"<td><a data-id='"+chanelNums[i]+"'>"+chanelNums[i]+"</a></td>"+
						"<td><a data-id='"+pointsNos[i]+"'>"+pointsNos[i]+"</a></td>"+
						"<td data-type='avg'><a>"+mark.avg+"</a></td>"+
						"<td data-type='type'><a>"+mark.type+"</a></td>"+
					"</tr>");
			}
		}
	});
}	