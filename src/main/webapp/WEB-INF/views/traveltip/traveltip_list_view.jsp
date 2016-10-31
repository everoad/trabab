<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    
<!DOCTYPE html> 
<html>
<head>
<title>TraBaB - 여행 팁 게시판</title>
<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>
<link rel='stylesheet' type='text/css' href='/trabab/resources/assets/img/traveltipimg/common.css' href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">


  <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/headers/header-default.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/fancybox/source/jquery.fancybox.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">    
    
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css">    
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css">

    <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
    -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
	<link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery.parallax.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/counter/waypoints.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/counter/jquery.counterup.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
	<!-- JS Page Level -->           
	<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        App.init();
	        App.initCounter();
	        App.initParallaxBg();
	        OwlCarousel.initOwlCarousel();
	        
	   		$('#select option').each(function(index) {
	   			var isSelected = '<%=request.getParameter("stype")%>';
	   			if($(this).val() == isSelected) {
	   				$(this).attr('selected', true);
	   			}
	   		});

	   		$('#category option').each(function(index) {
	   			var isSelected = '<%=request.getParameter("traveltip_category_no")%>';
	   			if($(this).val() == isSelected) {
	   				$(this).attr('selected', true);
	   			}
	   		});
	    });
	</script>
	<style type="text/css">
		#notice {
			color: red;
		}
		.notice_tr {
			background: #E4F7BA;
		}
		.table_title {
			background: #72c02c;
		}
	</style>
</head>

<body bgcolor='#ffffff' topmargin='5' rightmargin='0' leftmargin='5' bottommargin='10'>
<div class="wrapper">
	<jsp:include page="../template/header.jsp"></jsp:include>

	<div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/traveltip.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
       		<span>TRAVEL TIP</span>
            <h1>여행 팁 게시판</h1>
        </div>
    </div>
	<!-- Content -->
	<div class="bg-color-white">
		<!-- container가 묶고 있음 -->
        <div class="container content profile">
            <div class="row">
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>
			
				<div class="col-md-9 sky-form" border='0' cellpadding='0' cellspacing='0' align='center'>
					<table class="table well">
						<tr height='30' align='center' class="table_title">
							<td width='40'>No</td>
							<td width='140'>카테고리</td>
							<td>제목</td>
							<td width='100'>이름</td>
							<td width='60'>등록일</td>
							<td width='50'>조회수</td>
						</tr>
					<c:forEach items="${travelTipNoticeListVo}" var="dto" varStatus="status">
						<tr class="notice_tr">
							<td width='50' align='center' id="notice">공지</td>
							<td width='140' align='center' ><span style='width:370' class='elltxt'>${dto.traveltip_category_name }</span></td>
								<td align='center'><a href='content_view.traveltip?traveltip_no=${dto.traveltip_no}&cpage=${travelTipListVo.cpage}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'>${dto.traveltip_subject}(${dto.traveltip_comment_cnt })</a>
								<img src='/trabab/resources/assets/img/traveltipimg/ico_n.gif' width='8' height='8' border='0' hspace='3'>
							</td>
							<td width='100' align='center'>${dto.member_nickname }</td>
							<td width='70' align='center'>${dto.traveltip_wdate }</td>
							<td width='50' align='center'>${dto.traveltip_hit }</td>
						</tr>
					</c:forEach> 
					<c:forEach items="${travelTipListVo.traveltipVoList }" var="dto" varStatus="status">
						<tr>
							<td width='40' align='center' >${travelTipListVo.countNum - status.count + 1}</td>
							<td width='140' align='center' ><span style='width:370' class='elltxt'>${dto.traveltip_category_name }</span></td>
								<td align='center'><a href='content_view.traveltip?traveltip_no=${dto.traveltip_no}&cpage=${travelTipListVo.cpage}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'>${dto.traveltip_subject} (${dto.traveltip_comment_cnt })</a>
								<img src='/trabab/resources/assets/img/traveltipimg/ico_n.gif' width='8' height='8' border='0' hspace='3'>
							</td>
							<td width='100' align='center'>${dto.member_nickname }</td>
							<td width='70' align='center'>${dto.traveltip_wdate }</td>
							<td width='60' align='center'>${dto.traveltip_hit }</td>
						</tr>
					</c:forEach>
					</table>
					<div align="right">
						<a href='list_view.traveltip' class="btn-u btn-u-default btn-u-sm">처음으로</a>
						<a href='write_view.traveltip?cpage=${travelTipListVo.cpage}${travelTipListVo.sUrl}${travelTipListVo.cUrl}' class="btn-u btn-u-default btn-u-sm">글쓰기</a>
					</div>
					
					<!-- 페이지 네비게이션 -->
					<div class="text-center">
                        <ul class="pagination">
            				<c:set var="morepreviousUrl" value='list_view.traveltip?cpage=${travelTipListVo.startBlock - travelTipListVo.blockPerPage}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'></c:set>
							<c:set var="morenextUrl" value='list_view.traveltip?cpage=${travelTipListVo.startBlock + travelTipListVo.blockPerPage}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'></c:set>
							<c:set var="previousUrl" value='list_view.traveltip?cpage=${travelTipListVo.cpage-1}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'></c:set>
		                    <c:set var="nextUrl" value='list_view.traveltip?cpage=${travelTipListVo.cpage+1}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'></c:set>
                           	
                           	<li><a href='${(travelTipListVo.cpage == 1) ? "javascript:;" : previousUrl }'>&laquo;</a></li>
                            <c:forEach begin="${travelTipListVo.startBlock}" end="${travelTipListVo.endBlock}" varStatus="status">
                            	<c:if test="${status.count == travelTipListVo.cpage }">
		                            <li class="active"><a href="javascript:;">${status.count}</a></li>
                            	</c:if>
           						<c:if test="${status.count != travelTipListVo.cpage }">
		                            <li><a href='list_view.traveltip?cpage=${status.count}${travelTipListVo.sUrl}${travelTipListVo.cUrl}'> ${status.count } </a></li>
           						</c:if>
                            </c:forEach>
                            <li><a href='${(travelTipListVo.cpage == travelTipListVo.totalPage) ? "javascript:;" : nextUrl }'>&raquo;</a></li>
                        </ul>  
                    </div>
                    
                    <div align="center">
						<form action="list_view.traveltip" method="get" class="sky-form form-inline">
						<div class="form-group-sm">
							<select name='traveltip_category_no' class='form form-control' id="category">		
							   <option selected='selected' disabled>카테고리 검색</option>
							   <option value='1'>혼자여행 짐 싸기</option>
							   <option value='2'>혼자 쉬기 좋은 숙소</option>	
							   <option value='3'>현재 여행지 날씨</option>
							   <option value='4'>교통수단, 경로 추천</option>
							   <option value='5'>여행지 할인 정보</option>
							   <option value='6'>지역축제 즐겨요</option>
							   <option value='7'>이런 일 조심하세요</option>
							   <option value='8'>Must Buy Item</option>
							   <option value='9'>기타</option>
					  		</select>
							<select name='stype' class='form form-control' id="select">		
							   <option selected='selected' value='traveltip_subject'>제목</option>
							   <option value='traveltip_content'>내용</option>
							   <option value='member_nickname'>작성자</option>	
					  		</select>
							<input type='text' id="skey" name='skey' size='20' maxlength='20' class='form form-control' placeholder="검색.." value="<%=(request.getParameter("skey") == null) ? "" : request.getParameter("skey")%>">
							<input type="submit" value="검색" class="btn-u form-control"/>
						</div>
						</form>
					 </div>
				</div>	
				<div class="col-md-1"></div>	
			</div>
		</div>
	</div>	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>
