// 当前交易类型值
var resTypeid = $('#getTypeList').attr('attr-typepid');
var fromid = $('form').attr('id','form');// 为表单添加id元素
// 添加属性选择按钮
var html = '';
html += '<input class="form-control" type="hidden" id="typepid" name="pid" value="'+resTypeid+'">';
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
        if(resTypeid == 0){
            text += '<button style="width:100px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-balanceid="0">顶级类型</button>';
            text += '&nbsp&nbsp';
        }else{
            text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-balanceid="0">顶级类型</button>';
            text += '&nbsp&nbsp';
        }
        for(var i = 0; i < data.length; i++){
            if(data[i].id == resTypeid){
                text += '<button style="width:100px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].typename+'</button>';
                text += '&nbsp&nbsp';
            }else{
                text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-balanceid="'+data[i].id+'">'+data[i].typename+'</button>';
                text += '&nbsp&nbsp';
            }
        }
        $('#typename').html(text);
    }
})


// 赋值
function checkedtype(data){
    // 还原默认样式
    $('#typename button').attr('class','btn btn-default');
    $(data).attr('class','btn btn-success');// 选中按钮样式赋值

    var typepid = data.attr('attr-balanceid');// 获取选中的类型id
    $('#typepid').val(typepid);// 赋值给隐藏域
}