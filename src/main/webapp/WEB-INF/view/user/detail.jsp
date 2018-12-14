<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/detail.css" rel="stylesheet">

<script type="text/javascript" src="/js/jquery.raty.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		settingMap();
		setRadarChart();
		reviewControl();
		detailInfoAjax($('.areaButton')[0].innerHTML);

		
		$('#areaDiv').on('click', '.areaButton', function(){
			
			var area = this.innerHTML;
			detailInfoAjax(area);
			
		});
		
		$('#insertReview').click(function(){
			
			$('#reviewFrm').submit();	
			
			
		});
		
		
	});
	
	<%-- 지도 함수 --%>
	function settingMap(){
		// 해당 주소에 대한 좌표값을 담을 변수
		var x;
		var y;
	
		// 해당 주소를 담을 값
		var addr;
		
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(36.3505393936125,127.38483389033713), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(36.3505393936125, 127.38483389033713);
		//마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});
		
		
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		//주소 좌표 변환 객체
		var geocoder = new daum.maps.services.Geocoder();

		
		<%-- toLocal 클릭시 좌표읽어서 이동 --%>
		$('.toLocal').on('click', function(){
			
			var geocoder = new daum.maps.services.Geocoder();
	
			var center = map.getCenter();

			var coord = new daum.maps.LatLng(center.getLat(), center.getLng());
			var callback = function(result, status) {
			    if (status === daum.maps.services.Status.OK) {
			    	
			    	var gu = result[0].address.region_2depth_name;
			    	var dong = result[0].address.region_3depth_name;

	
			    	location.href="/local/local?gu="+gu+"&dong="+dong;
			    	
			    }
			};

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			
				
		});
	}
	

	
	<%-- 다각형 그래프 --%>
	function setRadarChart(){
		
		var radarChartData = {

		type: 'radar',  
		title: { text: 'openSISE 점수표'  },
		legend: {}, // Creates an interactive legend
		series: [  { values: [28, 40, 39, 36, 12] } ],
		scaleK : { labels : ["물가", "교통", "상업시설", "편의시설", "물가"] }
		};

		zingchart.render({ // Render Method[3]
		  id: 'radarChartDiv',
		  data: radarChartData,
		});

	}
	
	
	<%-- 리뷰 컨트롤 --%>
	function reviewControl(){
		$('.reviewDetailWrapper').hide();
		
		$('.titleWrapper').on('click',  function(){
			if($(this.nextElementSibling).is(':visible')){
				$(this.nextElementSibling).hide("slow");
			}else{
				$(this.nextElementSibling).show("slow");
			}
		});
	}
	

	<%-- 상세 정보 ajax--%>
	function detailInfoAjax(area){
		
		var artcl_gu = document.getElementById('artclGu').innerHTML;
		var artcl_dong = document.getElementById('artclDong').innerHTML;
		var artcl_zip = document.getElementById('artclZip').innerHTML;
		var artcl_rd = document.getElementById('artclRd').innerHTML;
		var dl_ty = document.getElementById('dlTy').innerHTML;
		var dl_excv_area = area;
		
		var ajaxData = {
			artcl_gu : artcl_gu,
			artcl_dong : artcl_dong,
			artcl_zip	: artcl_zip,
			artcl_rd : artcl_rd,
			dl_ty : dl_ty,
			dl_excv_area : dl_excv_area
		}	
		
		$.ajax({
			type : 'POST',
			url : '/detail/tradeInfoAjax',
			data : ajaxData,
			success : function(data){
				$('#tradeInfoWrapper').html(data);
			}	
			
		});
	}

    $(function() {
        $('div#star').raty({
            score: 3
            ,path : "/img"
            ,width : 200
            ,click: function(score, evt) {
                $("#starRating").val(score);
                $("#displayStarRating").html(score);
            }
        });
    });
    
    
    function wrapWindowByMaskReview(){
    	
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  

        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    

        //윈도우(팝업창) 띄운다.
       	$('.reviewWindow').show();

    }
