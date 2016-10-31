<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 스토리 검색</title>

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
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css">    
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
    
    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <style type="text/css">
    	.projects, .project-share {
    		border: 1px solid #e5e5e5;
    	}
   		.img-responsive-custom {
			display: block;
			width: 100%;
			position:absolute;
		}
    	
    </style>
</head>

<body>
<div class="wrapper">

 	<!--=== Header ===-->  
 	<jsp:include page="./template/header.jsp"></jsp:include>  
    <!--=== End Header ===-->

    <!--=== Breadcrumbs ===-->
   <div class="breadcrumbs-v3 img-v1" style="background: url(/trabab/resources/assets/img/photogal_img/asdf.jpg) no-repeat;  background-size:cover; background-position: center center;">      
   
      <div class="container text-center">
         <h1>검색 결과</h1>
            <!--=== Search Block Version 2 ===-->
     <div class="search-block-v2" style="margin-bottom:30px">
        <div class="container">
			<form action="search.main">
				<div class="col-md-6 col-md-offset-3">
				    <div class="input-group">
				  	  	<input type="hidden" name="stype" value="<%=request.getParameter("stype") == null ? "" : request.getParameter("stype")%>" />
				        <input type="text" name="skey" class="form-control" placeholder="검색어를 입력하세요." value="<%=request.getParameter("skey") == null ? "" : request.getParameter("skey")%>">
				        <span class="input-group-btn">
				            <button type="submit" class="btn-u" type="button"><i class="fa fa-search"></i></button>
				        </span>
				    </div>
				</div>
           </form>
        </div>    
    </div>   
    <!--=== End Search Block Version 2 ===-->
		</div><!--/end container-->
	</div>

	<!-- Content -->
	<div class="bg-color-white">
		<!-- container가 묶고 있음 -->
    <div class="container content profile">

