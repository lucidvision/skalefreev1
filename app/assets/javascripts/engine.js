var x;

function close_popup()
{
	$(".modal").css("display", "none");
}

function store_search()
{
	if(wall.value==""){
		alert("Please select a wall.");
	}
	$('#wall_selection').empty().append(wall.value);
	$('#wall_heading').empty().append(wall.value);
	$('#wallpost').val(wall.value);
}

function refresh_search()
{
	$('#wall').val(wall.value);
	$('#first').click(setTimeout(function(){
		$('#second').click();
	},120));
}

