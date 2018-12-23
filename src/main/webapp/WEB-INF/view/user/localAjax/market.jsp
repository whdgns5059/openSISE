<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
.tab-yellow .nav-link, .tab-yellow .nav-link.disabled, .tab-yellow .nav-link.disabled:hover, 
.tab-yellow .nav-link.disabled:focus{
	border-color: #f4b344;
}
.tab-yellow {
	border-color: #f4b344;
}
.tab-yellow .nav-link:hover, .tab-yellow .nav-link:focus {
	background: #f4b344;
}
.tab-green .nav-link, .tab-green .nav-link.disabled, .tab-green .nav-link.disabled:hover, 
.tab-green .nav-link.disabled:focus{
	border-color: #aad035;
}
.tab-green {
	border-color: #aad035;
}
.tab-green .nav-link:hover, .tab-green .nav-link:focus {
	background: #aad035;
}

.marketHead {padding: 20px;}
</style>
<div>
	<div class="marketHead">
		<h4>xx동 물가정보</h4>
		<hr/>
	</div>
	
	<div id="marketChart">
	</div>	
	
	<div>
		물가표
	</div>
</div>

<script src="/js/market.js"> </script>