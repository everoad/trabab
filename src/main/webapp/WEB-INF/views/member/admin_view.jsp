<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
   
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB  - 관리자 페이지</title>

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
    <link rel="stylesheet" href="/trabab/resources/assets/css/graphic.css">

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
   <link rel="stylesheet" href="/trabab/resources/assets/plugins/brand-buttons/brand-buttons.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/brand-buttons/brand-buttons-inversed.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    
   <script type="text/javascript">
    <%
   if(session.getAttribute("isLogin") == null) {
      out.println("alert('로그인 후 사용해 주세요.');");
      out.println("location.href ='login_view.member?redirect=mypage.main';");
   }
   %>
   </script>
   <script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
   <script src='http://cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js'></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
   
   window.onload = function() {
      
   /*///////////////////////////////////////    Barchart   ////////////////////////////////////////// */   
      google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawVisualization);
       google.charts.setOnLoadCallback(drawVisualization2);
   
       function drawVisualization() {
           var titleArr = [''];
           var dataArr = [''];
           <c:forEach items="${boardHitSum}" var="board">
              titleArr.push('${board.board_theme}');
              dataArr.push(${board.board_hit});
           </c:forEach>
         
          var wrapper = new google.visualization.ChartWrapper({
            chartType: 'ColumnChart',
            dataTable: [
                       titleArr,
                       dataArr
            ],
            options: {'title': '게시판 별 조회수'},
            containerId: 'vis_div'
          });
          wrapper.draw();
        }
        function drawVisualization2() {
           var titleArr = [''];
           var dataArr = [''];
           <c:forEach items="${boardCount}" var="board">
              titleArr.push('${board.board_theme}');
              dataArr.push(${board.board_count});
            </c:forEach>
          var wrapper = new google.visualization.ChartWrapper({
            chartType: 'ColumnChart',
            dataTable: [
                        titleArr,
                        dataArr
            ],
            options: {'title': '게시판 별 게시글 수'},
   
            containerId: 'vis_div2'
          });
          wrapper.draw();
        }
    /*///////////////////////////////////////    Barchart   ////////////////////////////////////////// */
    /*///////////////////////////////////////    piechart   ////////////////////////////////////////// */    
         google.charts.setOnLoadCallback(drawChart);
          google.charts.setOnLoadCallback(drawChart2);      
          function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'age');
            data.addColumn('number', 'count');
            <c:forEach items="${ageCount}" var="age">
               data.addRow(['${age.age + 1} ~ ${age.age + 10}', ${age.age_count}]);
            </c:forEach>
            var options = {
              title: '연령 분포도'
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
          }
   
          function drawChart2() {
   
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'gender');
            data.addColumn('number', 'count');
            <c:forEach items="${genderCount}" var="gender">
               data.addRow(['${gender.member_gender}', ${gender.member_gender_cnt}]);
           </c:forEach>
            var options = {
              title: '남녀 비율'
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
            chart.draw(data, options);
          }
   }
   
   $(document).on('click', '#member_out', function() {
      var val1 = $(this).parent().parent().attr('id');
      location.href= "./outOk.member?member_no="+val1;
   });
   
   $(document).on('click', '#power_down', function() {
      var val2 = $(this).parent().parent().attr('id');
      location.href= "./power_down.member?member_no="+val2;
   });
   
   $(document).on('click', '#power_up', function() {
      var val3 = $(this).parent().parent().attr('id');
      location.href= "./power_up.member?member_no="+val3;
   });
      
   </script>
</head>

<!-- <body style="font-family: Arial;border: 0 none;">
    <div id="vis_div" style="width: 600px; height: 400px;"></div>
