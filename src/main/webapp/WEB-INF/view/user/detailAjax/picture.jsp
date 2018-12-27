<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${pictureList }" var="pVo">
	<div>
		<img src="${pVo.pic_file_path }" width="300" height="auto"/>
	</div>
</c:forEach>