<!-- Profile Content -->            
     <div class="profile-body" style="background-color: white; border:1px; ">
		<div class="text-center margin-bottom-50">
            <h2 class="title-v2 title-center">TRAVEL STORY</h2>
        </div>
           <div class="col-md-12">
                <div align="right" style="margin-top:0px; margin-bottom:15px">
                <a href="list_view.travel?cpage=1${travelListVo.sUrl}" class="btn-u btn-brd rounded-4x" type="button"><i class="icon-plus"></i> 더보기</a>
                   </div>
                    <!--Projects-->
                    <div class="row">
                    <!-- 게시물 한개 예시!!!!!!!!!!! -->
                    	<c:forEach items="${travelListVo.travelTotalVoList}" var="travel_dto">
                        <div class="content_container col-sm-3">
                            <div class="service-or easy-block-v2 no-margin-bottom"  style="overflow:hidden; width:100%;height:0px; padding-bottom:70%;">
                                <a href="content_view.travel?travel_no=${travel_dto.travel_no }${travelListVo.sUrl}"><img class="img-responsive-custom" src="/trabab/resources/uploadimg/${travel_dto.travel_image }" alt=""  style=" width:100%;" /></a>
                            </div>   
                            <div class="projects">
                                <div style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><h2><a href="content_view.travel${travelListVo.sUrl}&travel_no=${travel_dto.travel_no }">${travel_dto.travel_subject }</a></h2></div>
                                <ul class="list-unstyled list-inline blog-info-v2" style="margin-bottom:0px">
                                    <li>By: <a class="color-green" href="#">${travel_dto.member_nickname}</a></li>
                                </ul>
                                <ul class="list-unstyled list-inline blog-info-v2">
                                    <li><i class="fa fa-clock-o"></i> ${travel_dto.travel_wdate}</li>
                                </ul>
                            </div>    
                            <div class="project-share">
                                <ul class="list-inline comment-list-v2 pull-left">
                                    <li><i class="fa fa-eye"></i> <a href="#">${travel_dto.travel_hit }</a></li>
                                    <li><i class="fa fa-comments"></i> <a href="#">${travel_dto.travel_comment_cnt }</a></li>
                                    <li><i class="fa fa-heart"></i> <a href="#">${tavel_dto.travel_like_cnt }</a></li>
                                </ul>    
                            </div>
                        </div>
                        <!-- 게시물 예시끝!!!! -->
                        </c:forEach>
                	</div>
					<!--/end row-->
                    <!--End Projects-->
                    
           		</div>
            <!-- End Profile Content --> 
		</div>
	</div>
		<div class="container content profile">
		<div class="profile-body" style="background-color: white">
		<div class="text-center margin-bottom-50">
            <h2 class="title-v2 title-center">TASTY STORY</h2>
        </div>
           <div class="col-md-12">
           <div align="right" style="margin-top:0px; margin-bottom:15px">
                <a href="list_view.food?cpage=1${foodListVo.sUrl }" class="btn-u btn-brd rounded-4x" type="button"><i class="icon-plus"></i> 더보기</a>
                   </div>
                    <!--Projects-->
                    <div class="row">
                    <c:forEach items="${foodListVo.foodVoList }" var="food_dto">
                    <!-- 게시물 한개 예시!!!!!!!!!!! -->
                        <div class="col-sm-3">
                            <div class="service-or easy-block-v2 no-margin-bottom"  style="overflow:hidden; width:100%;height:0px; padding-bottom:70%;">
                                <a href="content_view.food?food_no=${food_dto.food_no }${foodListVo.sUrl }"><img class="img-responsive-custom" src="/trabab/resources/uploadimg/${food_dto.food_image}" alt="" style="width:100%;"/></a>
                            </div>   
                            <div class="projects">
                                <div style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><h2><a class="color-dark" href="content_view.food${foodListVo.sUrl }&food_no=${food_dto.food_no }">${food_dto.food_subject }</a></h2></div>
                                <ul class="list-unstyled list-inline blog-info-v2" style="margin-bottom:0px">
                                    <li>By: <a class="color-green" href="#">${food_dto.member_nickname }</a></li>
                                </ul>
                                <ul class="list-unstyled list-inline blog-info-v2">
                                    <li><i class="fa fa-clock-o"></i> ${food_dto.food_wdate }</li>
                                </ul>
                            </div>    
                            <div class="project-share">
                                <ul class="list-inline comment-list-v2 pull-left">
                                    <li><i class="fa fa-eye"></i> <a href="#">${food_dto.food_hit }</a></li>
                                    <li><i class="fa fa-comments"></i> <a href="#">${food_dto.food_comment_cnt}</a></li>
                                    <li><i class="fa fa-heart"></i> <a href="#">${food_dto.food_like_cnt }</a></li>
                                </ul>    
                                <ul class="list-inline star-vote pull-left">
                                    <li><i class='color-green fa fa-star${food_dto.food_lv_average == 0? "-o" : "" }'></i></li>
                                    <li><i class='color-green fa fa-star${food_dto.food_lv_average <= 1? "-o" : "" }'></i></li>
                                    <li><i class='color-green fa fa-star${food_dto.food_lv_average <= 2? "-o" : "" }'></i></li>
                                    <li><i class='color-green fa fa-star${food_dto.food_lv_average <= 3? "-o" : "" }'></i></li>
                                    <li><i class='color-green fa fa-star${food_dto.food_lv_average <= 4? "-o" : "" }'></i></li>
                                </ul>
                            </div>
                        </div>
                        <!-- 게시물 예시끝!!!! -->
                        </c:forEach>
                	</div>
					<!--/end row-->
                    <!--End Projects-->
                    <br /><hr /><br />
                    
           		</div>
            <!-- End Profile Content --> 
		</div>
		
	</div>
	</div>
	<!-- End Conten -->
	
	<!-- footer -->
	<jsp:include page="./template/footer.jsp"></jsp:include>
	
</div>
<!-- General Unify Forms -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/counter/waypoints.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/counter/jquery.counterup.min.js"></script> 
<script type="text/javascript" src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- 이미지 슬라이드 -->
<script type="text/javascript" src="/trabab/resources/assets/js/slide/fotorama.js"></script>

<!-- JS Customization -->
<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>

<!-- JS Page Level -->
<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>

<!-- ë¬ë ¥ -->
<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>

<!-- 맵 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_lAcXGJIz-YvdOqtlfFC_cB2hC3lDIsc&callback=initMap"
 async defer></script>

<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();
        Datepicker.initDatepicker();
    }); 
    //End Template
</script>


<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
