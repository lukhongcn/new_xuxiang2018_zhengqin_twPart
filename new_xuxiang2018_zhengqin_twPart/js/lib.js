///common methods

function showPrepareSchedule(moduleid)
{
	var style;
	//style = "dialogTop:1px;dialogLeft:1px;dialogwidth:"+screen.width+"px;dialogheight: "+screen.height+"px; status:off";
	//window.showModalDialog("PrePareSchedule.aspx","YB04-888",style);
	window.open("PrePareSchedule.aspx?moduleid="+moduleid,"_blank","height="+(screen.height-10)+",width="+(screen.width-10)+",resizable=yes,scrollbars=yes,screenX=-100,screenY=0,z-look=yes");
}

function viewProject(projectid)
{
	window.open("projectdisplay.aspx?projectid="+projectid,"_blank","height="+(screen.height-100)+",width="+(screen.width-10)+",resizable=yes,scrollbars=yes,screenX=-100,screenY=0,z-look=yes");
}

function selectImage()
{
	window.open("UploadImage.aspx","UploadImage","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function selectImage2()
{
	window.open("../UploadImage.aspx","UploadImage","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function selectExcelPdf()
{
	window.open("UploadExcelPdf.aspx","UploadExcelPdf","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function selectExcelPdfForTry()
{
    window.open("../UploadExcelPdf.aspx","UploadExcelPdf","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function selectFile()
{
	window.open("UploadFile.aspx","UploadFile","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function type_change(nameobj)
{
	var namevar = nameobj.value;
	var nameold = document.Form1.Text_HiddenPartNo.value;
	//var nameold = "abc";
	var deff = false;
	if (namevar != nameold)
	{
		deff = true;
	}
	//if (namevar.length >= 2 && deff == true) 
	//document.Form1.submit();
}

function showModulePartInfo(moduleid)
{
	window.open("ViewModulePartDetail.aspx?moduleid="+moduleid,"_blank","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function showXuxiangModuleInfo(moduleid)
{
	window.open("xuxiangPopupModuleBaseInfo.aspx?id="+moduleid,"_blank","WIDTH=800,HEIGHT=550,resizable=yes,scrollbars=yes");
}

function showModuleInfo(moduleid)
{
	window.open("Newpopupmodulebaseinfo.aspx?id="+moduleid,"_blank","WIDTH=800,HEIGHT=550,resizable=yes,scrollbars=yes");
}

function showDiscardInfo(moduleid,partnoid)
{
	window.open("popupdiscardinfo.aspx?moduleid="+moduleid+"&partnoid="+partnoid,"_blank","WIDTH=800,HEIGHT=550,resizable=yes,scrollbars=yes");
}

function showPartInfo(moduleid,partnoid)
{
	window.open("popuppartinfo.aspx?moduleid="+moduleid+"&partnoid="+partnoid,"_blank","WIDTH=800,HEIGHT=550,resizable=yes,scrollbars=yes");
}

function SelectAll(tempControl)
{
	var theBox=tempControl;
	 xState=theBox.checked;   
    
	elem=theBox.form.elements;
	
	for(i=0;i<elem.length;i++){
		if(elem[i].type=="checkbox" && elem[i].id!=theBox.id && elem[i].id.indexOf("CheckBox_Select") > -1)
		{
			  if(elem[i].checked!=xState)
					elem[i].click();
		}
	}
}



function checkUserSelect(obj)
{
	var part1 = "MainDataGrid:_ctl";
	var part2 = ":CheckBox_ID";
	var partID1 = "MainDataGrid__ctl";
	var partID2 = "_CheckBox_ID";
	var len = 30;

	var name = obj.name;
	//alert(name);
	//alert(part1.length-1);
	//alert(name.length - part1.length - part2.length);
	var part = name.substr(part1.length,name.length - part1.length - part2.length);
	for (var i=2;i<=len ;i++ )
	{
		var b  = 0;
		try{
			var na = document.getElementById(partID1+String(i)+partID2).name;
		}catch(err){
			b = 1;
		}
		//alert(b);
		if (b == 0)
		{
			if (i<parseInt(part))
			{
				//document.getElementById(partID1+String(i)+partID2).checked = false;
				document.getElementById(partID1+String(i)+partID2).checked = true;
			}
			else
			{
				document.getElementById(partID1+String(i)+partID2).checked = true;
			}
		}		
	}
}

function initSelect()
{
	var part1 = "MainDataGrid:_ctl";
	var part2 = ":CheckBox_ID";
	var partID1 = "MainDataGrid__ctl";
	var partID2 = "_CheckBox_ID";
	var len = 30;

	//alert(name);
	//alert(part1.length-1);
	//alert(name.length - part1.length - part2.length);
	//var part = name.substr(part1.length,name.length - part1.length - part2.length);
	for (var i=2;i<=len ;i++ )
	{
		var b  = 0;
		try{
			var na = document.getElementById(partID1+String(i)+partID2).name;
		}catch(err){
			b = 1;
		}
		//alert(b);
		if (b == 0)
		{
			document.getElementById(partID1+String(i)+partID2).checked = true;
		}		
	}
}

function PopupLogPartProcess(moduleid)
{
	window.open("ViewLogPartProcess.aspx?moduleid="+moduleid,"_blank","height="+(screen.height-100)+",width="+(screen.width-10)+",resizable=yes,scrollbars=yes,screenX=-100,screenY=0,z-look=yes");
}

function ShowFactViw(customerid,moduleid,pssid,startfordate,endfordate)
{
	window.open("FactViewSmallScheduleList.aspx?customerid="+customerid+"&moduleid="+moduleid+"&processid="+pssid+"&startfordate="+startfordate+"&endfordate="+endfordate,"_blank","height="+(screen.height-100)+",width="+(screen.width-10)+",resizable=yes,scrollbars=yes,screenX=-100,screenY=0,z-look=yes");
}

function ObjectPartNoSearch(moduleid,oldmoduleid)
{
	window.open("ProjectPartSearch.aspx?moduleid="+moduleid+"&oldmoduleid="+oldmoduleid,"UploadImage","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}

function ObjectElectrodeNoSearch(moduleid,oldmoduleid)
{
	window.open("ProjectElectrodeSearch.aspx?moduleid="+moduleid+"&oldmoduleid="+oldmoduleid,"UploadImage","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
}