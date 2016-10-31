<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <!-- jstl 라이브러리 사용할 것임. -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta charset="UTF-8">
<title>Welcome to TraBaB!</title>

 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

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
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">    
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <!-- <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css"> -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/page_search.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    
    <style type="text/css">
    	.img-responsive-custom {
			display: block;
			width: 100%;
			position:absolute;
		}
	
		.sky-form {
			box-shadow: none;
		}

		
    </style>
    <script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
</head>
<body>

<div class="wrapper">

	<!-- Header -->
    <jsp:include page="./template/header.jsp"></jsp:include>
	
     <!--=== Search Block ===-->
    <div class="search-block parallaxBg" style="background-position: 50% 0 !important;">
        <div class="container">
            <div class="col-md-6 col-md-offset-3">
                <h1><b>Search Your <span class="color-green">Destination</span></b></h1>
            <br /><br /><br />
                <form action="search.main" method="get" class="sky-form page-search-form">
                   <div class="input-group">
                       <input type="text" class="form-control" name="skey" placeholder="검색어를 입력해주세요." autofocus>
                       <span class="input-group-btn">
                           <button class="btn-u btn-u-lg" type="submit"><i class="fa fa-search"></i></button>
                       </span>
                   </div>
                    <div class="inline-group" id="checkbox" style="padding-left: 100px;">                    
                        <label class="checkbox"><input type="radio" name="stype"  value="normal" checked><i></i><b>스토리 검색</b></label>
                        <label class="checkbox"><input type="radio" name="stype" value="hashtag"><i></i><b>해쉬태그 검색</b></label>
                    </div>
                </form>    
            </div>
        </div>    
    </div><!--/container-->     
    <!--=== End Search Block ===-->

     <!--=== Service Block ===-->
    <div class="container content-sm" style="padding-top:20px">
    	 <div class="headline-center-v2 headline-center-v2-dark margin-bottom-10">
            <h2>TraBAB guide</h2>
             <span class="bordered-icon"><i class="fa fa-th-large"></i></span>
