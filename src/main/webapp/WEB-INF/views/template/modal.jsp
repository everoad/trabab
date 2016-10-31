<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

	.modal-dialog {
		margin-top: 12%;
	}
	
	.modal-content {
		height: 400px;
		width : 100%;
	}
	
	.service-block {
		display: flex;
		flex-flow: column nowrap;
	    justify-content: center;
	    align-items:center;
		height: 300px;
	}
	
	.mypage_modal {
		height: 200px;
	}

</style>

<div>
    <div class="modal fade" id="write_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel4">메뉴를 선택하세요</h4>
                </div>
                <div class="modal-body">
                   <div class="row">
			            <div class="col-md-4 col-sm-6">
			            	<a href="write_header_view.travel">
				                <div class="service-block service-block-sea service-or">
				                    <div class="service-bg"></div>                
					                <i class="icon-custom icon-color-light rounded-x icon-line icon-pointer"></i> 
					                <h2 class="heading-md">여행기 작성하기</h2>
				                </div>
			                </a>
			            </div>
			            <div class="col-md-4 col-sm-6">
			          		<a href="write_view.food">
				                <div class="service-block service-block-red service-or">
				                    <div class="service-bg"></div>                
				                    <i class="icon-custom icon-color-light rounded-x icon-line icon-cup"></i>
				                    <h2 class="heading-md">맛집 후기 작성하기</h2>
				                </div>
			                </a>
			            </div>
			            <div class="col-md-4 col-sm-12">
			            	<a href="write_view.plan">
				                <div class="service-block service-block-blue service-or">
				                    <div class="service-bg"></div>                
				                    <i class="icon-custom icon-color-light rounded-x icon-line icon-calendar"></i>
				                    <h2 class="heading-md">여행 일정 작성하기</h2>
				                </div>
			                </a>
			            </div>
			        </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>


<div>
     <div class="modal fade bs-example-modal-sm" id="mypage_modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-sm">
             <div class="modal-content mypage_modal">
                 <div class="modal-header">
                     <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                     <h4 id="myLargeModalLabel3" class="modal-title">본인 확인</h4>
                 </div>
                 <div class="modal-body sky-form">
                     <label class="input">
	                   	<input type="text" name="member_email" id="member_email" value="${member_email }" readonly/>
					 </label>
                     <label class="input">
	                   	<input type="password" name="member_password" id="member_password" placeholder="비밀번호"/>
					 </label>
	
					 <button id="mypage_btn" class="btn-u btn-u-sm col-md-12">확인</button>
                 </div>
             </div>
         </div>
     </div>
</div>
<script type="text/javascript">
	$('#mypage_btn').on('click', function(e) {
		
		$.ajax({
			url: 'mypage_confirm.member',
			type: 'post',
			data: {
				member_email : $('#member_email').val(),
				member_password : $('#member_password').val()
			},
			dataType: 'json',
			success: function(data) {
				console.log(data['flag']);
				if(data['flag'] == '1') {
					location.href= "myinfo_modify.member";
				} else {
					alert("비밀번호가 틀렸습니다.");
				}
				
			},
			error: function(data) {
				alert("실패");
			}
			
		})
		e.preventDefault();
	})

</script>


