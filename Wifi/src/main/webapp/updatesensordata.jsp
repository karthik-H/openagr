<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Data</title>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/button.css">
</head>
<body>
<div class="header">
<img src="F:\karthik\openagr\openagr.png" alt="OpenAgr Icon" style="width:128px;height:128px;
left:50%;">
</div>
<ul>
  <li><a href="/Wifi/SensorData">SensorData</a></li>
  <li><a href="/Wifi/CbrAlgorithm">Algorithm</a></li>
  <li><a class="active" href="updatesensordata.jsp">Update Data</a></li>
  <li><a href="#contact">About</a></li>
</ul>

<form action="/Wifi/UpdateData">
    <button class="button" name = "btn" value="all"><span>All </span>
</button>


<button class="button" name = "btn" value="moisture"><span>Moisture </span>
</button>
<button class="button" name = "btn" value = "temp"><span>Temperature</span>
</button>
    
</form>
</body>
</html>