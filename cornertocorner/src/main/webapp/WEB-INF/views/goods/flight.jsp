<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>항공 목록</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker3.standalone.css'>
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
</head>
<body>
	<div class = "container">
		<div class="input-daterange input-group" id="flight-datepicker">
			<div class="form-item">
				<label>Depart on</label><span class="fontawesome-calendar"></span>
				<input class="input-sm form-control" type="text" id="start-date" name="start" placeholder="Select depart date" data-date-format="DD, MM d"/><span class="date-text date-depart"></span>
			</div>
			<div class="form-item">
				<label>Return on</label><span class="fontawesome-calendar"></span>
				<input class="input-sm form-control" type="text" id="end-date" name="end" placeholder="Select return date" data-date-format="DD, MM d"/><span class="date-text date-return"></span>
			</div>
		</div>
	</div>
	
	<!-- partial -->
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.js'></script>
	<script  src="${contextPath}/resources/jquery/script.js"></script>
</body>
</html>