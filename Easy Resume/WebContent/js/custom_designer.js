var element_pos = 0;    // POSITION OF THE NEWLY CREATED ELEMENTS.
var iCnt = 0;
var x = document.getElementById("add_pannel");
var y = document.getElementById("add_pan");
var elemid;



$(document).ready(function() {





	// CREATE MORE DIV, WITH 'ABSOLUTE' POSITIONING.
	$('#add_section').click(function() {

		var dynamic_div = $(document.createElement('div')).css({
			border: '1px dashed', position: 'absolute', left: element_pos, 'font-size': $('#font-size').val(), 'font-family': $('#font-family').val(),
			top: '-170px', background: $('#bg-color').val(), color: $('#font-color').val(), overflow: 'none', 'overflow-wrap': 'break-word', 'text-align': 'justify',
			'text-justify': 'inter-word', 'z-index': 0,
			width: '100%', height: '120', padding: '3',
		});

		$(dynamic_div).append($('#addtext').val());





		// APPEND THE NEWLY CREATED DIV TO "divContainer".
		$(dynamic_div).appendTo('#page').draggable({ containment: '#page' }).resizable({ containment: '#page' ,autoHide:'true'});

		iCnt = iCnt + 1;
		$(dynamic_div).attr('id', 'section-' + iCnt);
		$(dynamic_div).addClass("sections");
		y.classList.remove('btn-outline-danger');
		y.classList.add('btn-outline-success');
		y.innerHTML = "Add";
		x.style.display = "none";


		/* DOUBLE CLICK */
		$(dynamic_div).dblclick(function() {
			elemid = this.id;

			let del = confirm("Do you want to delete it?");
			if (del == true) {
				this.remove();
				alert("It was deleted");
			} else {
				alert("Edit it!");
				y.classList.remove('btn-outline-success');
				y.classList.add('btn-outline-danger');
				y.innerHTML = "Close";
				/*  rgb to hexa color convertor  */

				function convert(rgb) {
					rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);

					function hexCode(i) {
						return ("0" + parseInt(i).toString(16)).slice(-2);
					}
					return "#" + hexCode(rgb[1]) + hexCode(rgb[2])
						+ hexCode(rgb[3]);

				}

				x.style.display = "block";
				document.getElementById('extra').style.display = "block";
				document.getElementById('font-family').value = document.getElementById(elemid).style.fontFamily.replace(/^"|"$/g, '');
				document.getElementById('font-size').value = document.getElementById(elemid).style.fontSize;
				document.getElementById('bg-color').value = convert(document.getElementById(elemid).style.backgroundColor);
				document.getElementById('font-color').value = convert(document.getElementById(elemid).style.color);
				document.getElementById('addtext').value = document.getElementById(elemid).textContent;
				$('#'+elemid).resizable();  
			}
		});



	});
});

/* ADD Button */
function add() {
	if (x.style.display === "none") {
		y.classList.remove('btn-outline-success');
		y.classList.add('btn-outline-danger');
		y.innerHTML = "Close";
		document.getElementById("add_section").innerHTML = "Add Section";
		x.style.display = "block";


	} else {
		y.classList.remove('btn-outline-danger');
		y.classList.add('btn-outline-success');
		y.innerHTML = "Add";
		x.style.display = "none";

	}
}


function default1() {

	document.getElementById("font-size").value = "20pt";
	document.getElementById("font-family").value = "Calibri";
	document.getElementById("bg-color").value = "#ffffff";
	document.getElementById("font-color").value = "#000";
	document.getElementById("addtext").value = "";


}

function up1() {
	document.getElementById(elemid).style.fontFamily = document.getElementById('font-family').value;
	document.getElementById(elemid).style.fontSize = document.getElementById('font-size').value;
	document.getElementById(elemid).style.backgroundColor = document.getElementById('bg-color').value;
	document.getElementById(elemid).style.color = document.getElementById('font-color').value;
	document.getElementById(elemid).textContent = document.getElementById('addtext').value;
	x.style.display = "none";
	document.getElementById('extra').style.display = "none";
	y.classList.remove('btn-outline-danger');
	y.classList.add('btn-outline-success');
	y.innerHTML = "Add";

}


function recover() {

	$('.sections').css({ border: '1px dashed' });
	$('.ui-icon-gripsmall-diagonal-se').css({ display: 'block' });
}


/* On Back */

  window.onbeforeunload = function (e) {
                var message = "Are you sure ?";
                var firefox = /Firefox[\/\s](\d+)/.test(navigator.userAgent);
                if (firefox) {
                    //Add custom dialog
                    //Firefox does not accept window.showModalDialog(), window.alert(), window.confirm(), and window.prompt() furthermore
                    var dialog = document.createElement("div");
                    document.body.appendChild(dialog);
                    dialog.id = "dialog";
                    dialog.style.visibility = "hidden";
                    dialog.innerHTML = message;
                    var left = document.body.clientWidth / 2 - dialog.clientWidth / 2;
                    dialog.style.left = left + "px";
                    dialog.style.visibility = "visible";
                    var shadow = document.createElement("div");
                    document.body.appendChild(shadow);
                    shadow.id = "shadow";
                    //tip with setTimeout
                    setTimeout(function () {
                        document.body.removeChild(document.getElementById("dialog"));
                        document.body.removeChild(document.getElementById("shadow"));
                    }, 0);
                }
                return message;
            };

