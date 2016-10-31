<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html> 
<html>
<head>
<title>TraBaB - 여행 팁 게시판</title>
<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>
<link rel='stylesheet' type='text/css' href='/trabab/resources/assets/img/traveltipimg/common.css'>
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
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css">    
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css">

    <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
    -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <script type="text/javascript">
    <%if(request.getAttribute("message") != null) {%>
		alert('${message }');
	<%}%>
    </script>
    <style type="text/css">
		@media all {
			.custom_table {
				width: 775px;	
			}
		}
	</style>
</head>

<body bgcolor='#ffffff' topmargin='5' rightmargin='0' leftmargin='5' bottommargin='10'>
<div class="wrapper">
	<jsp:include page="../template/header.jsp"></jsp:include>
	
	<div class="breadcrumbs-v1"  style="background: url(/trabab/resources/assets/img/photogal_img/traveltip.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
      	   <span>TRAVEL TIP</span>
           <h1>여행 팁 게시판</h1>
        </div>
    </div>
    
	<!-- Content -->
	<div class="bg-color-white">
		<!-- container가 묶고 있음 -->
        <div class="container content">
            <div class="row">
            
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>

				<table class="custom_table col-md-8" border='0' cellpadding='0' cellspacing='0' align='center'>
				
					<tr>
						<td bgcolor='#ffffff' style='padding:20'>
							<form action='modifyOk.traveltip' method='post' name='wfrm' onSubmit='return ChkForm()'>
								<input type='hidden' name='traveltip_no' value='${traveltipVo.traveltip_no }'>
							
								<table width='100%' border='0' cellpadding='0' cellspacing='0'>
									<tr>
										<td width='70' style='padding:5' valign='top' >
											<img src="/trabab/resources/assets/img/traveltipimg/pencil.PNG"><font family="맑은고딕"> <b>제목</b></font> 
										</td>
										<td>
											<input type='text' name='traveltip_subject' value='${traveltipVo.traveltip_subject }' size='110' class='form' id="subject">
										</td>
									</tr>
									<tr>
										<td colspan='2' class='imgline'></td>
									</tr>
									<tr>
										<td width='90' style='padding:5' valign='top' >
											<img src="/trabab/resources/assets/img/traveltipimg/pencil.PNG"><font family="맑은고딕"> <b>카테고리</b></font> 
										</td>
										<td>
											<select name='traveltip_category_no' id="select">
											   <option selected='selected' value='카테고리 선택'>카테고리 선택</option>
											   <option value='1'>혼자여행 짐 싸기</option>
											   <option value='2'>혼자 쉬기 좋은 숙소</option>
											   <option value='3'>현재 여행지 날씨</option>
											   <option value='4'>교통수단, 경로 추천</option>
											   <option value='5'>여행지 할인 정보</option>
											   <option value='6'>지역 축제 즐겨요</option>
											   <option value='7'> 이런 일 조심하세요</option>
											   <option value='8'>Must Buy Item</option>
											   <option value='9'>기타</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan='2' class='imgline'></td>
									</tr>
									<tr>
										<td width='70' style='padding:5' valign='top' >
											<img src="/trabab/resources/assets/img/traveltipimg/pencil.PNG"><font family="맑은고딕"> <b>내용</b></font> 
										</td>
										<td>
											<textarea name="traveltip_content" id="content" rows="10" style="width:610; height:300; display:none">${traveltipVo.traveltip_content }</textarea>
											
											<%-- <textarea name='content' style='width:620;height:300' class='form'><%=content %></textarea> --%>
										</td>
									</tr>
									<tr>
										<td colspan='2' class='gline'></td>
									</tr>
								</table>
								<br>
								<br>
								<table width='100%' cellpadding='0' cellspacing='0' border='0' style="padding-right:100px">
									<tr>
										<td width='590' height='30'>&nbsp;</td>
										<td align='right' style="padding-top : 4px; padding-right : 3px">
											<input type='image' src='/trabab/resources/assets/img/traveltipimg/modify.PNG' border='0'>&nbsp;
												<td align='left'>
											<a href='list_view.traveltip${sUrl}${cUrl}'><img src='/trabab/resources/assets/img/traveltipimg/list.png' border='0'></a>&nbsp;
											<a href='javascript:history.back();'><img src='/trabab/resources/assets/img/traveltipimg/view.png' border='0'></a>
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>		
			</div>
		</div>
	</div>	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</div>				
<script type="text/javascript" src="/trabab/resources/assets/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- CSS Customization -->
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
    });
	</script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/trabab/resources/assets/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            //bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false, 
        }
	});
	
	$('#select option').each(function(index){
		var isSelected = '${traveltipVo.traveltip_category_name}';
		
		if(isSelected == $(this).html()) {
			$(this).attr('selected', true);
		}
	});

	function ChkForm(form) {

		if(document.wfrm.traveltip_category_no.value.trim()=="카테고리 선택"){ 
			alert('카테고리를 입력하셔야 합니다.');
			return false;
		}
		
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
		try {
		elClickedObj.form.submit();
		} catch(e) {}
	}
</script>
</body>
</html>
