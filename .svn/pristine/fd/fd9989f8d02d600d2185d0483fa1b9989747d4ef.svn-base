
$(function(){
    var chart=null;
    
    Highcharts.setOptions({
        colors: ['#50B432', '#3366cc', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
    });
    
    var options={   		
        chart:{
            backgroundColor: 'rgb(255, 255, 255)',
        },
        title:{
            text:" ",
            style:{ "color": "#333", "fontSize": "18px" }
        },
        legend:{
            style:{ "color": "#333", "fontSize": "14px" },
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
    chart = new Highcharts.Chart('chart-dirverperson',options)
    $.getJSON("js/highchart/jsonData/chart-processorfinish.json",function(data1){//获取Json文件,并创建Json对象
        $.each(data1,function(i, field1){     //遍历json数组
            chart.addSeries({
                type:field1.type,
                name:field1.name,
                data:field1.data
            });
        })
    })
})

