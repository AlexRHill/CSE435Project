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
        <div id="dropBoxDiv">            
            <select onchange="showSelect2()">
              
              <option value="volvo">Choose Vehicle</option>
              <option value="saab" >Saab</option>
              <option value="mercedes" >Mercedes</option>
              <option value="audi" >Audi</option>
             
            </select>
            <select onchange="showDiagram()" id="select2">
              <option value="top" >Choose Side</option>
              <option value="left" >left</option>
              <option value="right">top</option>  
                <option value="right">right</option>               
            </select>
        </div>

        <div id="diagramDiv">
            <img onclick="addDefect(event)" src="http://www.ceco.net/zDepot/drawing-png-files/audi-tt-roadste-convertible-vehicles-cars-free-autocad-blocks-92.dwg.png" />
        </div>
        <div id="defectDiv" class="defectDiv">
            <h2>Defect</h2>
            <p contenteditable="true">Type:</p>
            <p contenteditable="true">Severity:</p>
			<input type="button" value="Undo" runat="server" onclick="undoDefect()" class="button">
        </div>
    </form>
</body>
</html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script>
    $("#select2").hide();
    $("#defectDiv").hide();
    $("#diagramDiv").hide();
	var defect_count = 0;
    function showSelect2() {
        $("#select2").show();
    }
    function addDefect(ev) {
        console.log('add Defect');
        $("#defectDiv").show();
        mouseX = ev.pageX;
        mouseY = ev.pageY;
        //alert(mouseX + ' ' + mouseY);
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
    }
    function showDiagram() {
        $("#diagramDiv").show();
    }
	
	function undoDefect() {
	    if (defect_count > 0) {
			defect_count = defect_count - 1;
			$("body :last").remove();
		}
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
