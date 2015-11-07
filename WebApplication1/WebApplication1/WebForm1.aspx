﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="dropBoxDiv">            
            <select onchange="showSelect2()">
               <optgroup label = "Choose Vehicle">
              <option value="volvo">Volvo</option>
              <option value="saab" >Saab</option>
              <option value="mercedes" >Mercedes</option>
              <option value="audi" >Audi</option>
               </optgroup>
            </select>
            <select id="select2">
              <option value="top" onselect="showDiagram()">top</option>
              <option value="left" onselect="showDiagram()">left</option>
              <option value="right" onselect="showDiagram()">right</option>              
            </select>
        </div>

        <div id="diagramDiv">
            <img onclick="addDefect()" src="http://www.ceco.net/zDepot/drawing-png-files/audi-tt-roadste-convertible-vehicles-cars-free-autocad-blocks-92.dwg.png" />
        </div>
        <div id="defectDiv" class="defectDiv">
            <h2>Defect</h2>
            <p contenteditable="true">Type:</p>
            <p contenteditable="true">Severity:</p>
        </div>
    </form>
</body>
</html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script>
    $("#select2").hide();
    $("#defectDiv").hide();
    $("#diagramDiv").hide();

    function showSelect2() {
        $("#select2").show();
    }
    function addDefect() {
        console.log('add Defect');
        $("#defectDiv").show();
    }

    function showDiagram() {
        $("#diagramDiv").show();
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

</style>