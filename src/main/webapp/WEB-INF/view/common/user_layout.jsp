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
	.row {width : 1900px !important;}
	.contentWrapper {height: 1000px}
</style>


</head>
<body>
	<div class="pageWrapper">
	<tiles:insertAttribute name="header"/>
	
		<div class="contentWrapper">
			<!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 -->
			<tiles:insertAttribute name="content"/>
		</div>
		<div>	
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</body>
<!-- </html> -->