<!--            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et qua s molestias excepturi vehicula sem ut volutpat. Ut non libero magna fusce co.</p> -->
        </div><!--/Headline Center V2-->
        <div class="row">
            <div class="col-md-3 content-boxes-v6 md-margin-bottom-50">
                <i class="rounded-x icon-magnifier"></i>
                <h1 class="title-v3-md text-uppercase margin-bottom-10">검색</h1>
                <p>Trabab의 간편한 검색기능을 이용하세요. <br />혼자 가기 좋은 여행지와 맛집, <br />주변 편의시설 등을 찾을 수 있습니다.</p>
            </div>
            <div class="col-md-3 content-boxes-v6 md-margin-bottom-50">
                <i class="rounded-x  icon-note"></i>
                <h2 class="title-v3-md text-uppercase margin-bottom-10">여행, 맛집 스토리 작성</h2>
                <p>여행 중 겪은 스토리를 남기세요. <br />나에게는 추억이 되고, <br />타인에게는 정보가 됩니다.</p>
            </div>
            <div class="col-md-3 content-boxes-v6">
                <i class="rounded-x icon-notebook"></i>
                <h2 class="title-v3-md text-uppercase margin-bottom-10">여행일정 작성</h2>
                <p>형식에 따라 입력만 하면 되는 <br />여행일정을 작성하세요. <br />여행을 더욱 쉽게 즐길 수 있습니다.</p>
            </div>
            <div class="col-md-3 content-boxes-v6">
                <i class="rounded-x icon-bubbles"></i>
                <h2 class="title-v3-md text-uppercase margin-bottom-10">커뮤니티</h2>
                <p>나의 여행계획과 여행정보를 공유해보세요. <br />여행 꿀팁도 알 수 있고 <br />여행 친구도 만들 수 있습니다.</p>
            </div>
        </div><!--/row-->
    </div><!--/container-->
    <!--=== End Service Block ===-->


	<!--=== Parallax Backgound ===-->
    <div class="bg-image-v2 bg-image-v2-dark parallaxBg1">
        <div class="container">
            <div class="headline-center-v2 margin-bottom-10" style="height:200px">
				<h2></h2>
                <!-- <span class="bordered-icon"><i class="fa fa-th-large"></i></span> -->
            </div><!--/Headline Center V2-->   
        </div><!--/container-->
    </div>
    <!--=== End Parallax Backgound ===-->


    <!--=== Parallax Counter ===-->
    <div class="parallax-counter-v2 parallaxBg1" style="padding-top:70px">
        <div class="container">
            <ul class="row list-row">
            	<c:forEach items="${boardCount }" var="board">
	                <li class="col-md-3 col-sm-6 col-xs-12 md-margin-bottom-30">
	                    <div class="counters rounded">
	                        <span class="counter">${board.board_count }</span>   
	                        <h4>${board.board_theme }</h4>
	                    </div>    
	                </li>
            	</c:forEach>
              
            </ul>            
        </div>
    </div>    
    <!--=== End Parallax Counter ===-->
  
    <div class="container content-md">
        <ul class="row block-grid-v2">
        	<h1><b> Best <span class="color-red">Travel Story</span></b></h1>
        
        	<c:forEach items="${travelListVo.travelTotalVoList }" var="dto">        
            <li class="col-md-3 col-sm-6 md-margin-bottom-30">
                <div class="easy-block-v1"  style="overflow:hidden; width:100%;height:0px; padding-bottom:70%;">
                    <a href="content_view.travel?travel_no=${dto.travel_no }"><img class="img-responsive-custom" src="/trabab/resources/uploadimg/${dto.travel_image }"  alt=""></a>
                    <div class="easy-block-v1-badge rgba-purple">TraBaB BEST</div>
                </div>
                <div class="block-grid-v2-info rounded-bottom">
                    <h3><a href="content_view.travel?travel_no=${dto.travel_no }">${dto.travel_subject }</a></h3>
                    <p><a href="#">by ${dto.member_nickname }</a></p>
                </div>
            </li>
            </c:forEach>
        </ul>
		<br />
		<br />
        <ul class="row block-grid-v2">
        	<h1><b> Best <span class="color-red">Tasty Story</span></b></h1>
        
        	<c:forEach items="${foodListVo.foodVoList }" var="dto">        
            <li class="col-md-3 col-sm-6 md-margin-bottom-30">
                <div class="easy-block-v1" style="overflow:hidden; width:100%;height:0px; padding-bottom:70%;">
                    <a href="content_view.food?food_no=${dto.food_no }"><img class="img-responsive-custom" src="/trabab/resources/uploadimg/${dto.food_image }" alt=""></a>
                    <div class="easy-block-v1-badge rgba-purple">TraBaB BEST</div>
                </div>
                <div class="block-grid-v2-info rounded-bottom">
                    <div style="width:430;text-overflow:ellipsis;overflow:hidden;"><h3><a href="content_view.food?food_no=${dto.food_no }">${dto.food_subject }</a></h3></div>
                    <p><a href="#">by ${dto.member_nickname}</a></p>
                    <ul class="list-inline star-vote">
	                    <li><i class='color-green fa fa-star${dto.food_lv_average == 0 ? "-o" : "" }'></i></li>
	                    <li><i class='color-green fa fa-star${dto.food_lv_average <= 1 ? "-o" : "" }'></i></li>
	                    <li><i class='color-green fa fa-star${dto.food_lv_average <= 2 ? "-o" : "" }'></i></li>
	                    <li><i class='color-green fa fa-star${dto.food_lv_average <= 3 ? "-o" : "" }'></i></li>
	                    <li><i class='color-green fa fa-star${dto.food_lv_average <= 4 ? "-o" : "" }'></i></li>
                    </ul>
                </div>
            </li>
            </c:forEach>
         </ul>
    </div>
	<!-- footer -->
   <jsp:include page="./template/footer.jsp"></jsp:include>
   
 
	
</div><!--/End Wrapepr-->

<!-- JS Global Compulsory -->           
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
<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>    
<![endif]-->

</body>

</html>
