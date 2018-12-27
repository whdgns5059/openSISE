<%--------------------------------------------------------------------------------
	* 화면명 : Smart Editor 2.8 에디터 - 글 작성후 서버전송 처리
	* 파일명 : /page/test/send.jsp
--------------------------------------------------------------------------------%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//한글 인코딩을 위한 UTF-8 설정
	request.setCharacterEncoding("utf-8");
	out.println("<에디터 결과>");
	out.println("<br/>");
	out.println(request.getParameter("smarteditor"));	// html코드형식의 데이터
%>