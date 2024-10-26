    function getprocess()
    {
      
       var  xmlHttp;
       if(window.XMLHttpRequest)
       { 
            xmlHttp = new XMLHttpRequest();
       }
       else if(window.ActiveXObject)
       { 
           try
           {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
           }
           catch(e)
           {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
           }
       }
       else 
       { 
           return; 
       } 
       
     incount++; 
    
        xmlHttp.open("post","defaultview.aspx","true");
        
        xmlHttp.onreadystatechange = function(){
            if(xmlHttp.readyState==4){  
               if(xmlHttp.status ==200){ 
             
                    var obj=document.getElementById("A2");
                   
                    if(xmlHttp.responseText !== "1")
                    { 
	                    obj.innerHTML= xmlHttp.responseText; 
	                }
	                else
	                {
	                    getprocess();
	                }
	                  
               }
            }
        }   
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xmlHttp.send("processid="+incount.toString()); 
        if(incount==index)
        {
           incount=0;
        }  
       
    }
    
    function getstauts()
    {
      
       var  xmlHttp;
       if(window.XMLHttpRequest)
       { 
            xmlHttp = new XMLHttpRequest();
       }
       else if(window.ActiveXObject)
       { 
           try
           {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
           }
           catch(e)
           {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
           }
       }
       else 
       { 
           return; 
       } 
       
 
    
        xmlHttp.open("post","processstauts.aspx","true");
        
        xmlHttp.onreadystatechange = function(){
            if(xmlHttp.readyState==4){  
               if(xmlHttp.status ==200){ 
             
                    var obj=document.getElementById("floor");
	                obj.innerHTML= xmlHttp.responseText; 
	                  
               }
            }
        }   
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xmlHttp.send(); 
      
       
    }
      
    function _InitScroll(_S1,_S2,_W,_H,_T){
    return "var marqueesHeight"+_S1+"="+_H+";var stopscroll"+_S1+"=false;var scrollElem"+_S1+"=document.getElementById('"+_S1+"');with(scrollElem"+_S1+"){style.width="+_W+";style.height=marqueesHeight"+_S1+";style.overflow='hidden';noWrap=true;}scrollElem"+_S1+".onmouseover=new Function('stopscroll"+_S1+"=true');scrollElem"+_S1+".onmouseout=new Function('stopscroll"+_S1+"=false');var preTop"+_S1+"=0; var currentTop"+_S1+"=0; var stoptime"+_S1+"=0;var leftElem"+_S2+"=document.getElementById('"+_S2+"');scrollElem"+_S1+".appendChild(leftElem"+_S2+".cloneNode(true));setTimeout('init_srolltext"+_S1+"()',"+_T+");function init_srolltext"+_S1+"(){scrollElem"+_S1+".scrollTop=0;setInterval('scrollUp"+_S1+"()',50);}function scrollUp"+_S1+"(){if(stopscroll"+_S1+"){return;}currentTop"+_S1+"+=1;if(currentTop"+_S1+"==(marqueesHeight"+_S1+"+1)) {stoptime"+_S1+"+=1;currentTop"+_S1+"-=1;if(stoptime"+_S1+"=="+_T/50+") {currentTop"+_S1+"=0;stoptime"+_S1+"=0;}}else{preTop"+_S1+"=scrollElem"+_S1+".scrollTop;scrollElem"+_S1+".scrollTop +=1;if(preTop"+_S1+"==scrollElem"+_S1+".scrollTop){scrollElem"+_S1+".scrollTop=0;scrollElem"+_S1+".scrollTop +=1;}}}";
    }


    getprocess();
    eval(setInterval(getprocess,50000));
    eval(setInterval(getstauts,20000))
    eval(_InitScroll("A1","A2",800,19*30,4000));