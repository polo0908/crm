
$(function(){
	Highcharts.setOptions({
	        colors: ['#3366cc', '#dc3912', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
	    });
	
    var chart=null;
    var options={
        chart:{
            backgroundColor: 'rgb(255, 255, 255)',
        },
        title:{
            text:" ",
            style:{ "color": "white", "fontSize": "18px" }
        },
        legend:{
            style:{ "color": "white", "fontSize": "14px" },
            align:'right',
            y:-50,
            layout: 'vertical',
            itemStyle: {
            	  color: 'rgb(34, 34, 34)',
                  fontWeight:400,
            }
        },
        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series:  []
    }
    chart = new Highcharts.Chart('chart-foreignperson',options)
    
    var totalOnTime = $('#totalOnTime').val();   
    var totalDelay = $('#totalDelay').val();
    
    var json =  [{
    	  "type": "pie",
    	  "name": " ",
    	  "data": [
    	    ["In Process",  25],
    	    ["Finished", 75]
    	  ]
    	}]
    
//    $.getJSON("js/highchart/jsonData/chart-delay_or_ontime.json",function(data1){//获取Json文件,并创建Json对象
        $.each(json,function(i, field1){     //遍历json数组
            chart.addSeries({
                type:field1.type,
                name:field1.name,
                data:field1.data
            });
        })
//    })
})

