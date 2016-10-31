<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>TraBaB - 여행 일정 작성</title>

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

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/shortcode_timeline1.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
	<link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
</head>

<body>    

<div class="wrapper">
	
    <jsp:include page="../template/header.jsp"></jsp:include>
      <!--=== Content Part ===-->
    <div class="bg-color-light">
	    <div class="container content profile">
	           
	        <div class="row">
	             <jsp:include page="../template/left_sidebar.jsp"></jsp:include>
	        
	         
	            <!-- Begin Content -->
	            <div class="col-md-9">
		            <div class="sky-form">
			            <fieldset>
				            <div class="headline"><h3>전체 경로</h3></div>
			               	<div>
			            		<img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap${markers}${path}&size=400x200&scale=2&key=AIzaSyCRFCfTV41SXWUpY8PfqyOnxPQKLyncTGk" alt=""/>
			            	</div>
			            </fieldset>
		         		<fieldset>
			            	<div class="headline"><h3>세부 일정</h3></div>
			                <ul class="timeline-v1">
		                	<c:forEach items="${planBodyVoList }" var="dto" varStatus="status">
			                    <li class="${(status.count%2 == 0) ? 'timeline-inverted' : '' }">
			                        <div class="timeline-badge primary"><i class="glyphicon glyphicon-record"></i></div>
			                        <div class="timeline-panel">
			                            <div class="timeline-heading">
			                                <img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap&markers=color:blue%7Clabel:${status.count }%7C${dto.plan_latitude},${dto.plan_longitude}&zoom=14&size=400x200&scale=2&key=AIzaSyCRFCfTV41SXWUpY8PfqyOnxPQKLyncTGk"  alt=""/>
			                            </div>
			                            <div class="timeline-body text-justify">
			                                <h2>${status.count }. ${dto.plan_location_name }</h2>
			                                <p>${dto.plan_address }</p>
			                                <p>${dto.plan_price }</p> 
		                                    <p>${dto.plan_traffic }</p>
		                                    <p>${dto.plan_lodge_meal }</p>
		                                    <p>${dto.plan_memo }</p>
			                            </div>
			                            <div class="timeline-footer">
			                                <ul class="list-unstyled list-inline blog-info">
			                                    <li><i class="fa fa-clock-o"></i> ${dto.plan_schedule }</li>
			                                </ul>
			                            </div>
			                        </div>
			                    </li>
		                    </c:forEach>
		                    <li class="clearfix" style="float: none;"></li>
		             	    </ul>
		             	    <div id="print_div" align="center" class="hidden-print">
		             	    <button type="button" id="print_button" class="btn-u"> 여행일정 프린트 </button>
		             	    </div>
			            </fieldset>
			        </div>
	            </div>
	            <!-- End Content -->
	           <!--  <div class="col md-1"></div> -->
	        </div>          
	    </div><!--/container-->     
    </div>   
    
    <!--=== End Content Part ===-->
    <div class="hidden-print">
	<jsp:include page="../template/footer.jsp"></jsp:include>
     </div>
</div><!--/End Wrapepr-->

<!-- JS Global Compulsory -->           
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
    
    $('#print_button').on('click', function(){
    	window.print();
    });
</script>
<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 