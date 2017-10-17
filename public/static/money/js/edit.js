// 当前交易类型值
var resTypeid = $('#getTypeList').attr('attr_typeid');// 当前交易类型
var resTypepid = $('#getTypeList').attr('attr_typepid');// 当前交易父类型
var resBalanceid =  $('#getBalanceBtn').attr('attr-balanceid');// 当前收款类型id
var resType =  $('#getBalanceBtn').attr('attr-type');// 当前转账还是收款

var fromid = $('form').attr('id','form');// 为表单添加id元素
// 添加属性选择按钮
var html = '';
    html += '<input class="form-control" type="hidden" id="typeid" name="typeid" value="'+resTypeid+'">';
    html += '<input class="form-control" type="hidden" id="typepid" name="type_pid" value="'+resTypepid+'">';
    html += '<div class="form-group col-md-12 col-xs-12 " id="form_group_type">';
    html += '<label class="col-xs-12" for="type">交易类型</label>';
    html += '<div class="col-sm-12" id="typename">';
    html += '</div>';
    html += '</div>';
$(fromid).prepend(html);// 添加交易类型选项
$('#getTypeList').hide();// 隐藏交易类型按钮
var url = $('#getTypeList').attr('action');// 获取交易类型url地址
$.ajax({
    url : url,
    type : 'post',
    success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            var childen = data[i].child;
            if(childen){
                if(resTypeid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-rounded btn-success" -onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" -onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }
                text += '&nbsp&nbsp&nbsp&nbsp';
                for(var b = 0; b < childen.length; b++){
                    if(resTypeid == childen[b].id){
                        text += '<button style="width:100px" class="btn btn-rounded btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    }else{
                        text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    }
                    text += '&nbsp&nbsp';
                }
                text += '</br></br>';
            }else{
                if(resTypeid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-rounded btn-success" -onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" -onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }
                text += '</br></br>';
            }
        }
        $('#typename').html(text);// 渲染交易类型选项
    }
})

// 交易类型隐藏域赋值
function checkedtype(data){
    // 交易类型默认样式
    $('#typename button').attr('class','btn btn-default');
    var typeid = data.attr('attr-typeid');// 获取选中的交易类型id
    var typepid = data.attr('attr-typepid');// 获取选中的交易类型pid
    $(data).attr('class','btn btn-rounded btn-success');// 当前选中交易类型样式
    $('#typeid').val(typeid);// 交易类型id赋值给隐藏域
    $('#typepid').val(typepid);// 交易类型pid赋值给隐藏域
}

if(resTypepid == 100 && resType == 1){
    var html = '';
    html += '<div class="form-group col-md-12 col-xs-12" id="receive">';
    html += '<input class="form-control" type="hidden" id="receiveType" name="receiveType" value="">';
    html += '<label class="col-xs-12" for="type">收款方式</label>';
    html += '<div class="col-sm-12" id="receiveTypes">';
    html += '</div>';
    html += '</div>';

    html += '<div class="form-group col-md-12 col-xs-12" id="cover_charge">';
    html += '<label class="col-xs-12" for="type">转账手续费</label>';
    html += '<div class="col-sm-12" id="">';
    html += '<input class="form-control" type="text" id="cover_charge" name="cover_charge" value="" placeholder="请输入转账手续费">';
    html += '</div>';
    html += '</div>';
    $($('#form_group_money')).before(html);// 添加收款方式选项

    $.ajax({
        url : $('#getBalanceBtn').attr('action'),
        type : 'post',
        success : function(data){
            var text = '';
            for(var i = 0; i < data.length; i++){
                if(resBalanceid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-rounded btn-info" onclick="checkedBalance1($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                    text += '&nbsp&nbsp';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" onclick="checkedBalance1($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                    text += '&nbsp&nbsp';
                }
            }
            $('#receiveTypes').html(text);// 渲染收款方式选项
        }
    })
}

// 收款方式隐藏域赋值
function checkedBalance1(data){
    $('#receiveTypes button').attr('class','btn btn-default');// 还原收款方式默认样式
    var balanceidid = data.attr('attr-balanceid');// 获取选中的收款方式类型id
    $(data).attr('class','btn btn-rounded btn-info');// 当前点击的收款方式样式
    $('#receiveType').val(balanceidid);// 收款方式id赋值给隐藏域
}



// 当前支付类型值
var balanceid = $('#getBalanceBtn').attr('attr-balanceid');
// 支付类型
var html = '';
html += '<input class="form-control" type="hidden" id="balanceid" name="balanceid" value="'+balanceid+'">';
html += '<div class="form-group col-md-12 col-xs-12 " id="form_group_type">';
html += '<label class="col-xs-12" for="type">支付方式</label>';
html += '<div class="col-sm-12" id="balancename">';
html += '</div>';
html += '</div>';
$(fromid).prepend(html);// 添加支付类型选项
$('#getBalanceBtn').hide();// 隐藏支付类型按钮
var url = $('#getBalanceBtn').attr('action');
var balance_url = $('#getBalanceBtn').attr('action');// 获取支付类型url地址
$.ajax({
    url : balance_url,
    type : 'post',
    success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            if(data[i].id == balanceid){
                text += '<button style="width:150px" class="btn btn-rounded btn-info" onclick="checkedBalance($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                text += '&nbsp&nbsp';
            }else{
                text += '<button style="width:150px" class="btn btn-default" onclick="checkedBalance($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                text += '&nbsp&nbsp';
            }
        }
        $('#balancename').html(text);// 渲染支付类型选项
    }
})
// 隐藏域赋值
function checkedBalance(data){
    $('#balancename button').attr('class','btn btn-default');// 默认支付类型样式
    var balanceidid = data.attr('attr-balanceid');// 获取选中支付类型id
    $(data).attr('class','btn btn-rounded btn-info');// 当前选中支付类型id
    $('#balanceid').val(balanceidid);// 支付类型id赋值给隐藏域
}



var time = $('#getBalanceBtn').attr('attr-time');
// 交易时间
var html = '';
html += '<div class="form-group col-md-12 col-xs-12 " id="form_group_time">';
html += '<label class="col-xs-12" for="money">交易时间</label>';
html += '<div class="col-sm-12">';
html += '<input class="form-control" type="text" id="time" name="create_time" value="'+time+'" placeholder="请输入交易金额">';
html += '</div>';
html += '</div>';
$($('#form_group_money')).after(html);// 添加交易时间插件
laydate.render({
    elem: '#time'
    ,type: 'datetime'
});// 时间插件