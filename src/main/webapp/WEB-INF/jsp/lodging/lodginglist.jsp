<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 숙소화면</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div id = "wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			
			<div class="lodging-list">
				<h1 class="text-center">
					ChoongMo Tour Lodging List Page
				</h1>
				
				<div class="d-flex justify-content-between">
					<i id="filterIcon"class="filter-icon bi bi-filter-left">필터</i>
					
					<i id="sortIcon" class="sort-icon bi bi-arrow-down-up">정렬</i>
				</div>
				
				<!-- 숙소 리스트 카드 리스트 -->
				
				
				
				
				
				
				<div class="lodging-card-list">
				
					<c:forEach var="lodging" items = "${lodgingList }">
					<div class="lodging-card">
						
						<div class="lodging-profile">
							
							<!-- 하트아이콘 -->
							<c:choose>
								<c:when test="">
								
									<i class="undib-icon bi bi-heart-fill text-danger  d-flex justify-content-end" data-lodging-id = "${lodging.id }"></i>
								</c:when>
								
								<c:otherwise>	<!-- 검정하트 빈하트 -->
									<i class="dib-icon bi bi-heart  d-flex justify-content-end" data-lodging-id = "${lodging.id }"></i>
								
								</c:otherwise>
							</c:choose>
							
							<img class="profile" width =""src="${lodging.imagePath }">
						</div>
						<div class="lodging-card-body">									<!-- 400에러 뜨는중 여기를 room name이라 잡으면 안됨 이름만 뜨게 하고 파라미터는 lodgingId-->
							<div class=""><a href="/lodging/room/view?id=${lodging.id }">${lodging.roomName }</a></div>
							<div class="">${lodging.level }</div>
						</div>
					</div>
					</c:forEach>
					
				</div>
				
					
			</div>
			<!-- 숙소 리스트 카드 리스트 -->
			
			
			
			
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
	</div>
	<script>
	$(document).ready(function(){
		
		//필터모달
		
		//정렬모달
		
		
		//찜 해제 
		$(".undib-icon").on("click", function(){
			
			let lodgingId = $(this).data("lodging-id");
			
			
			$.ajax({
				
				type: ""
				, url :"/lodging/undib"
				, data:{"lodgingId":lodgingId}
				, success:function(data){
					
					
				}
				, error:function(){
					
					
				}
				
			});
			
		});
		//찜
		$(".dib-icon").on("click", function(){
			
			let lodgingId = $(this).data("lodging-id");
			
			$.ajax({
				
				type:""
				, url:"/lodgin/dib"
				, data:{"lodgingId":lodgingId}
				,success:function(data){
					
				}
				,error:function(){
					
					
				}
				
			});
			
			
			
		});
		
		
		
	});
	
	
	</script>
	

</body>
</html>