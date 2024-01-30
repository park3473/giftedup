<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="right">

	<script>
	$(document).on("click","#cust_btn",function(){
  $("#myModal").modal("toggle"); 
})
</script>


	<!-- 전체메뉴 -->
	<div class="modal_menu">
		<div class="all_btn" data-toggle="modal" data-target="#myModal">
			<i class="las la-bars"></i>
		</div>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<table class="table table-bordered font_noto">
						<tbody>
							<tr>
								<td colspan="2" class="tit_bg"><span class="float_l txt_20">전체메뉴</span>
								<div type="button" class="close" data-dismiss="modal">
										<i class="las la-times"></i>
									</div></td>
							</tr>
							<tr>
								<td>영재키움프로젝트</td>
								<td>
									<span><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">프로젝트 기본방향</a></span> 
									<span><a href="${pageContext.request.contextPath}/user/subpage/project/program/index.do">주요프로그램</a></span>
									<span><a href="${pageContext.request.contextPath}/user/subpage/project/project/index.do">사업추진체계</a></span>
									<span><a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길</a></span>
								</td>
							</tr>
							<tr>
								<td>학생프로그램</td>
								<td>
									<span><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개</a></span>
									<span><a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학프로젝트</a></span>
									<span><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링</a></span>
									<span><a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가멘토링</a></span>
								</td>
							</tr>
							<tr>
								<td>교사프로그램</td>
								<td>
									<span><a href="${pageContext.request.contextPath}/user/program/201/list.do">교사연수</a></span>
									<span><a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅</a></span>
									<span><a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회</a></span>
									<span><a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식</a></span>
								</td>
							</tr>
							<tr>
								<td>커뮤니티</td>
								<td>
									<span><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항</a></span>
									<span><a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료</a></span>
									<span><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실</a></span>
									<span><a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ</a></span>
									<span><a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당</a></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 전체메뉴끝 -->

	<div class="font_noto main_tit_22">바로가기메뉴</div>
	<div class="kaist font_noto f_wet_03">
		<div class="flexbox align_c gray_10">
			<div class="item_02 box_02 pointer" onclick="location.href='${pageContext.request.contextPath}/user/program/101/list.do'">
				융합과학<br>프로젝트
			</div>
			<div class="item_02 box_02 pointer" onclick="location.href='${pageContext.request.contextPath}/user/communicator/list.do'">
				커뮤니<br>케이터
			</div>
			<div class="item_02 box_02 pointer" onclick="location.href='${pageContext.request.contextPath}/user/member_re/intro.do'">
				신입생<br>모집
			</div>
			<div class="item_02 box_03 pointer" onclick="javascript:alert('2022 신규 참가자 모집은 종료되었습니다.')">
				지원서<br>조회
			</div>
		</div>
	</div>
	
	<div class="main_gab_30"></div>
	
	<div class="font_noto main_tit_22 b_pad_15">홍보자료</div>
	<div id="slide_01" class="owl-carousel owl-theme slide_01">
	</div>

	<div class="main_gab_30"></div>
	<div class="pos_r movie">
		<div class="you_btn pos_a">
			<img
				src='${pageContext.request.contextPath}/resources/img/2022/youtube_btn.png'>
		</div>
		<div class="pic">
			<img
				src='${pageContext.request.contextPath}/resources/img/2022/movie_img_01.png'>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			
			$.ajax({
				url : '${pageContext.request.contextPath}/user/header/pr.do',
				type : 'POST',
				success : function(data , xhr , status){
					//console.log(data);
					for(i=0; i < data.length; i++){
						$('#slide_01').append('<div class="item"><img src="/resources/upload/notices_data/'+data[i].IMAGE+'" alt="'+data[i].IMAGE+'" ><div class="cont"><div class="tit" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;" >'+data[i].TITLE+'</div></div></div> ')
					}
					
					$('#slide_01').owlCarousel({
						loop: true,
						margin: 15,
						nav: true,
						responsiveClass:true,
						autoplay:true,
						autoplayTimeout:10000,
						autoplayHoverPause:true,
						navText: ["<img src='${pageContext.request.contextPath}/resources/img/2022/b_left_btn.png'>","<img src='${pageContext.request.contextPath}/resources/img/2022/b_right_btn.png'>"],
						responsive: {
							0: {
							items: 1,
							nav: false
							},
							1024: {
							items: 2,
							nav: false
							},
							1200: {
							items: 1,
							nav:false,
							dots:true,
							margin: 20
							}
						}
						})
					
				},
				error : function(xhr , status){
					console.log('false');
				}
				
			})
			
		})
</script>

</div>