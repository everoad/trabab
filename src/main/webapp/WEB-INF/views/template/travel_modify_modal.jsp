<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style>
#select{
	margin-bottom: 10px;
}
.modal-content{
	height: 170px;
}

</style>

}
<!-- modal -->
<div>
     <div class="modal fade bs-example-modal-sm" id="modify_modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-sm">
             <div class="modal-content">
                 <div class="modal-header">
                     <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                     <h4 id="myLargeModalLabel3" class="modal-title">여행기 수정</h4>
                 </div>
                 <div class="modal-body sky-form">
                     <label class="select">
	                     <select name="" id="select">
	                     	<option value="" selected disabled>선택하세요.</option>
	                     	<option value="headerfooter">제목, 후기, #TAG</option>
							<c:forEach items="${travelTotalVo.travel_body_list}" var="dto" varStatus="status">
	                     		<option value="${status.count}">${status.count} ${dto.travel_location_name}</option>                     
	                     	</c:forEach>
	                     	<option value="newPoint">새  지점 추가</option>
	                     </select>
					 </label>
					 <button id="modify" class="btn-u btn-u-sm col-md-6">수정하러 가기</button>
					 <button id="modify_complete" class="btn-u btn-u-default btn-u-sm col-md-6">끝내기</button>
                 </div>
             </div>
         </div>
     </div>
</div>
	
<script type="text/javascript">
	var modify = document.getElementById("modify");
	var select = document.getElementById("select");
	var travel_no = <%=request.getParameter("travel_no")%>;
	var travel_step = '${fn:length(travelTotalVo.travel_body_list) + 1}';
	modify.onclick = function() {
		if(	select.value == 'headerfooter' ) {
			location.href='modify_header_footer_view.travel?travel_no=' + travel_no;
		} else if(select.value == 'newPoint') {
			location.href='write_body_view.travel?travel_no=' + travel_no + '&travel_step=' + travel_step + '&mode=modify';	
		} else {
			location.href='modify_body_view.travel?travel_no='+travel_no+'&travel_step=' + select.value;
		}
	}	
	
	modify_complete.onclick = function() {
		location.href='content_view.travel?travel_no=' + travel_no;
	}
</script>