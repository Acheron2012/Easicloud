<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>传感器分析对比</title>
<link rel="stylesheet" href="CSS/mydevice.css" />
<script type="text/javascript" src="js/dataProcess.js"></script>	
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>
<script src="http://cdn.hcharts.cn/highstock/highstock.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
${
demo
.css
}
</style>
<script type="text/javascript">
	function getData() {
		$.ajax({
			url : "v1/devices",// 跳转到 action  
			data : {},
			type : 'get',
			cache : false,
			dataType : 'json',
			success : function(data) {
				//alert(data[0].device_location.lng);
				$("#haha").val(data[0].device_location.lng);
			},
			error : function() {
				alert("异常！");
			},
			headers : {
				"user_key" : "74mpksQf+4iUFZiHBRrrPQ==",
			}
		});
	}
</script>
<script type="text/javascript">
	/* Highcharts.setOptions({global: {useUTC: false}}); */
	$(function () {
    var seriesOptions = [],
        seriesCounter = 0,
        names = ['easiCloud'],
        // create the chart when all data is loaded
        createChart = function () {
            $('#container').highcharts('StockChart', {
                rangeSelector: {
                    selected: 4
                },
                yAxis: {
                    labels: {
                        formatter: function () {
                            return (this.value > 0 ? ' + ' : '') + this.value + '%';
                        }
                    },
                    plotLines: [{
                        value: 0,
                        width: 2,
                        color: 'silver'
                    }]
                },
                plotOptions: {
                    series: {
                        compare: 'percent'
                    }
                },
                tooltip: {
                    pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>',
                    valueDecimals: 2
                },
                series: seriesOptions
            });
        };
    $.each(names, function (i, name) {
            seriesOptions[i] = {
                name: name,
                data: []
            };
            // As we're loading the data asynchronously, we don't know what order it will arrive. So
            // we keep a counter and create the chart when all the data is loaded.
            seriesCounter += 1;
            if (seriesCounter === names.length) {
                createChart();
            }
    });
});

</script>
</head>
<body onload="getDeviceList()">
	<ul>
		<li class="myTag">传感器分析对比</li>
	</ul>
	<table class="data">
		<tbody>
			<tr>
			<th>设备ID</th>
				<th><select id="device_id" onchange="getSensorList()"><option value="">请选择</option></select></th>
				<th>传感器ID</th>
				<th><select id="sensor_id" onchange="createCheckbox()"><option value="">请选择</option></select></th>
				<th align="left"><select id="selectData"><option
							value="0">自定义时间范围</option>
						<option value="1">最近一天</option>
						<option value="2">最近一周</option>
						<option value="3">最近一月</option></select>&nbsp;&nbsp;<input id="start"
					type="text"value="2016-11-10 23:21:53" /><b>--</b><input id="end" type="text" value="2016-11-10 23:22:11"/></th>
				<th><input type="button" name="sensor_comparision"
					class="button" value="查询" onclick="getMultiData()" /></th>
			</tr>
		</tbody>
	</table>
	<div id="container"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	<table>
		<tbody>
			<tr>
				<th><input type="button" name="correlation_analysis"
					class="button" value="相关性分析" onclick="getCorrelationResult()" /></th>
			</tr>
		</tbody>
	</table>
	<div class="table-responsive">
		<table class="table table-striped" id="myTable1" style="width:400px" border="1">
			
			
		</table>
	</div>
	<div class="table-responsive">
		<table class="table table-striped" id="myTable2" style="width:400px" border="1">
			
		</table>
	</div>
</body>
</html>