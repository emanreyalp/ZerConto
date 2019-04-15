// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var showOrNot = true
function showManagersButton(){
	showManagers(!showOrNot)
	document.getElementById("show-btn").value = showOrNot ? "Show managers" : "Hide managers"
	showOrNot = !showOrNot
}

function showManagers(show){
	managers = document.getElementsByClassName("manager")

	for(var i = 0; i < managers.length; i++ ){
		managers[i].style.display = show ? '' : 'none';
	}
}
