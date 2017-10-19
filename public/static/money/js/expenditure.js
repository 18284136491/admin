var html = '';
    html += '<div class="pull-left">';
    html += '<form class="form-inline" style="float-left">'
    html += '开始时间：<input class="form-control" width="30%" style="margin-right:20px;" value="" id="start" placeholder="start">';
    html += '结束时间：<input class="form-control" width="30%" style="margin-right:20px;" value="" id="end" placeholder="end">';
    html += '</form>';
    html += '</div>';
$('#echarts').parent().before(html);// 渲染时间搜索框

laydate.render({
    elem: '#start'
});// 时间插件
laydate.render({
    elem: '#end'
});// 时间插件

$(document).on('click','#echarts',function(){
    var echarts_url = $('#echarts').attr('action');// 获取获取图表数据url
    $('#echarts').text('切换列表');// 列表状态点击后改变按钮文字
    $('#echarts').attr('id','list');// 列表状态点击后改变按钮id
    $('.table-responsive').hide();// 隐藏列表
    $('.data-table-toolbar').children('.row').hide();// 隐藏分页数据
    $('.search-bar').hide();// 隐藏条件搜索框

    var start = $('#start').val();// 获取选择的开始时间
    var end = $('#end').val();// 获取选择的结束时间
    $.ajax({
        url : echarts_url,
        type : 'post',
        data : {'start':start,'end':end},
        success : function(data){
            var text = '';
            text += '<div class="block-content tab-content">'
            text += '<div id="main" style="width:100%;height:800px;margin:0 auto"></div>';
            text += '<div id="main1" style="width:100%;height:800px;margin:0 auto"></div>';
            text += '</div>';
            $('.table-responsive').after(text);// 替换图表框

            var myChart = echarts.init(document.getElementById('main'));
            var myChart1 = echarts.init(document.getElementById('main1'));
            // 资金流水支出计数据
            option = {
                title : {
                    text: '资金流水统计',
                    subtext: '总支出流水: '+data.total_money,
                    x:'left'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'right',
                    data:data.total
                },
                series: [
                    {
                        name:'资金流水',
                        type:'pie',
                        selectedMode: 'single',
                        // radius: [0, '30%'],
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
                        // radius: ['40%', '55%'],
                        radius: ['70%', '80%'],

                        data:data.x_data
                    }
                ]
            };

            // 支付方式支出统计
            option1 = {
                title : {
                    text: '支付方式统计',
                    subtext: '总支出流水: '+data.b_money,
                    x:'left'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'right',
                    data:data.b_total
                },
                series: [
                    {
                        name:'资金流水',
                        type:'pie',
                        selectedMode: 'single',
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
                        data:data.b_d_data
                    },
                    {
                        name:'资金流水',
                        type:'pie',
                        radius: ['70%', '80%'],

                        data:data.b_x_data
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            myChart1.setOption(option1);
        }
    })


    // 切换列表
    $(document).on('click','#list',function(){
        $('#list').text('切换图表');// 图表状态点击后改变按钮文字
        $('#list').attr('id','echarts');// 图标状态点击后改变按钮id
        $('.table-responsive').show();// 显示列表
        $('.search-bar').show();// 显示条件搜索框
        $('.data-table-toolbar').children('.row').show();// 隐藏分页数据
        $('#main').hide();// 隐藏图表
        $('#main1').hide();// 隐藏图表
    })
})


