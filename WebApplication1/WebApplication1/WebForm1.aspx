﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="diagramDiv">
        <img onclick="addDefect()" src="http://www.ceco.net/zDepot/drawing-png-files/audi-tt-roadste-convertible-vehicles-cars-free-autocad-blocks-92.dwg.png" />
    </div>
    <div id="defectDiv"></div>
    </form>
</body>
</html>
<script>
    function addDefect() {
        console.log('add Defect');
    }

   

</script>