<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>General Forms | Unify - Responsive Website Template</title>

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
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/brand-buttons/brand-buttons.css">   
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/brand-buttons/brand-buttons-inversed.css">   
    <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css"> -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
	<!-- <link rel="stylesheet" href="/trabab/resources/assets/css/jquery.rateyo.min.css"/> -->
    
 	<style type="text/css">
 	#pac-input {
		  background-color: #fff;
		  font-family: Roboto;
		  font-size: 15px;
		  font-weight: 300;
		  margin-left: 12px;
		  padding: 0 11px 0 13px;
		  text-overflow: ellipsis;
		  width: 50%;
		  margin-top: 10px;
		  border: 1px solid transparent;
		  border-radius: 2px 0 0 2px;
		  box-sizing: border-box;
		  -moz-box-sizing: border-box;
		  height: 32px;
		  outline: none;
		  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	}

	#pac-input:focus {
	 	border-color: #4d90fe;
	}
 	#uploadimg_box{
 		height:206px;
 	 	width:100%;
 	 	border: 1px solid gray;
 	 	overflow-x: auto;
 	 	overflow-y: hidden;
 	 	white-space:nowrap;
  	}
 	
 	#uploadimg_box_profile{
 		height:320px;
 	 	width:100%;
 	 	border: 1px solid gray;
 	 	overflow-x: auto;
 	 	overflow-y: hidden;
 	 	white-space:nowrap;
  	}
 	
 	 #uploadimg_container2 {
	     width: 200px;
	     height: 200px;
	     position: relative;
	     overflow: hidden;
	     display: inline-block;
    }
    
    #uploadimg_container_profile {
	     width: 424px;
	     height: 320px;
	     position: relative;
	     overflow: hidden;
	     display: inline-block;
    }

    #uploadimg_container img {
    	margin: 3px;
	    height: 200px;
	    position: relative;
    }
    #uploadimg_container button {
	    position: absolute;
	    top: 3px;
	    left: 80%;
    }
    
    #uploadimg_container_profile img {
    	margin: 3px;
	    height: 200px;
	    position: relative;
    }
    
	#uploadimg_container_profile button {
	    position: absolute;
	    top: 3px;
	    left: 80%;
    }
 	
 	.hidden_file{
 		display : none;
 	}
 	</style>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script> 	
    <script type="text/javascript">
    <%
	if(session.getAttribute("isLogin") == null) {
		out.println("alert('로그인 후 사용해 주세요.');");
		out.println("location.href ='login_view.member?redirect=myinfo_modify.member';");
	}
	%>
    </script>
</head>

<body>
<div class="wrapper">
	<jsp:include page="../template/header.jsp"></jsp:include>
	
    <!--=== Breadcrumbs ===-->
	
	<div class="breadcrumbs-v1"  style="background: url(/trabab/resources/assets/img/photogal_img/modify.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>MY PAGE</span>
            <h1>내 정보 수정</h1>
        </div>
    </div>

	<!-- Content -->
   <div class="bg-color-light">
      <!-- container가 묶고 있음 -->
        <div class="container content profile">
           <div class="row">
            <!-- Left Sidebar -->
            <jsp:include page="../template/left_sidebar.jsp"></jsp:include>
            
            <div class="col-md-5">
               <form action="#" class="sky-form">
                  <fieldset>
                     <div class='row'>
                        <div class='headline'><h3>프로필 사진 관리</h3></div>
                        <!-- <img class='img-responsive profile-img margin-bottom-20' src='assets/img/team/img1-md.jpg' alt='''> -->
                        <div id='uploadimg_box_profile'><div id='uploadimg_container_profile'><img src='/trabab/resources/uploadimg/profile/${memberVo.member_profile_image }' alt='' id='uploadimg' style= 'margin:0px; height:100%; width:100%'></div>
                           <!-- <img class='img-responsive profile-img margin-bottom-20' src='uploadimg/Koala.jpg' alt='''> -->
                        </div>
                        <div class='row brand-page margin-bottom-40' >
                           <div class='col-sm-6 col-md-3'>
                              <label for='file' class='input input-file' style='left:320%; margin-top:5px'>
                                 <div class='button'><input type='file' id='file' onchange='uploadImg1(this)' />변경</div>
                              </label>
                              <label class='input input-file' style='left:400%'>
                                 <div class='button' id='delete_img'>삭제</div>
                              </label>
                           </div>
