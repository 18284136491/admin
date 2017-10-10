// 交易类型按钮
var fromid = $('form').attr('id','form');// 为表单添加id元素
// 添加属性选择按钮
var html = '';
    html += '<input class="form-control" type="hidden" id="pid" name="pid" value="">';
    html += '<div class="form-group col-md-12 col-xs-12 " id="form_group_type">';
    html += '<label class="col-xs-12" for="type">交易父类型</label>';
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
        text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="0">顶级类型</button>';
        text += '&nbsp&nbsp&nbsp';
        for(var i = 0; i < data.length; i++){
            console.log(data);
            text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'">'+data[i].typename+'</button>';
            text += '&nbsp&nbsp&nbsp';
        }
        $('#typename').html(text);
    }
})
// 赋值
function checkedtype(data){
    // 还原默认样式
    $('#typename button').attr('class','btn btn-default');
    var typeid = data.attr('attr-typeid');// 获取选中的类型id
    $(data).attr('class','btn btn-success');
    $('#pid').val(typeid);// 赋值给隐藏域
}
