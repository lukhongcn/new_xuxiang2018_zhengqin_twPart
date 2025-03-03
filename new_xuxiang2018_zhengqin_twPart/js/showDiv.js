function popupDiv(div_id) {   
    var div_obj = $("#"+div_id);   
    var windowWidth = document.documentElement.clientWidth;       
    var windowHeight = document.documentElement.clientHeight;       
    var popupHeight = div_obj.height();       
    var popupWidth = div_obj.width();    
    //添加并显示遮罩层   
    $("<div id='mask'></div>").addClass("mask")   
                              .width(windowWidth * 0.99)   
                              .height(windowHeight * 0.99)   
                              .click(function() {hideDiv(div_id); })   
                              .appendTo("body")   
                              .fadeIn(200);  
    div_obj.css({"position": "absolute","background": "#F8F7FF"})   
           .animate({left: ($(document).width()-popupWidth)/2,    
                     top:  40, opacity: "show" }, "slow");   
}   
  
function hideDiv(div_id) {   
    $("#mask").remove();   
    $("#" + div_id).animate({left: 0, top: 0, opacity: "hide" }, "slow");   
} 