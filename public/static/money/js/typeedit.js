// 当前交易类型值
var resTypeid = $('#getTypeList').attr('attr-typepid');
var fromid = $('form').attr('id','form');// 为表单添加id元素
// 添加属性选择按钮
var html = '';
html += '<input class="form-control" type="hidden" id="typeid" name="typeid" value="'+resTypeid+'">';
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
    /*success : function(data){
        var text = '';
        for(var i = 0; i < data.length; i++){
            var childen = data[i].child;
            if(childen){
                if(resTypeid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }
                text += '&nbsp&nbsp&nbsp';
                for(var b = 0; b < childen.length; b++){
                    text += '&nbsp&nbsp';
                    if(resTypeid == childen[b].id){
                        text += '<button style="width:100px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    }else{
                        text += '<button style="width:100px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+childen[b].id+'" attr-typepid="'+childen[b].pid+'">'+childen[b].typename+'</button>';
                    }
                }
            }else{
                text += '</br></br>';
                if(resTypeid == data[i].id){
                    text += '<button style="width:150px" class="btn btn-success" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }else{
                    text += '<button style="width:150px" class="btn btn-default" onclick="checkedtype($(this))" type="button" attr-typeid="'+data[i].id+'" attr-typepid="'+data[i].pid+'">'+data[i].typename+'</button>';
                }
            }
            $('#typename').html(text);
        }
    }*/
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

console.log($('#typename button'));
$('#typename button').attr('id','dddd')

// 赋值
function checkedtype(data){
    // 还原默认样式
    $('#typename button').attr('class','btn btn-default');
    var typepid = data.attr('attr-typepid');// 获取选中的类型id
    $(data).attr('class','btn btn-success');
    $('#typepid').val(typepid);// 赋值给隐藏域
}