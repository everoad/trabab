<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--=== Header ===-->    
    <div class="header">
        <div class="container">
            <!-- Logo -->
            <a class="logo" href="index.main">
                <img src="/trabab/resources/assets/img/trabab_logo.png" alt="Logo">
            </a>
            <!-- End Logo -->
            
            <!-- Topbar -->
            <div class="topbar hidden-print">
              <ul class="loginbar pull-right">
                    <%if(session.getAttribute("member_email") == null){ %>
						<li><a href="login_view.member?redirect=index.main">Login</a></li>
						<li class="topbar-devider"></li>  
						<li><a href="join_view.member?redirect=index.main">Join</a></li>
					<%} else { %>
						<li>${member_nickname}님</li>  
						<li class="topbar-devider"></li>  
						<li><a href="logoutOk.member">Logout</a></li>  
					<%} %>
                 </ul>
            </div>
            <!-- End Topbar -->

            <!-- Toggle get grouped for better mobile display -->
            <button type="button" class="navbar-toggle hidden-print" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
            <!-- End Toggle -->
        </div><!--/end container-->

        <!-- Collect the nav links, forms, and other content for toggling -->
         <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <!-- Home -->
                    <li>
                        <a href="#"  data-toggle="modal" data-target="#write_modal">WRITE STORY</a>
                    </li>
                	    <!-- Pages -->                        
                    <li>
                        <a href="list_view.travel">
                            TRAVEL Story
                        </a>
                    </li>
                    <!-- Blog -->
                    <li>
                        <a href="list_view.food">
                            Tasty Story
                        </a>
                    </li>
                    <!-- End Blog -->

                    <!-- Portfolio -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                            TRAVEL TIP
                        </a>
                        <ul class="dropdown-menu">
                   	        <li><a href="list_view.traveltip">여행 팁 게시판</a></li>                        
                            <li><a href="together_view.together">여행 친구 찾기</a></li>                        
                            <li><a href="convenient_view.traveltip">편의시설 찾기</a></li>
                        </ul>
                    </li>
                    <!-- End Portfolio -->

                    <!-- Features -->
              		<li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                            MY PAGE
                        </a> 
                        <ul class="dropdown-menu">
                            <li><a href="mypage_view.member" class="mypage_modal1">내 정보 보기</a></li>                        
                            <li><a href="javascipt:;"  data-toggle="modal" data-target="#mypage_modal" class="mypage_modal1">내 정보 수정</a></li>                   
                           	<c:if test="${member_power eq 'power' }">
	                            <li><a href="admin_view.member" >관리자 페이지</a></li>                        
                           	</c:if>
                        </ul>
                    </li>                    
                    
                    <!-- End Search Block -->
                </ul>
            </div><!--/end container-->
        </div><!--/navbar-collapse-->
    </div>
    <!--=== End Header ===-->
      
   <!-- modal -->
	<jsp:include page="./modal.jsp"></jsp:include>
	<script>
	$('.mypage_modal1').on('click', function(e) {
	  <%
		if(session.getAttribute("isLogin") == null) {
			out.println("e.preventDefault();");
			out.println("alert('로그인 후 사용해 주세요.');");
			out.println("location.href ='login_view.member?redirect=mypage_view.member';");
		}
		%>
	})
	</script>
	