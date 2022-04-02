/*<!--close the modal by just clicking outside of the modal-->*/

var modal = document.getElementById('id01');

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}