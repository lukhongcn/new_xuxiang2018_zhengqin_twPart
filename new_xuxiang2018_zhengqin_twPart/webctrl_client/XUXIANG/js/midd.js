function switchSysBar(){
				if (switchPoint.innerText==3){
				switchPoint.innerText=4;
				document.all("frmTitle").style.display="none";
				document.getElementById("midd1").parentNode.style.width= "auto" ;
				document.getElementById("midd1").parentNode.parentNode.childNodes[2].style.width="auto";
				
				}else{
				switchPoint.innerText=3;
				document.all("frmTitle").style.display="";
				document.getElementById("midd1").parentNode.parentNode.childNodes[2].style.width="79%";
				}}
