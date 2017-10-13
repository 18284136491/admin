$(document).on('click','#echarts',function(){
    var echarts_url = $('#echarts').attr('action');// 获取获取图表数据url
    $('#echarts').text('切换列表');// 列表状态点击后改变按钮文字
    $('#echarts').attr('id','list');// 列表状态点击后改变按钮id
    $('.table-responsive').hide();// 隐藏列表
    $('.pagination-info').hide();// 隐藏分页数据
    $('.search-bar').hide();// 隐藏条件搜索框
    $.ajax({
        url : echarts_url,
        type : 'post',
        success : function(data){
            console.log(data);
            var text = '';
            text += '<div class="block-content tab-content">'
            text += '<div id="main" style="width: 100%;height:800px;margin:0 auto"></div>';
            text += '</div>';
            $('.table-responsive').after(text);// 替换图表框

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
                        name:'资金流水',
                        type:'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],
                        radius: [0, '60%'],

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
                        name:'资金流水',
                        type:'pie',
                        radius: ['40%', '55%'],
                        radius: ['70%', '80%'],

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
    $(document).on('click','#list',function(){
        $('#list').text('切换图表');// 图表状态点击后改变按钮文字
        $('#list').attr('id','echarts');// 图标状态点击后改变按钮id
        $('.table-responsive').show();// 显示列表
        $('.search-bar').show();// 显示条件搜索框
        $('#main').hide();// 隐藏图表
    })
})