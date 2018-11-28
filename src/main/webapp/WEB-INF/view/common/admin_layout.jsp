<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 


</head>
<body>
	<tiles:insertAttribute name="header"/>

	<div class="row">	
		<tiles:insertAttribute name="left"/>

		<!-- right contents -->	
		<tiles:insertAttribute name="content"/>
	</div>


</body>
</html>