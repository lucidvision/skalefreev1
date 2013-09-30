var x = [];

function store_search()
{
	x = wall.value;
	if (x=="") {
		alert("Please select a wall")
	}
	$('#wall_selection').empty().append(x);
	$('#wallpost').val(x);
}

function refresh_search()
{
	x = wall.value;
	$('#wall').val(x);
	$('#first').click(setTimeout(function(){
		$('#second').click();
	},200));
}
