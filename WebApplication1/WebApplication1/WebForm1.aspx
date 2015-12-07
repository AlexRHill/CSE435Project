<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div id="reportContainer" style="display: none">
    <div  id="date"></div>
    <div id="analyst"></div>
        <div id="headerInfo"></div>
        <div id ="imageContainer" style ="display : table-row">
            <img style="display :table-row" id ="image1" onclick ="console.log(event.pageX); console.log(event.pageY)" src ="Assets/diagram-left.jpg" />
            <img style="display :table-row" id ="image2" onclick ="console.log(event.pageX); console.log(event.pageY)" src ="Assets/diagram-top.jpg" />
            <img style="display :table-row" id ="image3" onclick ="console.log(event.pageX); console.log(event.pageY)" src ="Assets/diagram-right.jpg" />
        </div>

        <div style="display: table-cell" id ="tableContainer">

        <table id="sevOverview" border="5"    width="20%"   cellpadding="1" cellspacing="1">
       <tr>
          <th colspan="3"><h3>Severity Overview</h3>
          </th>
       </tr>
       <tr>
          <th>Severity</th>
          <th>Total</th>
          <th>DPU</th>
           
       </tr>
       <tr align="center">
          <td>Sev 1</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 5</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 10</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Overall</td>
          <td></td>
          <td></td>
       </tr>
    </table>
        <table id="rightTable" border="5"    width="20%"   cellpadding="1" cellspacing="1">
       <tr>
          <th colspan="3"><h3>Right Side</h3>
          </th>
       </tr>
       <tr>
          <th>Severity</th>
          <th>Total</th>
          <th>DPU</th>
           
       </tr>
       <tr align="center">
          <td>Sev 1</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 5</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 10</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Overall</td>
          <td></td>
          <td></td>
       </tr>
    </table>
    <table id="leftTable" border="5"    width="20%"   cellpadding="1" cellspacing="1">
       <tr>
          <th colspan="3"><h3>Left Side</h3>
          </th>
       </tr>
       <tr>
          <th>Severity</th>
          <th>Total</th>
          <th>DPU</th>
           
       </tr>
       <tr align="center">
          <td>Sev 1</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 5</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 10</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Overall</td>
          <td></td>
          <td></td>
       </tr>
    </table>
        <table id="topTable" border="5"    width="20%"   cellpadding="1" cellspacing="1">
       <tr>
          <th colspan="3"><h3>Top</h3>
          </th>
       </tr>
       <tr>
          <th>Severity</th>
          <th>Total</th>
          <th>DPU</th>
           
       </tr>
       <tr align="center">
          <td>Sev 1</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 5</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Sev 10</td>
          <td></td>
          <td></td>
       </tr>
       <tr align="center">
          <td>Overall</td>
          <td></td>
          <td></td>
       </tr>

    </table>
            </div>    
 
    <div style="transform:translateX(-320px); display: table-cell" id="chartContainer" style="height: 300px; width: 100%;"></div>
        </div>
    <form id="form1" runat="server">      
        <div id ="inputBox">
                First name: <input type="text" id="FirstName" value=""><br>
                Last name: <input type="text" id="LastName" value=""><br>
        </div>
		<br>
		<label>Plant: <select id="Plant" name="Plant">  
              <option value="LDT">Lansing Delta Township</option>
              <option value="LGR" >Lansing Grand River</option>
              <option value="LO" >Lake Orion Assembly</option>
        </select></label>
		<label>Shift: <select id="Shift" name="Shift">  
              <option value="A">A</option>
              <option value="B" >B</option>
              <option value="C" >C</option>
        </select></label>
		<br>
		<br>
		<div id="SideVars">
			Text edited.
		</div>
		<br>
        <div id="dropBoxDiv">            
            <select id="car_type" name="car_type" onchange="showSide()">
              
              <option value="default_type" selected="selected">Choose Vehicle</option>
              <option value="TRVRSE" >Chevrolet Traverse</option>
              <option value="ENCLV" >Buick Enclave</option>
              <option value="ACAD" >GMC Acadia</option>
             
            </select>
            <select id="car_side" name="car_side" onchange="showDiagram()">
              <option value="default_side" selected="selected">Choose Side</option>
              <option value="left" >Left</option>
              <option value="top">Top</option>  
                <option value="right">Right</option>               
            </select>
        </div>

        <div id="diagramDiv" class="diagramDiv">
			<br/>
			<input type="button" value="Add Side to Report" runat="server" onclick="submitSide()" class="button"/>
            <br/>
			<br/>
           
			<img id="car_image" name="car_image" onclick="addDefect(event)" src="1" />
		   
        </div>
        <div id="defectDiv" class="defectDiv">
            <h2>Defect</h2>
			<select id="defect_type" name="defect_type">       
              <option value="UNK" >Unknown</option>
              <option value="CC" >Crater Crystal</option>
              <option value="CAP" >Crater Anti-Perspirant</option>
              <option value="FB" >Fiber Blue</option>
              <option value="FW" >Fiber White</option>
              <option value="FY" >Fiber Yellow</option>
              <option value="WB" >Weld Ball</option>
              <option value="PD" >Prime Defect</option>
			  <option value="MP" >Metal Pop</option>
              <option value="INS" >Insect</option>
              <option value="BSD" >Body Shop Defect</option>
              <option value="SD" >Skid Dirt</option>
              <option value="OD" >Oven Dirt</option>
              <option value="CCP" >Clear Coat Pop</option>
              <option value="CCD" >Clear Coat Drip</option>
            </select>
            <select id="defect_severity" name="defect_severity">
              <option value="1" >1</option>
              <option value="5" >5</option>
              <option value="10">10</option>               
            </select>
			<input type="button" value="Add Defect" runat="server" onclick="addDefectToList()" class="button">
			<input type="button" value="Undo" runat="server" onclick="undoDefect()" class="button">
        </div>
		<br>
		<input type="button" value="Submit" runat="server" onclick="submitReport()" class="button">
    </form>
