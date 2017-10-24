$('form').attr('id','form');// 为表单添加id元素

// 交易类型
var html = '';
    html += '<div class="form-group col-md-12 col-xs-12">';
    html += '<input class="form-control" type="hidden" id="typeid" name="typeid" value="">';
    html += '<input class="form-control" type="hidden" id="typepid" name="type_pid" value="">';
    html += '<label class="col-xs-12" for="type">交易类型</label>';
    html += '<div class="col-sm-12" id="typename">';
    html += '</div>';
    html += '</div>';
$($('#form')).prepend(html);// 添加交易类型选项
$('#getTypeList').hide();// 隐藏交易类型按钮
var url = $('#getTypeList').attr('action');
$.ajax({
    url : url,
    type : 'post',
    success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            var childen = data[i].child;
            if(childen){
                text += '<button style="width:150px" class="btn btn-default" -onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                text += '&nbsp&nbsp&nbsp&nbsp';
                for(var b = 0; b < childen.length; b++){
                    text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    text += '&nbsp&nbsp';
                }
                text += '</br></br>';
            }else{
                text += '<button style="width:150px" class="btn btn-default" -onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                text += '</br></br>';
            }
        }
        $('#typename').html(text);// 渲染交易类型选项
    }
    })
// 交易类型隐藏域赋值
function checkedtype(data){
    $('#form_group_description').show();
    $('#receive').remove();// 删除收款方式
    $('#cover_charge').remove();// 删除转账手续费
    $('#typename button').attr('class','btn btn-default');// 还原默认样式
    var typeid = data.attr('attr-typeid');// 获取选中的交易类型id
    var typepid = data.attr('attr-typepid');// 获取选中的交易类型pid
    $(data).attr('class','btn btn-rounded btn-success');// 当前点击的交易类型样式
    $('#typeid').val(typeid);// 交易类型id赋值给隐藏域
    $('#typepid').val(typepid);// 交易类型pid赋值给隐藏域

    // 交易类型为转账的时候, 添加收款方式
    if(data.attr('attr-typepid') == 100){
        $('#form_group_description').hide();
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
            url : balance_url,
            type : 'post',
            success : function(data){
                var text = '';
                for(var i = 0; i < data.length; i++){
                    text += '<button style="width:150px" class="btn btn-default" onclick="checkedBalance1($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                    text += '&nbsp&nbsp';
                }
                $('#receiveTypes').html(text);// 渲染收款方式选项
            }
        })
    }
}
// 收款方式隐藏域赋值
function checkedBalance1(data){
    $('#receiveTypes button').attr('class','btn btn-default');// 还原收款方式默认样式
    var balanceidid = data.attr('attr-balanceid');// 获取选中的收款方式类型id
    $(data).attr('class','btn btn-rounded btn-info');// 当前点击的收款方式样式
    $('#receiveType').val(balanceidid);// 收款方式id赋值给隐藏域
}


// 支付方式
var html = '';
html += '<div class="form-group col-md-12 col-xs-12">';
html += '<input class="form-control" type="hidden" id="balanceid" name="balanceid" value="">';
html += '<label class="col-xs-12" for="type">支付方式</label>';
html += '<div class="col-sm-12" id="balancename">';
html += '</div>';
html += '</div>';
$($('#form')).prepend(html);// 添加支付方式选项

$('#getBalanceBtn').hide();// 隐藏支付方式按钮
var balance_url = $('#getBalanceBtn').attr('action');
$.ajax({
    url : balance_url,
    type : 'post',
    success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            text += '<button style="width:150px" class="btn btn-default" onclick="checkedBalance($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
            text += '&nbsp&nbsp';
        }
        $('#balancename').html(text);// 渲染支付方式选项
    }
})
// 支付方式隐藏域赋值
function checkedBalance(data){
    $('#balancename button').attr('class','btn btn-default');// 还原默认样式
    var balanceidid = data.attr('attr-balanceid');// 获取选中的支付方式id
    $(data).attr('class','btn btn-rounded btn-info');// 当前点击的支付方式样式
    $('#balanceid').val(balanceidid);// 支付方式赋值给隐藏域
}

