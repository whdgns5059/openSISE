<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function setAgeCircle(){
	console.log("circle����");
	var colorList = new Array();
	colorList.push("#f7cc06");
	colorList.push("#f38b72");
	colorList.push("#aad035");
	colorList.push("#71afdd");
	colorList.push("#bc80d2");
	colorList.push("#909090");
	colorList.push("#3ea6c8");
	colorList.push("#f4b344");
	colorList.push("#f29c3e");
	colorList.push("#4385cd");
	colorList.push("#61c773");
	colorList.push("#b07748");
	colorList.push("#d080aa");
	colorList.push("#cec440");
	colorList.push("#9d8cc1");
	var i = 0;
	// ���ɻ� �� �ִ�ġ
	var allCnt = ${ageHumanStatisMaxValue} +1;
	
	/* ���ɻ纰 ���� �׷��� */
	var ageCircle = {
	 	type: "ring",
	 	title : {
	 		text: "���� �� �α� ���� ��Ʈ",
	 		fontFamily : 'Lato',
	 		fontSize :20,
	 		fontColor : "#1E5D9E",
	 	},
	 	plot: {
	 	  slice:'50%',
	 	  borderWidth:0,
	 	  animation:{
	 	    effect:2,
	 	    sequence:3
	 	  },
	 	  valueBox: [
	 	    {
	 	      type: 'all',
	 	      text: '%t',
	 	      placement: 'out'
	 	    }, 
	 	    {
	 	      type: 'all',
	 	      text: '%npv%',
	 	      placement: 'in'
	 	    }
	 	  ]
	 	},
	// �ձ���Ʈ ��� ����
	tooltip:{
	 	fontSize:16,
	 	anchor:'c',
	 	x:'50%',
	 	y:'58%',
	 	sticky:true,
	 	backgroundColor:'none',
	 	borderWidth:0,
	 	thousandsSeparator:',',
	 	text:'<span style="color:%color"> %t</span><br><span style="color:%color">�ο� ��: %v</span>',
	    mediaRules:[ { maxWidth:500, y:'54%' }]
	},
	plotarea: {
		backgroundColor: 'transparent',
	 	borderWidth: 0,
	 	borderRadius: "0 0 0 10",
	 	margin: "30 0 30 0"
	},
	// ���� ��Ʈ�ѷ�
	legend : {
		layout: 'x8',
	    toggleAction:'remove',
	    borderWidth:0,
	    adjustLayout:true,
	    align:'center',
	    verticalAlign:'top',
	    margin: '30 0 0 0',
	    marker: {
	        type:'circle',
	        cursor:'pointer',
	        borderWidth:0,
	        size:5
	    },
	    item: {
	        fontColor: "#777",
	        cursor:'pointer',
	        offsetX:-6,
	        fontSize:12
	    },
	    mediaRules:[{ maxWidth:500, visible:false}]
	},
	scaleR:{
	  refAngle:270
	},
	series : [
		// ���ɺ� ������
		 <c:forEach items="${ageCircle}" var="age">
			{
			 	text: '${age.hs_age_grp}',
				values : [${age.hs_hm_no}],
				backgroundColor: colorList[i++], 
				lineWidth: 1,
				marker: {
				  backgroundColor: colorList[i]
				}
			},
		</c:forEach>
	]};
	zingchart.render({ 
		id : 'ageCircle', 
	 	data: {
	    graphset: [ageCircle]
	  },
		height: '100%', 
		width: '99%' 
	});
}

setAgeCircle();
</script>