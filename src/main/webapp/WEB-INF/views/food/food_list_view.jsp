<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 맛집 후기</title>

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
    <style>
    	.board {
    		margin-bottom: 30px;
    	}
		.img-responsive-custom {
			display: block;
			width: 100%;
			position:absolute;
		}
    </style>
    <script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
</head>

<body>
<div class="wrapper">

 	<!--=== Header ===-->  
 	<jsp:include page="../template/header.jsp"></jsp:include>  
    <!--=== End Header ===-->

    <!--=== Breadcrumbs ===-->
	<div class="breadcrumbs-v3 img-v1" style="background: url(/trabab/resources/assets/img/photogal_img/tastystory.jpg) no-repeat;  background-size:cover; background-position: center center;">
		<div class="container text-center">
			 <h1>TASTY STORY</h1>
				<!--=== Search Block Version 2 ===-->
		     <div class="search-block-v2" style="margin-bottom:30px">
		        <div class="container">
		            <div class="col-md-6 col-md-offset-3">
		            	<form action="list_view.food">
			                <div class="input-group">
			                	<input type="hidden" name="cpage" value="1"/>
		                		<input type="hidden" name="stype" value="<%=(request.getParameter("stype")== null) ? "normal" : request.getParameter("stype") %>" />
			                    <input type="text" class="form-control" placeholder="검색어를 입력하세요." name="skey" value="<%=(request.getParameter("skey")== null)? "" : request.getParameter("skey") %>">
			                    <span class="input-group-btn">
			                        <button class="btn-u" type="submit"><i class="fa fa-search"></i></button>
			                    </span>
		    	            </div>
		                </form>
		            </div>
		        </div>    
		    </div>   
    <!--=== End Search Block Version 2 ===-->
		</div><!--/end container-->
	</div>

	<!-- Content -->
	<div class="bg-color-white">
		<!-- container가 묶고 있음 -->
        <div class="container content profile">

    
		    <!-- Filters Container -->
		    <div class="cube-portfolio container margin-bottom-0">
		        <div class="content-xs">
		            <div id="filters-container" class="cbp-l-filters-text content-xs" style="margin-bottom:10px">
		                <a href="list_view.travel?cpage=1${foodListVo.sUrl}"><div class="cbp-filter-item "> Travel </div></a> |
		                <div class="cbp-filter-item cbp-filter-item-active"> Tasty </div>
		            </div>
		        </div>
		     </div>
		      <!-- /end Filters Container -->
		      
		            <!-- Profile Content -->            
	           <div class="col-md-12">
	                <div class="profile-body">
	                    <!--Projects-->
	                    <div class="row">
	                    <!-- 게시물 한개 예시!!!!!!!!!!! -->
	                    	<c:forEach items="${foodListVo.foodVoList}" var="food_dto">
	                        <div class="col-sm-3 board">
	                            <div class="service-or easy-block-v2 no-margin-bottom"  style="overflow:hidden; height:0px; padding-bottom:70%;">
	                                <a class="color-dark" href="content_view.food?cpage=${foodListVo.cpage}${foodListVo.sUrl}&food_no=${food_dto.food_no}"><img class="img-responsive-custom" src="/trabab/resources/uploadimg/${food_dto.food_image }" alt=""></a>
	                            </div>   
	                            <div class="projects">
	                                <div style="width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><h2><a class="color-dark" href="content_view.food?cpage=${foodListVo.cpage}${foodListVo.sUrl}&food_no=${food_dto.food_no}">${food_dto.food_subject }</a></h2></div>
	                                <ul class="list-unstyled list-inline blog-info-v2" style="margin-bottom:0px">
	                                    <li>By: <a class="color-green" href="#">${food_dto.member_nickname }</a></li>
	                                </ul>
	                                <ul class="list-unstyled list-inline blog-info-v2">
	                                    <li><i class="fa fa-clock-o"></i>${food_dto.food_wdate }</li>
	                                </ul>
	                            </div>    
	                            <div class="project-share">
	                                <ul class="list-inline comment-list-v2 pull-left">
	                                    <li><i class="fa fa-eye"></i> <a href="#">${food_dto.food_hit }</a></li>
	                                    <li><i class="fa fa-comments"></i> <a href="#">${food_dto.food_comment_cnt }</a></li>
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
	                        </c:forEach>
	                	</div>
						<!--/end row-->
	                    <!--End Projects-->
	                    <hr>
	                 <!--Pegination Centered-->
	                    <div class="text-center">
	                        <ul class="pagination">
	                        	
	                        	<c:set var="previousUrl" value='list_view.food?cpage=${foodListVo.cpage-1}${foodLstVo.sUrl}'></c:set>
	                        	<c:set var="nextUrl" value='list_view.food?cpage=${foodListVo.cpage+1}${foodLstVo.sUrl}'></c:set>
	                           	
	                           	<li><a href='${(foodListVo.cpage == 1) ? "javascript:;" : previousUrl}'>&laquo;</a></li>
	                            <c:forEach begin="${foodListVo.startBlock}" end="${foodListVo.endBlock}" varStatus="status">
	                            	<c:if test="${status.count == foodListVo.cpage }">
			                            <li class="active"><a href="javascript:;">${foodListVo.cpage}</a></li>
	                            	</c:if>
	           						<c:if test="${status.count != foodListVo.cpage }">
			                            <li><a href="list_view.food?cpage=${status.count}${foodListVo.sUrl}">${status.count}</a></li>
	           						</c:if>
	                            </c:forEach>
	                            <li><a href='${(foodListVo.cpage == foodListVo.totalPage) ? "javascript:;" : nextUrl}'>&raquo;</a></li>
	                       
	                        </ul>                                                            
	                    </div>
	                <!--End Pegination Centered-->
	           		</div>
	            <!-- End Profile Content --> 
			</div>
		</div>
	<!-- End Conten -->
	</div>
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
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


<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        App.initScrollBar();
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
