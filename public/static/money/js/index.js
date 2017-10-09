// 交易类型按钮
var fromid = $('form').attr('id','form');// 为表单添加id元素
// 添加属性选择按钮
var html = '';
    html += '<input class="form-control" type="hidden" id="typeid" name="typeid" value="">';
    html += '<input class="form-control" type="hidden" id="typepid" name="typepid" value="">';
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
                text += '<button style="width:150px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                text += '&nbsp&nbsp&nbsp';
                for(var b = 0; b < childen.length; b++){
                    text += '&nbsp&nbsp';
                    text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                }
            }else{
                text += '</br></br>';
                text += '<button style="width:150px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
            }
        }
        $('#typename').html(text);
    }
})
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



// 余额类型按钮
var html1 = '';
html1 += '<input class="form-control" type="hidden" id="balanceid" name="balanceid" value="">';
html1 += '<div class="form-group col-md-12 col-xs-12 " id="form_group_type">';
html1 += '<label class="col-xs-12" for="type">余额类型</label>';
html1 += '<div class="col-sm-12" id="balancename">';
html1 += '</div>';
html1 += '</div>';

// 表单添加类型选项
$(fromid).prepend(html1);
$('#getBalanceBtn').hide();// 余额类型
var balance_url = $('#getBalanceBtn').attr('action');
$.ajax({
    url : balance_url,
    type : 'post',
    success : function(data){
        console.log(data);
        var text = '';
        for(var i = 0; i < data.length; i++){
            text += '<button style="width:150px" class="btn btn-default" onclick="checkedBalance($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].name+'</button>';
            text += '&nbsp&nbsp';
        }
        $('#balancename').html(text);
    }
})
// 赋值
function checkedBalance(data){
    // 还原默认样式
    $('#balancename button').attr('class','btn btn-default');
    var balanceidid = data.attr('attr-balanceid');// 获取选中的类型id
    $(data).attr('class','btn btn-info');
    $('#balanceid').val(balanceidid);// 赋值给隐藏域
    // $('#typepid').val(typepid);// 赋值给隐藏域
}


