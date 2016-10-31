var like = function(travel_no, isLogin) {
	$('#like_btn').on('click', function() {
		
		if(isLogin == null) {
			alert('로그인 후 사용해 주세요.');
			location.href = 'login_view.member?redirect=content_view.food?food_no=' + travel_no;
			return;
		}

		var target = $(this);
		//좋아요 안누른 상태
		if($(this).attr('data-check') == 'false'){
			increaseLikeCount(target);
		
		//좋아요 누른 상태
		} else {
			console.log("아놔");
			decreaseLikeCount(target);
		}
	});
	
	//페이지 열리면서 좋아요 상태 확인
	function checkLike() {
		$.ajax({
			url: 'travel_like_check.travel',
			type: 'post',
			data: {
				travel_no : travel_no
			},
			dataType: 'json',
			success: function(data) {
				if(data['flag'] == "0") {
					checkIcon($('#like_btn'), false);
				} else {
					checkIcon($('#like_btn'), true);
				}
			},
			error: function() {
			
				alert("실패~");
			
			}
		})
	}
	
	function increaseLikeCount(target) {
		$.ajax({
			url: 'travel_like_increase.travel',
			type: 'post',
			data: {
				travel_no : travel_no
			},
			dataType: 'json',
			success: function(data) {
				$('#like_count1').html(data['travel_like_cnt']);
				$('#like_count2').html(data['travel_like_cnt']);
				checkIcon(target, true);
			}
		});
	}
	
	function decreaseLikeCount(target) {
		$.ajax({
			url: 'travel_like_decrease.travel',
			type: 'post',
			data: {
				travel_no : travel_no
			},
			dataType: 'json',
			success: function(data) {
				$('#like_count1').html(data['travel_like_cnt']);
				$('#like_count2').html(data['travel_like_cnt']);
				checkIcon(target, false);
			}
		});
	}
	
	function checkIcon(target, boolean) {
		if(boolean == true) {
			target.removeClass("icon-bg-grey");
			target.addClass(" icon-bg-u");
			target.attr('data-check', "true");
		} else {
			target.removeClass("icon-bg-u");
			target.addClass("icon-bg-grey");
			target.attr('data-check', "false");
		}
	}
}