</body> -->
<body class="graphic_body">
<div class="wrapper">
   <jsp:include page="../template/header.jsp"></jsp:include>
   <div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/ad.jpg) no-repeat;  background-size:cover; background-position: center center;">>
        <div class="container">
            <span>MY PAGE</span>
            <h1>관리자 페이지</h1>
        </div>
    </div>

   <div class="tab-v1">
      <ul class="nav nav-tabs">
         <li class="active"><a href="#admin1" data-toggle="tab" style="font-size: 16px;">통계</a></li>
         <li><a href="#admin2" data-toggle="tab" style="font-size: 16px;">멤버 관리</a></li>
      </ul>
      <div class="tab-content" style="padding:0px;">
      <div class="tab-pane fade in active" id="admin1">
            <div class="row">
         <div class="bg-color-light">
               
            <div class="row">+
            <div class="container" style="padding-bottom:30px; padding-top:30px;">
                <!--=== Parallax Counter ===-->
                <div class="parallax-counter-v2 parallaxBg1">
                    <div class="container">
                        <ul class="row list-row">
                            <li class="col-md-3 col-sm-6 col-xs-12 md-margin-bottom-30">
                                <div class="counters rounded">
                                    <span class="counter">${genderCount[0].member_gender_cnt + genderCount[1].member_gender_cnt }</span>   
                                    <h4>가입자 수</h4>
                                </div>    
                            </li>
                            <li class="col-md-3 col-sm-6 col-xs-12 md-margin-bottom-30">
                                <div class="counters rounded">
                                    <span class="counter">${boardCount[0].board_count + boardCount[1].board_count + boardCount[2].board_count + boardCount[3].board_count }</span> 
                                    <h4>전체 게시글 수</h4>
                                </div>    
                            </li>
                            <li class="col-md-3 col-sm-6 col-xs-12 sm-margin-bottom-30">
                                <div class="counters rounded">
                                    <span class="counter">${boardHitSum[0].board_hit + boardHitSum[1].board_hit + boardHitSum[2].board_hit}</span>
                                    <h4>전체 조회 수</h4>
                                </div>    
                            </li>
                            <li class="col-md-3 col-sm-6 col-xs-12">
                                <div class="counters rounded">
                                    <span class="counter">${powerCount }</span>
                                    <h4>운영자 수</h4>
                                </div>    
                            </li>
                        </ul>            
                    </div>
                </div>    
                <!--=== End Parallax Counter ===-->
            </div>
            </div>
            
            
            <div class="row">
            <div class="container" style="padding-bottom:30px; padding-top:30px;">
            <div class="headline"><h2 class="heading-sm">막대 그래프</h2></div>
            <div class="col" style="float: left; width:50%;">
               <div id="vis_div" style="width: 500px; height: 300px;"></div>
               <h3 align="center"style="margin-right: 60px;">게시판 별 누적 조회 수</h3>
            </div>
            <div class="col" style="float: left; width:50%;">
               <div id="vis_div2" style="width: 500px; height: 300px;"></div>
               <h3 align="center"style="margin-right: 60px;">게시판 별 누적 게시글 수</h3>
            </div>
            </div>
            </div>
   
         <div class="row">
         <div class="container" style="padding-bottom:30px; padding-top:30px;">
            <div class="headline"><h3 class="heading-sm">파이 차트</h3></div>
            <div class="col" style="float: left; width:50%;">
               <div id="piechart" style="width: 500px; height: 300px;"></div>
               <h3 align="center"style="margin-right: 60px;">연령 분포도</h3>
            </div>
            <div class="col" style="float: left; width:50%;">
               <div id="piechart2" style="width: 500px; height: 300px;"></div>
               <h3 align="center"style="margin-right: 60px;">남녀 비율</h3>
            </div>
         </div>
         </div>
      </div>
   </div>
   </div>
         <div class="tab-pane fade in" id="admin2">
            <div class="row">
            <div class="container" style="padding-bottom:30px; padding-top:30px;">
               <div class="headline"><h2 class="heading-sm">멤버 리스트</h2></div>
               <table style=" border-collapse: collapse; width:100%">
               <tr style="padding: 8px;text-align: left; border-bottom: 1px solid #ddd;">
                  <th style="text-align: center;">번호</th>
                  <th style="text-align: center;">닉네임</th>
                  <th style="text-align: center;">이메일</th>
                  <th style="text-align: center;">생년월일</th>
                  <th style="text-align: center;">성별</th>
                  <th style="text-align: center;">가입날짜</th>
                  <th style="text-align: center;">팔로워 수</th>
                  <th style="text-align: center;">팔로잉 수</th>
                  <th style="text-align: center;">회원 상태</th>
                  <th style="text-align: center;">운영자 권한</th>
               </tr>
               <c:forEach items="${normalMemberList}" var="memberVo">
               <tr id="${memberVo.member_no }" style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_no}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_nickname}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_email}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_birthday}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_gender }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_jdate }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_follower_cnt }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_following_cnt }</td>
                  <c:if test="${memberVo.member_out == 'out'}">
                     <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>탈퇴</td>
                  </c:if>
                  <c:if test="${memberVo.member_out == 'normal'}">
                     <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'><button id='member_out' class="btn-u">강제 탈퇴</button></td>
                  </c:if>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'><button id='power_up' class="btn-u">권한 부여</button></td>
               </tr>
               </c:forEach>
               </table>
               
               
               <div class="headline"><h2 class="heading-sm">운영자 리스트</h2></div>
               <table id="power_table" style=" border-collapse: collapse; width:100%">
               <tr style="padding: 8px;text-align: center; border-bottom: 1px solid #ddd;">
                  <th style="text-align: center;">번호</th>
                  <th style="text-align: center;">닉네임</th>
                  <th style="text-align: center;">이메일</th>
                  <th style="text-align: center;">생년월일</th>
                  <th style="text-align: center;">성별</th>
                  <th style="text-align: center;">가입날짜</th>
                  <th style="text-align: center;">팔로워 수</th>
                  <th style="text-align: center;">팔로잉 수</th>
                  <th style="text-align: center;">권한 해제</th>
               </tr>
               <c:forEach items="${powerMemberList}" var="memberVo">
               <tr id="${memberVo.member_no }" style='padding: 8px;text-align: left; border-bottom: 1px solid #ddd;'>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_no}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_nickname}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_email}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_birthday}</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_gender }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_jdate }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_follower_cnt }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'>${memberVo.member_following_cnt }</td>
                  <td style='padding: 8px;text-align: center; border-bottom: 1px solid #ddd;'><button id='power_down' class="btn-u">권한 해제</button></td>
               </tr>
               </c:forEach>
                  
               </table>
               
            </div>
            </div>
         </div>
   </div>
   </div>
</div>
   <!-- Content -->
   <!-- footer start -->
   <jsp:include page="../template/footer.jsp"></jsp:include>
   <!-- footer end  -->
<!-- General Unify Forms -->

<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>


<!-- JS Customization -->
<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>

<!-- 달력 -->
<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>
</body>
</html>