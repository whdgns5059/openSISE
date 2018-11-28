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

<style type="text/css">
 div { border : 1px solid red; }
</style>
 
</head>
<body>
	<tiles:insertAttribute name="header"/>

	<!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 -->
	<!-- 전체 contents div -->
	<div class="row" style="height:600px !important">
	<!-- left contents -->
		<div class="col-xs-12 col-md-8" style="padding-right: 0 !important">
	
			<!-- map -->
			<div class="jumbotron" style="width: 1030px; height:100%;" id="map" >
			</div>

		</div>
	<!-- right contents -->	
		<div class="col-xs-6 col-md-4" style="padding-left: 0 !important">
			 <tiles:insertAttribute name="content"/>
		</div>

	</div>

	<tiles:insertAttribute name="footer"/>

</body>
</html>