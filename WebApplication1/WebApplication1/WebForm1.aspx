<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">      
        <div id ="inputBox">
                First name: <input type="text" name="FirstName" value="First Name"><br>
                Last name: <input type="text" name="LastName" value="Last Name"><br>
                Plant: <input type="text" name="Plant" value="Plant"><br>
                Shift: <input type="text" name="Shift" value="Shift"><br>     
        </div>
		<br>
		<div id="SideVars">
			Text edited.
		</div>
		<br>
        <div id="dropBoxDiv">            
            <select id="car_type" name="car_type" onchange="showSide()">
              
              <option value="default_type" selected="selected">Choose Vehicle</option>
              <option value="saab" >Saab</option>
              <option value="mercedes" >Mercedes</option>
              <option value="audi" >Audi</option>
             
            </select>
            <select id="car_side" name="car_side" onchange="showDiagram()">
              <option value="default_side" selected="selected">Choose Side</option>
              <option value="left" >left</option>
              <option value="top">top</option>  
                <option value="right">right</option>               
            </select>
        </div>

        <div id="diagramDiv" class="diagramDiv">
			<br>
			<input type="button" value="Add Side to Report" runat="server" onclick="submitSide()" class="button">
            <br>
			<img id="car_image" name="car_image" onclick="addDefect(event)" src="http://www.ceco.net/zDepot/drawing-png-files/audi-tt-roadste-convertible-vehicles-cars-free-autocad-blocks-92.dwg.png" />
		</div>
        <div id="defectDiv" class="defectDiv">
            <h2>Defect</h2>
            <!--<p contenteditable="true">Type:</p>
            <p contenteditable="true">Severity:</p>-->
			<select id="defect_type" name="defect_type">       
              <option value="UNK" >UNK</option>
              <option value="PRD" >PRD</option>
              <option value="VIJ" >VIJ</option>
              <option value="DMM" >DMM</option>             
            </select>
            <select id="defect_severity" name="defect_severity">
              <option value="1" >1</option>
              <option value="5" >5</option>
              <option value="10">10</option>               
            </select>
			<input type="button" value="Add Defect" runat="server" onclick="addDefectToList()" class="button">
			<input type="button" value="Undo" runat="server" onclick="undoDefect()" class="button">
        </div>
		
		<!--<input type="button" value="Add Side to Report" runat="server" onclick="submitSide()" class="button">-->
		<br>
		<input type="button" value="Submit" runat="server" onclick="submitReport()" class="button">
    </form>
</body>
</html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script>
    $("#car_side").hide();
    $("#defectDiv").hide();
    $("#diagramDiv").hide();
	$("#car_type").val("default_type");
	$("#car_side").val("default_side");
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
	$("#SideVars").html(strFinal);
	//var strArray = session_array.toString();
	//$("#ArrayVar").html(strArray);
	//var portion_array = [];
    function showSide() {
        $("#car_side").show();
		if ($("#diagramDiv").is(":visible")) {
			showDiagram();
		}
    }
    function addDefect(ev) {
		if (adding_defect == false) {
        console.log('add Defect');
		$("#defect_type").val("UNK");
		$("#defect_severity").val("1");
        $("#defectDiv").show();
        mouseX = ev.pageX;
        mouseY = ev.pageY;
        //alert(mouseX + ' ' + mouseY);
		defect_count = defect_count + 1;
		//defect_object = {};
		//defect_object.type = 
		//defect_array = 
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
		// can add coordinates here as well
		defects.push(defect_object);
		$("body :last").css('background-color', 'blue');
		$("#defectDiv").hide();
		adding_defect = false;
	}
	
    function showDiagram() {	
		type = $("#car_type").val();
		side = $("#car_side").val();
		if (type === "saab") {
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
		else if (type === "mercedes") {
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
	    else if (type === "audi") {
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
		var session_object = { report : session_array };
		var session_json = JSON.stringify(session_object);
		
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

	.diagramDiv img { padding: 25px 10px 25px 10px; }

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