</body>
</html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript" src="canvasjs.min.js"></script>
<script>
    $("#car_side").hide();
    $("#defectDiv").hide();
    $("#diagramDiv").hide();
    $("#reportContainer").hide();
	$("#car_type").val("default_type");
	$("#car_side").val("default_side");
	var startTime = new Date().toLocaleTimeString().toString();
	startTime = startTime.split(':')[0] + ':' + startTime.split(':')[1] + ' ' + startTime.split(' ')[1];
	var totalDefects = 0;
	var sevTotals = {"top": {1:0, 5:0, 10:0 }, "left" : {1:0, 5:0, 10:0 }, "right": {1:0, 5:0, 10:0 }};
	var defectTotals = {"UNK":0,"CC":0,"CAP":0,"FB":0,"FW":0,"FY":0,"WB":0,"PD":0,"MP":0,"INS":0,"BSD":0,"SD":0,"OD":0,"CCP":0,"CCD":0};
	var defect_count = 0;
	var type;
	var side;
	var dType;
	var severity;
	var tops = 0;
	var rights = 0;
	var lefts = 0;
	var adding_defect = false;
	var session_array = [];
	var defects = [];
	var strFinal = "Tops: " + tops + " Rights: " + rights + " Lefts: " + lefts;
	var defectLists = { "top": [], "right": [], "left": []};
	var imageX = 0;
	var imageY = 0;
	var plantBox;
	var firstNameBox;
	var lastNameBox;
    //set date
	document.getElementById('date').innerHTML = "Date: " + getDate().toString();
	$("#SideVars").html(strFinal);
	//var strArray = session_array.toString();
	//$("#ArrayVar").html(strArray);
    //var portion_array = [];
	


	function getDate() {
	    var now = new Date();
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;
	    var day = now.getDate();	 
	    if (month.toString().length == 1) {
	        var month = '0' + month;
	    }
	    if (day.toString().length == 1) {
	        var day = '0' + day;
	    }	    
	    var date = year + '/' + month + '/' + day;
	    return date;
	}


    function showSide() {
        $("#car_side").show();
		if ($("#diagramDiv").is(":visible")) {
			showDiagram();
		}
    }
    function addDefect(ev) {
		if (adding_defect == false) {

		$("#defect_type").val("UNK");
		$("#defect_severity").val("1");
        
		$("#defectDiv").show();
		mouseX = ev.pageX;
		mouseY = ev.pageY;
		var pos = $("#car_image").position();
		imageX = mouseX - pos.left;
		imageY = mouseY - pos.top;

		defect_count = defect_count + 1;

        var color = '#000000';
        var size = '4px';
        $("body").append(
            $('<div></div>')
                .css('position', 'absolute')
                .css('top', mouseY + 'px')
                .css('left', mouseX + 'px')
                .css('width', size)
                .css('height', size)
                .css('background-color', color)
        );        
		adding_defect = true;
		}
    }
	
	function addDefectToList() {
		//defect_count = defect_count + 1;
		var defect_object = {};
		dType = $("#defect_type").val();
		severity = $("#defect_severity").val();
		defect_object.type = dType;
		defect_object.severity = severity;
		defect_object.X = imageX;
		defect_object.Y = imageY;
	    // can add coordinates here as well
		defects.push(defect_object);
        
	    //track totals
		side = $("#car_side").val();
		defectLists[side].push(defect_object);
		
		sevTotals[side][severity] = sevTotals[side][severity] + 1;
		defectTotals[dType] = defectTotals[dType] + 1;
		console.log(sevTotals[side]);
		console.log(sevTotals[side][severity]);
		console.log(defectTotals[dType]);
		totalDefects = totalDefects + 1;
		console.log(defects);
		$("body :last").css('background-color', 'blue');
		$("#defectDiv").hide();
		adding_defect = false;
	}
	
    function showDiagram() {	
		type = $("#car_type").val();
		side = $("#car_side").val();
		if (type === "default_type" || side === "default_side") {
		    $("#car_image").attr("src", "Assets/placeholder.jpg");
			adding_defect = true;
		}
		else {
		adding_defect = false;
		if (type === "TRVRSE") {
			if (side === "left") {
				$("#car_image").attr("src", "Assets/diagram-left.jpg");
			}
			else if (side === "top") {
				$("#car_image").attr("src", "Assets/diagram-top.jpg");
			}
			else if (side === "right") {
				$("#car_image").attr("src", "Assets/diagram-right.jpg");
			}
		}
		else if (type === "ENCLV") {
			if (side === "left") {
				$("#car_image").attr("src", "Assets/diagram-left.jpg");
			}
			else if (side === "top") {
				$("#car_image").attr("src", "Assets/diagram-top.jpg");
			}
			else if (side === "right") {
				$("#car_image").attr("src", "Assets/diagram-right.jpg");
			}
		}
	    else if (type === "ACAD") {
			if (side === "left") {
				$("#car_image").attr("src", "Assets/diagram-left.jpg");
			}
			else if (side === "top") {
				$("#car_image").attr("src", "Assets/diagram-top.jpg");
			}
			else if (side === "right") {
				$("#car_image").attr("src", "Assets/diagram-right.jpg");
			}
		}
		}
		clearDefects();
		
        $("#diagramDiv").show();
    }
	
	function clearDefects() {
		if (defect_count > 0) {
			while (defect_count > 0) {
				defect_count = defect_count - 1;
				$("body :last").remove();
			}
		}
		adding_defect = false;
		defects = [];
	}
	
	function undoDefect() {
	    if (defect_count > 0) {
			defect_count = defect_count - 1;
			$("body :last").remove();
			$("#defectDiv").hide();
			adding_defect = false;
		}
    }
	
	function submitSide() {
		type = $("#car_type").val();
		side = $("#car_side").val();
		if (side === "left") {
			lefts = lefts + 1;
		}
		else if (side === "top") {
			tops = tops + 1;
		}
		else if (side === "right") {
			rights = rights + 1;
		}
		
		var side_object = {};
		side_object.type = type;
		side_object.side = side;
		side_object.defects = defects;
		session_array.push(side_object);
		strFinal = "Tops: " + tops + " Rights: " + rights + " Lefts: " + lefts;
		$("#SideVars").html(strFinal);
		console.log(session_array);
		clearDefects();
		$("#car_type").val("default_type");
		$("#car_side").val("default_side");
		$("#diagramDiv").hide();
	}
	
	function submitReport() {
	    //$("#inputBox").hide();
	    var defect_complete_object = {};
	    plantBox = $("#Plant").val();
	    firstNameBox = $("#FirstName").val();
	    lastNameBox = $("#LastName").val();
	    defect_complete_object.plant = plantBox;
	    defect_complete_object.first_name = firstNameBox;
	    defect_complete_object.last_name = lastNameBox;
	    defect_complete_object.analysis = session_array;
	    var session_object = { report: defect_complete_object };

		var session_json = JSON.stringify(session_object);
		console.log(JSON.stringify(session_array));

		$("#form1").hide();
		$("#reportContainer").show();
		$(".reportMark").show();
		
		//set analyst
		document.getElementById('analyst').innerHTML = "Analyst: " + document.getElementById('FirstName').value + ' ' + document.getElementById('LastName').value;
	    ////get rest of the header info
        //get endTime
		var endTime = new Date().toLocaleTimeString().toString();
		endTime = endTime.split(':')[0] + ':' + endTime.split(':')[1] + ' ' + endTime.split(' ')[1];		
	    //get shift
		shift = document.getElementById("Shift").value;
        
	    //get total units
		var totalunits = tops + rights + lefts;
	    //get dpu
		var dpu = totalDefects / totalunits ;
	    //set header info

		document.getElementById('headerInfo').innerHTML = "Start Time: " + startTime +  "   End Time: " + endTime + 
            "   Shift: " + shift +  "   Num of Units: " + totalunits + "   Total Defects: " + totalDefects +
            "   DPU: " + dpu.toFixed(2);
        
		
	    //////create report	  
	    //add marks
		var color = '#000000';
		var size = '4px';
		console.log(defectLists["top"]);
		var dpos = $("#image2").offset();
		defectLists["top"].forEach(function (defect) {
		    console.log(defect);
		    console.log(defect.Y);
		    console.log(defect.X);
			console.log(dpos);
		    $("body").append(
                $('<div></div>')
                    .css('position', 'absolute')
                    .css('top', (parseInt(defect.Y) + dpos.top).toString()+ 'px')
                    .css('left', (parseInt(defect.X) + dpos.left).toString() + 'px')
                    .css('width', size)
                    .css('height', size)
                    .css('background-color', color)
            );
		});
		var dpos = $("#image3").offset();
		defectLists["right"].forEach(function (defect) {
		    console.log(defect);
		    console.log(defect.Y);
		    console.log(defect.X);
		    $("body").append(
                $('<div></div>')
                    .css('position', 'absolute')
                    .css('top', (parseInt(defect.Y) + dpos.top).toString() + 'px')
                    .css('left', (parseInt(defect.X) + dpos.left).toString() + 'px')
                    .css('width', size)
                    .css('height', size)
                    .css('background-color', color)
            );
		});
		var dpos = $("#image1").offset();
		defectLists["left"].forEach(function (defect) {
		    console.log(defect);
		    console.log(defect.Y);
		    console.log(defect.X);
		    $("body").append(
                $('<div></div>')
                    .css('position', 'absolute')
                    .css('top', (parseInt(defect.Y) + dpos.top).toString() + 'px')
                    .css('left', (parseInt(defect.X) + dpos.left).toString() + 'px')
                    .css('width', size)
                    .css('height', size)
                    .css('background-color', color)
            );
		});
	    
	    ////create tables
	    //sev overview
		
		var totalsev1 = sevTotals['top'][1] + sevTotals['right'][1] + sevTotals['left'][1];
		var totalsev5 = sevTotals['top'][5] + sevTotals['right'][5] + sevTotals['left'][5];
		var totalsev10 = sevTotals['top'][10] + sevTotals['right'][10] + sevTotals['left'][10];
		var sevOverall = totalsev1 + totalsev5 + totalsev10;

		var table = document.getElementById('sevOverview');		
		table.rows[2].cells[1].innerHTML = totalsev1;
		table.rows[2].cells[2].innerHTML = (totalsev1 / totalunits).toFixed(2);
		table.rows[3].cells[1].innerHTML = totalsev5;
		table.rows[3].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[4].cells[1].innerHTML = totalsev5;
		table.rows[4].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[5].cells[1].innerHTML = sevOverall;
		table.rows[5].cells[2].innerHTML = (sevOverall / totalunits).toFixed(2);

	    //right
		var totalunits = rights;
		var totalsev1 = sevTotals['right'][1];
		var totalsev5 = sevTotals['right'][5];
		var totalsev10 = sevTotals['right'][10];
		var sevOverall = totalsev1 + totalsev5 + totalsev10;

		var table = document.getElementById('rightTable');
		table.rows[2].cells[1].innerHTML = totalsev1;
		table.rows[2].cells[2].innerHTML = (totalsev1 / totalunits).toFixed(2);
		table.rows[3].cells[1].innerHTML = totalsev5;
		table.rows[3].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[4].cells[1].innerHTML = totalsev5;
		table.rows[4].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[5].cells[1].innerHTML = sevOverall;
		table.rows[5].cells[2].innerHTML = (sevOverall / totalunits).toFixed(2);

	    //top
		var totalunits = tops;
		var totalsev1 = sevTotals['top'][1];
		var totalsev5 = sevTotals['top'][5];
		var totalsev10 = sevTotals['top'][10];
		var sevOverall = totalsev1 + totalsev5 + totalsev10;

		var table = document.getElementById('topTable');
		table.rows[2].cells[1].innerHTML = totalsev1;
		table.rows[2].cells[2].innerHTML = (totalsev1 / totalunits).toFixed(2);
		table.rows[3].cells[1].innerHTML = totalsev5;
		table.rows[3].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[4].cells[1].innerHTML = totalsev5;
		table.rows[4].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[5].cells[1].innerHTML = sevOverall;
		table.rows[5].cells[2].innerHTML = (sevOverall / totalunits).toFixed(2);

	    //left
		var totalunits = lefts;
		var totalsev1 = sevTotals['left'][1];
		var totalsev5 = sevTotals['left'][5];
		var totalsev10 = sevTotals['left'][10];
		var sevOverall = totalsev1 + totalsev5 + totalsev10;

		var table = document.getElementById('leftTable');
		table.rows[2].cells[1].innerHTML = totalsev1;
		table.rows[2].cells[2].innerHTML = (totalsev1 / totalunits).toFixed(2);
		table.rows[3].cells[1].innerHTML = totalsev5;
		table.rows[3].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[4].cells[1].innerHTML = totalsev5;
		table.rows[4].cells[2].innerHTML = (totalsev5 / totalunits).toFixed(2);
		table.rows[5].cells[1].innerHTML = sevOverall;
		table.rows[5].cells[2].innerHTML = (sevOverall / totalunits).toFixed(2);

	    //create pie chart
		var chart = new CanvasJS.Chart("chartContainer",
	    {
	        title: {
	            text: "Defects at "+document.getElementById("Plant").value
	        },
	        legend: {
	            maxWidth: 350,
	            itemWidth: 120
	        },
	        data: [
		    {
		        type: "pie",
		        showInLegend: true,
		        legendText: "{indexLabel}",
		        dataPoints: [
				    { y: defectTotals["UNK"], indexLabel: "UNK" },
				    { y: defectTotals["CC"], indexLabel: "CC" },
				    { y: defectTotals["CAP"], indexLabel: "CAP" },
				    { y: defectTotals["FB"], indexLabel: "FB" },
					{ y: defectTotals["FW"], indexLabel: "FW" },
					{ y: defectTotals["FY"], indexLabel: "FY" },
					{ y: defectTotals["WB"], indexLabel: "WB" },
					{ y: defectTotals["PD"], indexLabel: "PD" },
					{ y: defectTotals["MP"], indexLabel: "MP" },
					{ y: defectTotals["INS"], indexLabel: "INS" },
					{ y: defectTotals["BSD"], indexLabel: "BSD" },
					{ y: defectTotals["SD"], indexLabel: "SD" },
					{ y: defectTotals["OD"], indexLabel: "OD" },
					{ y: defectTotals["CCP"], indexLabel: "CCP" },
					{ y: defectTotals["CCD"], indexLabel: "CCD" },
		        ]
		    }
	        ]
	    });
		chart.render();

		$.ajax({
		  url: "report.php",
                  type: "POST",
                  dataType: 'json',
		  data: session_json,
		  success: function(response){}
                });
	}

    
    
</script>

<style>
    .defectDiv {border:2px solid #0094ff;}
    .defectDiv h2 {background:#0094ff;color:white;padding:10px;}
    .defectDiv p {color:#333;padding:10px;}
    .defectDiv {
    -moz-border-radius-topright:5px;
    -moz-border-radius-topleft:5px;
    -webkit-border-top-right-radius:5px;
    -webkit-border-top-left-radius:5px;
    border-top-left-radius:5px;
    border-top-right-radius:5px;
}

	.button{
	border-radius: 0.5em;
	text-decoration: none;
	color: white;
	padding: 1em;
	background-color: #329bd8;
	text-transform: uppercase;
	font-weight: bold;
	margin: 5px 5px 5px 5px;
}
	.button:hover {
	background-color: transparent;
	border: 0.15em #329bd8 solid;
	color: #329bd8;
}
	.button:active {
	background-color: transparent;
	border: 0.15em #5e8ca5 solid;
	color: #5e8ca5;
}
</style>
