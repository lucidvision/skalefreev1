var x;

function store_search()
{
	if(wall.value==""){
		alert("Please select a wall.")
	}
	$('#wall_selection').empty().append(wall.value);
	$('#wallpost').val(wall.value);
}

function refresh_search()
{
	$('#wall').val(wall.value);
	$('#first').click(setTimeout(function(){
		$('#second').click();
	},200));
}

function replypost()
{
	x = $('#forumpost').val();
	$('#wall').val(x);
	$('#first_reply').click(setTimeout(function(){
		$('#second').click();
	},200));
}