</script>
	
	
<div id="mask"></div>	
<div class="row" style="height: 850px !important">
 	
	<input type="hidden" id="hello" value="${asdf }">
	
	<div id="mapWrap">
	<!-- 지도-->
	<div id="map"> </div>
	<!-- 지도 오버레이(지역분석으로 이동) -->
	<div class="toLocal">
		<img src="https://via.placeholder.com/100x100?text=toLocal" />
	</div>
	</div>	
	
	
	<!-- right contents -->
	<div id="rightContentWrapper">
		<div id="rightContent">

			<div id = "articleNameDiv">
				<span id="articleNameSpan">${selectArticleVo.artcl_complx}</span>
				<br/>
				<span id="artclGu">${selectArticleVo.artcl_gu}</span> 
				<span id="artclDong">${selectArticleVo.artcl_dong}</span> 
				<span id="artclZip">${selectArticleVo.artcl_zip}</span>
				<span id="artclRd">${selectArticleVo.artcl_rd}</span><br/>
				<span id="dlTy">${dl_ty}</span>
				<hr/>
				
			</div>
				<div id="areaDiv">
					<c:forEach items="${selectAreas }" var="area">
						<button class="areaButton">${area  }</button>
					</c:forEach>
				</div>
			<div id="tradeInfoWrapper">
				
			</div>
			<div id="radarChartDiv">
			</div>
			<div>
				<button class="openMask" id="reviewMask">글쓰기</button>
				<div class="window reviewWindow" id="reviewWindow'>
					<form id="reviewFrm" action="/detail/insertReview" method="post">
						<div class="notice-pop">
							<div> 
								<input type="hidden" name="post_mem" value="${nowLogin.mem_no }"/>
								<input type="hidden" name="post_brd" value="1"/>
								<input type="hidden" name="post_gu" value="${selectArticleVo.artcl_gu}"/>
								<input type="hidden" name="post_dong" value="${selectArticleVo.artcl_dong}"/>
								<input type="hidden" name="post_zip" value="${selectArticleVo.artcl_zip}"/>
								<input type="hidden" name="post_rd" value="${selectArticleVo.artcl_rd}"/>
							</div>
							<div>
								<span>제목 : </span>
								<input type="text" name="post_ttl">
							</div>	
							<div>
								<input type="textarea" name="post_cntnt" >
							</div>
							<div id="star" ></div>
								<input type="hidden" id="starRating" name="post_star" value="3"/>
							<div>
								<input type="button" id="insertReview" value="작성" />
								<input type="button" id="cancelReview" class="close" value="취소" />
							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="reviewDiv">
				<c:forEach begin="1" end="2">
					<div class="reviewWrapper">
						<div class="titleWrapper">
							<div class="reviewDate"> 2018-10-20</div>
							<div class="reviewTitle"> 집에서 쥐가 나와요</div>
							<div class="reviewWriter"> whdgns****</div>
						</div>
						<div class="reviewDetailWrapper">
							<div class="starDivWrapper">
								<div class="starDiv"><img src="https://via.placeholder.com/180x30"/></div>
								<div class="reportDiv"> <img src="https://via.placeholder.com/30"/></div>
							</div>
							<div class="photo">
								<img src="https://via.placeholder.com/200" />
								<img src="https://via.placeholder.com/200" />
							</div>
							<div class="reviewText">
								<p>리뷸비류비류비류비류비ㅠㄹ디ㅠㅁㄹ;ㅣㅏ덜미ㅏㄴ더로ㅓ올키ㅏ터올키ㅏ터올키타어로
									ㅁㄴㅇㄻㄴㄹㄷㅁㄴㄻㄴㄷㄻㄴㄷ라ㅕㅓㅋ농리ㅏㅓㅋ통리ㅏㅓㅋ녿ㄱ리ㅐㅏㅓㅋ녿ㄹ기ㅏ컨룈나ㅓ
								</p>
							</div>
							<div class="reviewModify">
								<button>수정</button><button>삭제</button>
							</div>
							<div class="replyWrapper">
								<div class="reply">
									fewfw*** : 야호호오오오ㅗ오오옹 <br/>
									fed2***  : 야호돚도롲돌졷ㄹ<br/>
								</div>
								<div class="writeReply">
									<input type="text" /> <button>입력</button>
								</div>
							</div>
						</div>
					</div>	
				</c:forEach>
			</div>
		</div>
	</div>
</div>