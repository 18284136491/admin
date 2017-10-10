// 当前交易类型值
var resTypeid = $('#getTypeList').attr('attr_typeid');
var resTypepid = $('#getTypeList').attr('attr_typepid');

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
// 表单添加类型选项
$(fromid).prepend(html);

$('#getTypeList').hide();// 影藏元素
var url = $('#getTypeList').attr('action');

// 获取交易类型
$.ajax({
    url : url,
    type : 'post',
    success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            var childen = data[i].child;
            if(childen){
                if(resTypeid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }
                text += '&nbsp&nbsp&nbsp&nbsp';
                for(var b = 0; b < childen.length; b++){
                    if(resTypeid == childen[b].id){
                        text += '<button style="width:100px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    }else{
                        text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    }
                    text += '&nbsp&nbsp';
                }
                text += '</br></br>';
            }else{
                if(resTypeid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }
                text += '</br></br>';
            }
            $('#typename').html(text);
        }
    }
})

$('#typename button').attr('id','dddd')

// 赋值
function checkedtype(data){
    // 还原默认样式
    $('#typename button').attr('class','btn btn-default');
    var typeid = data.attr('attr-typeid');// 获取选中的类型id
    var typepid = data.attr('attr-typepid');// 获取选中的类型id
    $(data).attr('class','btn btn-success');
    $('#typeid').val(typeid);// 赋值给隐藏域
    $('#typepid').val(typepid);// 赋值给隐藏域
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
// 表单添加类型选项
$(fromid).prepend(html);
$('#getBalanceBtn').hide();// 影藏元素
var url = $('#getBalanceBtn').attr('action');

var balance_url = $('#getBalanceBtn').attr('action');
$.ajax({
    url : balance_url,
    type : 'post',
    success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            if(data[i].id == balanceid){
                text += '<button style="width:150px" class="btn btn-info" onclick="checkedBalance($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                text += '&nbsp&nbsp';
            }else{
                text += '<button style="width:150px" class="btn btn-default" onclick="checkedBalance($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
                text += '&nbsp&nbsp';
            }
        }
        $('#balancename').html(text);
    }
})
// 隐藏域赋值
function checkedBalance(data){
    // 还原默认样式
    $('#balancename button').attr('class','btn btn-default');
    var balanceidid = data.attr('attr-balanceid');// 获取选中的类型id
    $(data).attr('class','btn btn-info');
    $('#balanceid').val(balanceidid);// 赋值给隐藏域
}

