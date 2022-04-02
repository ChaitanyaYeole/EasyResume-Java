
 var resumeType; 
window.onload = function() {
	
   resumeType = localStorage.getItem("resume_type");
	if(resumeType=="chronological"){
		document.getElementById("chronological").style.display= "block";
		document.getElementById("functional").style.display= "none";
		document.getElementById("combination").style.display= "none";
	}else if(resumeType=="functional"){
		document.getElementById("chronological").style.display= "none";
		document.getElementById("functional").style.display= "block";
		document.getElementById("combination").style.display= "none";
	}else if(resumeType=="combination"){
		document.getElementById("chronological").style.display= "none";
		document.getElementById("functional").style.display= "none";
		document.getElementById("combination").style.display= "block";
	}else{
		alert("Please select your choice of resume first");
		location.href = "index.jsp";
	}
}

function chooseColor(){
      var mycolor = document.getElementById("myColor").value;
      document.execCommand('foreColor', false, mycolor);
    }

    function changeFont(){
      var myFont = document.getElementById("input-font").value;
      document.execCommand('fontName', false, myFont);
    }

    function changeSize(){
    var mysize = document.getElementById("font-size").value;
    document.execCommand('fontSize', false, mysize);
	}

    function checkDiv(){
      var editorText = document.getElementByClass("editor1").innerHTML;
      if(editorText === ''){
        document.getElementById("editor1").style.border = '5px solid red';
      }
    }

    function removeBorder(){
      document.getElementById("editor1").style.border = '1px solid transparent';
    }


/*COLOR*/
function primary1(){
	
	for(i=0;i<=6;i++){
	document.getElementsByClassName("primary")[i].style.backgroundColor=document.getElementById("primary-color").value;
}}

function secondary1(){
	
	for(i=0;i<=7;i++){
	document.getElementsByClassName("secondary")[i].style.backgroundColor=document.getElementById("secondary-color").value;
}}

function background1(){
	
	for(i=0;i<=10;i++){
	document.getElementsByClassName("background")[i].style.backgroundColor=document.getElementById("background-color").value;
}}

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



/*xdialog box*/
function print1() {

window.print();
}