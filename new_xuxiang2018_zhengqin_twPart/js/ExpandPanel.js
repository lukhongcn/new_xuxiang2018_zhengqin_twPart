// ----------------------------------------------------------------------------
// Project ExpandPanelGridView
// Sample Javascript code to show details in an expandable panel inside a GridView
//
// Written by Amauri Rodrigues - September 2008
// email : rramauri@hotmail.com
//
// Feel free to modify this peace of code - It is a sample.
// Feel free to use in commercial and non-commercial projects.
// ----------------------------------------------------------------------------

var expPainelId    = '';		   // ID of the internal panel where the top models will be inserted
lastBehavior = '';

/// <summary>
/// Expands and contracts one details panel
/// </summary>
/// <param name="customerId" type="String"> CustomerID = StoreID     </param>
/// <param name="trId" type="String">		Row element of gridview  </param>
/// <param name="painelId" type="String">   The internal panel where the top models will be inserted </param>
/// <param name="buttonId" type="String">   Clicked button           </param>
function ExpandModels(customerId, trId, painelId, buttonId,doDely) {

expPainelId  = ''; 

var tr  = $get(trId).style; 
var aux = $get(trId);
var btn = $get(buttonId);
if (tr) {
   if (tr.display == StyleDisplayBlock) {   // The panel is visible ?
      tr.display='none';					// Turns to invisible
      var p1 = $get(painelId); 
      if (p1) {  
         p1.innerHTML = ''; 
      }
     btn.alt = 'Click to see the top models';
      if (doDely == '1') 
          btn.src = 'images/detaild.jpg';
      else
          btn.src = 'images/detail.gif';
   }
   else {						  // The panel is hidden ?
      
      EnableExpandButtons(false);			  // Disable all expand buttons
      
      tr.display = StyleDisplayBlock;         // Shows the expand panel
      btn.alt = 'Clique to close the panel';
      if (doDely == '1')
          btn.src = 'images/close.gif';
      else
          btn.src = 'images/close.JPG';
      
      lastBehavior = $find('dpBehaviorMod');
      if (lastBehavior) { 
      
         var c = $get(painelId).style; 
         if (c) {  
            c.backgroundImage  = 'url(images/loading.gif)';  
            c.backgroundRepeat = 'no-repeat';  
            c.height = '24px';  
         } 

         expPainelId = painelId;
         lastBehavior.add_populated(ShowTopModels); // Sets the handle
         lastBehavior.populate(customerId);			// Calls the WebMethod
      } 
   }
}
}

/// <summary>
/// Shows the top models HTML table
/// </summary>
function ShowTopModels(s, e) {

var p1 = $get(expPainelId);		  // The internal panel where the top models will be inserted
var p2 = $get('painelAux');	      // The aux panel filled by the DynamicPopulateExtender

if (p1 && p2) {  
   p1.innerHTML = p2.innerHTML;	  // Top models HTML table (or some message)
   p1.style.backgroundImage = ''; 
   p1.style.height = 'auto';
   
   if (lastBehavior)
      lastBehavior.remove_populated(ShowTopModels)
   
   EnableExpandButtons(true);
} 
} 

/// <summary>
/// Enable and disable the expand buttons, to prevent against multiple calls
/// </summary>
/// <param name="enable" type="Boolean">    
/// The internal panel where the top models will be inserted
/// </param>
function EnableExpandButtons(enable) {

for (var i=0; i<ExpandButtons.length; i++) {
	var o = $get(ExpandButtons[i]);
	if (o) {
	   if (enable)
	      o.style.visibility = "visible";
	   else   
	      o.style.visibility = "hidden";
	}
}

}

// End
