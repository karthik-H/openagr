<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CBR algorithm</title>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<div class="header">
<img src="F:\karthik\openagr\openagr.png" alt="OpenAgr Icon" style="width:128px;height:128px;
left:50%;">
</div>
<ul>
  <li><a href="/Wifi/SensorData">SensorData</a></li>
  <li><a class="active" href="findcrop.jsp">Algorithm</a></li>
  <li><a href="updatesensordata.jsp">Update Data</a></li>
  <li><a href="#contact">About</a></li>
</ul>

<table>
		<tr>
		<td> ID </td>
		<td> Latitude </td>
		<td> Longitude </td>
		<td> Accurecy </td>
		<td> Soil PH </td>
		<td> Moisture </td>
		<td> Temperature </td>
		<td> Avg Rainfall </td>
		</tr>
       <c:forEach items="${sensordata}" var="sensordata">
       
            <tr>
                <td><c:out value="${sensordata.id}"/></td>
                <td><c:out value="${sensordata.latitude}"/></td>
                <td><c:out value="${sensordata.longitude}"/></td>
                <td><c:out value="${sensordata.accurecy}"/></td>
                <td><c:out value="${sensordata.soil_ph}"/></td>
                <td><c:out value="${sensordata.moisture}"/></td>
                <td><c:out value="${sensordata.temperature}"/></td>
                <td><c:out value="${sensordata.avg_rainfall}"/></td>
                   
            </tr>
        </c:forEach>
        
    </table>
    <table>
    <tr>
    <td> Prediction</td>
    </tr>
            <c:forEach items="${prediction}" var="prediction">
        	<tr>
        	<td><c:out value="${prediction}"/></td>
        	</tr>
        </c:forEach>
    </table>


</body>
</html>