<!--                            <div class='col-sm-6 col-md-3' style='left:50%'>
                              <label class='input input-file'>
                                 <div class='button' id='delete_img'>삭제</div>
                              </label>
                           </div> -->
                        </div>
                        <div class='headline'><h3>내 정보 수정</h3></div>         
                        <div>
                           <label class='input'>
                              <i class='icon-append fa fa-user'></i>
                              <input type='text' name='nickname' id='nickname' placeholder='닉네임' onblur='idchk()' value='${memberVo.member_nickname }'/>               
                           </label>
                           <div class='note' id='idchk'></div>       
                        </div>
                        <div>
                           <label class='input'>
                              <i class='icon-append fa fa-lock'></i>
                              <input type='password' name='password' placeholder='비밀번호' />
                           </label>          
                        </div>
                        <div>
                           <label class='input'>
                              <i class='icon-append fa fa-key'></i>
                              <input  type='password' name='passwordok' placeholder='비밀번호 확인' />
                           </label>
                           <div class='note' id='passchk'></div>          
                        </div>
                        <div>
                           <label class='input'>
                              <i class='icon-append fa fa-envelope'></i>
                              <input type='text' name='email' id='email' placeholder='이메일 주소' value='${memberVo.member_email }' readonly="readonly"  style="background-color:#E4F7BA;" />
                           </label>
                           <div class='note' id='emailchk'></div>
                        </div>
                        <div>
                        <label class='input'>
                           <i class='icon-append fa fa-calendar'></i>
                           <input type='text' name='birthday' placeholder='생년월일' value='${memberVo.member_birthday }' readonly="readonly" style="background-color:#E4F7BA;"/>
                        </label>
                        </div>
                        <div class="selectbox">
                           <label class='select'>
                              <select name='gender' id="gender" style="background-color:#E4F7BA;">
                                 <c:choose> 
                                 <c:when test="${memberVo.member_gender eq 'Female'}"> 
                                    <option value='Female'>여자</option>
                                 </c:when> 
                                 <c:otherwise> 
                                    <option value='Male'>남자</option>
                                 </c:otherwise> 
                                 </c:choose> 
                              </select>
                            </label>
                         </div>
                        <div class='row brand-page margin-bottom-40'>
                           <div class='col-sm-6 col-md-3' style='left:55%'>
                              <button name='Modifyinfo' id='Modifyinfo' class='btn btn-block btn-dribbble'>수정 </button>
                           </div>
                           <div class='col-sm-6 col-md-3' style='left:50%'>
                              <button class='btn btn-block btn-dribbble'>취소 </button>
                           </div>
                        </div>
                     </div>
                  </fieldset>
               </form>
            </div>
         </div>
      </div>
   </div>
   
	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
	
</div>
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

<!-- ë¬ë ¥ -->
<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>


<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        Datepicker.initDatepicker();
    }); 
    //End Template
	
//ImageUpload
	//var form = $('form')[0];
	var formdata = new FormData();
    formdata.append('member_profile_image', '${memberVo.member_profile_image}');
    
	function uploadImg1(input) {
		if (input.files && input.files[0]) {
			uploadImg2(input.files[0]);
			input.files.clear;
		}
	}
	
    function uploadImg2(file) {
    	var reader = new FileReader();
    	reader.onload = function (e) {
    		$('#uploadimg_box_profile').empty();
    		jQuery('#uploadimg_box_profile').append('<div id="uploadimg_container_profile"><img src="'+e.target.result +'" alt="" id="uploadimg2" style= "margin:0px; height:100%; width:100%"></div>');
     		
    		if(formdata.get('file') != null) {
    			formdata.delete('file');
    		}
    		
    		if(formdata.get('member_profile_image')!=null){
    			formdata.delete('member_profile_image');
    		}
    		
    		formdata.append('file', file);    		
    	}
    	
    	reader.readAsDataURL(file);
   	}
    
    $(document).on('click', '#delete_img', function() {
    	$('#uploadimg_box_profile').empty();
		jQuery('#uploadimg_box_profile').append("<div id='uploadimg_container_profile'><img src='/trabab/resources/uploadimg/profile/profile_default.png' alt='' id='uploadimg' style= 'margin:0px; height:100%; width:100%'></div>");
    	
		if(formdata.get('file') != null) {
			formdata.delete('file');	
    	}
		
		if(formdata.get('member_profile_image')!=null){
			formdata.delete('member_profile_image');
		}
		
		formdata.append('member_profile_image', 'profile_default.png'); 
    });
    
    $(document).on('click','#Modifyinfo', function(e) {
    	console.log(formdata.get('file'));
    	console.log("asdf");
	    if($('[name=password]').val() != $('[name=passwordok]').val()){
	    	alert("입력하실 비밀번호와 비밀번호확인이 일치하지 않습니다.");
	    }else{
	    
		    if($('[name=password]').val() == '' || $('[name=passwordok]').val()== ''){
		    
		    } else {
			   	formdata.append('member_password', $('[name=password]').val());
			   	
		    }
		    console.log(formdata.get('member_password'));
		   	formdata.append('member_nickname', $('[name=nickname]').val());
		   	formdata.append('member_no', <%=session.getAttribute("member_no") %>);
	   	
			$.ajax({
				url: './myinfo_modifyOk.member',
				type: 'post',
				data : formdata,
				dataType : 'json',
				processData : false, 
				contentType : false, 
				success : function(data) {
					alert('내 정보 수정을 성공하셨습니다.');
					location.reload();
					//location.href="myinfo_modify.member";
					
				},
				error : function() {
					alert('내 정보 수정에 실패하셨습니다.');
				}
			}) 
			e.preventDefault();
    	}
	});
 //End ImageUpload
</script>

<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>