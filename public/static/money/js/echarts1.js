$(document).on('click','#echarts',function(){
    var echarts_url = $('#echarts').attr('action');
    // $('.table-responsive').remove();
    // $('.data-table-toolbar').remove();
    $.ajax({
        url : echarts_url,
        type : 'post',
        success : function(data){
            var text = '';
            text += '<div id="main" style="width: 90%;height:400px;margin:0 auto"></div>';
            $('.table-responsive').html(text);// 替换图表框

            var myChart = echarts.init(document.getElementById('main'));
            // 指定图表的配置项和数据
            option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',data:data.total
                },
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],

                        label: {
                            normal: {
                                position: 'inner'
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:data.d_data
                    },
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['40%', '55%'],

                        data:data.x_data
                    }
                ]
            };

            /*option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data:data.total
                },
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],

                        label: {
                            normal: {
                                position: 'inner'
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:data.d_data
                    },
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['40%', '55%'],

                        data:data.x_data
                    }
                ]
            };*/
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    })
})