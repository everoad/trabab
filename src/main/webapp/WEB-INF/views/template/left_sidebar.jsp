<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Left Sidebar-->

<style>

/* 일정 사이즈 이하에서 사라짐. */
@media all {
	#leftbar {
		display: none;
	}
}
@media all and (min-width: 992px) {
	#leftbar {
		display: block;
		background: white;
	}
	#leftbar-list{
	}
	.notice {
		border: 1px solid #e5e5e5;
	}
}

</style>

<div class="col-md-2 md-margin-bottom-40" id="leftbar">
    <img class="img-responsive profile-img margin-bottom-20" src="/trabab/resources/uploadimg/profile/${member_profile_image == null ? 'profile_default.png' : member_profile_image }" alt="">

    <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
        <li class="list-group-item">
            <a href="page_profile.html"><i class="fa fa-user"></i> MyPage</a>
        </li>
        <li class="list-group-item">
            <a href="page_profile_me.html"><i class="fa fa-thumbs-o-up"></i> 관심글</a>
        </li>
        <li class="list-group-item">
            <a href="page_profile_users.html"><i class="fa fa-group"></i> 내가 쓴 글</a>
        </li>                                        
        <li class="list-group-item">
            <a href="page_profile_projects.html"><i class="fa fa-cubes"></i> 일 정</a>
        </li>
    </ul>   
  
    <hr>

    <!--Notification-->
    <div class="panel-heading-v2 overflow-h notice">
        <h2 class="heading-xs pull-left">&nbsp;&nbsp;<i class="fa fa-bell-o"></i> 알  림</h2>
    </div>
    <ul id="leftbar-list" class="list-unstyled margin-bottom-20" data-mcs-theme="minimal-dark">
        
    </ul>    
    <!--End Notification-->

    <div class="margin-bottom-50"></div>
</div>
<!--End Left Sidebar-->

<script>
	if('${isLogin}' != '') {
		$.ajax({
			url: './follow_newcontent.member',
			dataType: 'json',
			success: function(data) {
				var str = '';
				for(var index in data) {

					str += '<li class="notification">';
					str += '<img class="rounded-x" src="/trabab/resources/uploadimg/profile/'+data[index]['member_profile_image']+'" alt="">';
					str += '<div class="overflow-h">';

					if(data[index]['board_theme'] == 'travel') {
						str += '<span><strong><a href="content_view.travel?travel_no='+data[index]['board_no']+'">' + data[index]['member_nickname'] + '</strong>님이 여행기를 작성하셨습니다.</a></span>';
					} else if(data[index]['board_theme'] == 'food') {
						str += '<span><strong><a href="content_view.food?food_no='+data[index]['board_no']+'">' + data[index]['member_nickname'] + '</strong>님이 맛집 후기를 작성하셨습니다.</a></span>';
					} else if(data[index]['board_theme'] == 'traveltip') {
						str += '<span><strong><a href="content_view.traveltip?traveltip_no='+data[index]['board_no']+'">' + data[index]['member_nickname'] + '</strong>님이 여행팁을 작성하셨습니다.</a></span>';
					} else {
						str += '<span><strong>' + data[index]['member_nickname'] + '</strong>님이 팔로우하셨습니다.</span>';
					}
		
					if(data[index]['day'] != '0') {
						str += '<small>' + data[index]['day'] + '일 전 </small>';
					} else {
						str += '<small>' + data[index]['hour'] + '시간 전 </small>';
					}
					str += '</div><br /></li>';
				}
				$('#leftbar-list').html(str);
			},
			error: function() {
				console.log("fail");
			}
		})
	}
</script>
