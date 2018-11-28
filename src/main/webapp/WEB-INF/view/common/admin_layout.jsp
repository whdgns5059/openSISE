<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<%@ include file="/WEB-INF/view/common/basicLib.jsp" %> 

	<style type="text/css">
	 div {
	 border : 1px solid red;
	 }
	</style>
 

</head>
<body>
<tiles:insertAttribute name="header"/>



<!-- contents -->
	<!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 -->
	<div class="row" style="height:670px !important">
	
	<tiles:insertAttribute name="left"/>

	<!-- right contents -->	
		<div class="col-xs-12 col-md-10" style="padding-left: 0 !important">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>



</body>
</html>