var childClick = function(){
	if($(this).prop("checked")){
		$.ajax({
			url:'/index/child',
			data:{'id':$(this).val()},
			dataType:'json',
			success:function(d,e){
				if(d.length>0){
					var content = "<div parent='"+d[0]['parent']+"'>";
					for(var k in d){
						content+= "<div class='label label-danger' >";
						content+= "<input type='checkbox' name='parents[]' id='parents_' value='"+d[k]['id']+"'>";
						content+= "<label >"+d[k]['label']+"</label></div>"; 
					}
					content += "</div>" ;
					$('.child').append(content) ;
					$("[type='checkbox']").unbind('click');
					$("[type='checkbox']").bind('click',childClick);
				}
			}
		});
	}else{
		var id = $(this).val();
		$('[parent='+id+']').remove();
	}
}

var ready = function(){
	$("[type='checkbox']").bind('click',childClick);
}

$(document).ready(ready);
$(document).on('page:load',ready);
