<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>         
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 포맷라이브러리 추가 -->     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choongmotour - 예약 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	
</head>
<body>
	<div id = "wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="reserve-page">
				<h1 class="text-center">
					ChoongMo Tour Reserve Page
				</h1>
			
			
				<div class="reservepagecontents ">
					
					<div class=""><h2>${lodging.roomName }</h2></div><br>
					<div class=""><h3>${room.size }</h3></div>
					
					<div class="d-flex mt-3 mx-3 justify-content-center ">
						<label class="mt-3">체크인 </label>
		        		<input type="text" id="startDate" value="" autocomplete="off"><!--각각 객체를 만들어야 하므로 id값 부여.-->
		        		<label class="mt-3">체크아웃 </label>
		        		<input type="text" id="endDate" value= " " autocomplete="off"><br><!-- input type을 텍스트로 해서 저장이안됐나?? -->
				
					
					</div>
					
					<div class = "mx-3">
						<label class="mt-4">예약자 이름</label><input type="text" id="nameInput" value = "${userName }" class="form-control ">
					
					
						<label class=" mt-4">전화번호</label><input type="text" id="phoneNumberInput" value = "${user.phoneNumber}" class="form-control ">
					</div>
					<hr>
					
					
					<label class="col-4 mt-4">총 결제 금액 </label> <strong><fmt:formatNumber value= "${room.price }" type="currency" currencySymbol =""/>원</strong><!-- 이것도 fmt활용해보기 -->
					
					
					<hr>
					<div class="payselect mt-4 mx-3">
						<div class=""> 결제수단을 선택하세요. </div>
						<select class="form-control col-5 mt-3" id="paySelector">
							
                            <option value="">결제수단</option>
                            <option value="카카오페이">카카오페이</option>
                            <option value="네이버페이">네이버페이</option>
                            <option value="삼성페이">삼성페이</option>
                            <option value="카드">카드</option>
                       
                 		</select>
					
					</div>
					
					
					
					<div class="check-box mt-4 mx-3">
						<label>전체 선택<input type="checkbox" id="allCheck"></label> <br>
				        <label>개인정보 활용 동의<input type="checkbox" name="check" value="check1"></label><br>
				        <label>서비스 이용 동의<input type="checkbox" name="check" value="check2"></label><br>
				        <label>마케팅 활용 동의<input type="checkbox" name="check" value="check3"></label>
					
					</div>
					
					
					<div class="text-center mb-3">
					
						<button id = "payBtn" type="button"  class="btn btn-danger col-8 mb-3">결제하기</button>
					</div>
				</div>
			
			</div>
		
		
		
		
		</section>
	
	
	
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	</div>
	<script>
	$(document).ready(function(){
		
		document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
		document.getElementById('endDate').value = new Date().toISOString().substring(0, 10);
		 
		
		$("#payBtn").on("click", function(){
			
			
			
			let id = $(this).data("room-id");
			
			let phoneNumber = $("#phoneNumberInput").val();
			
			let name = $("#nameInput").val();
			
			let payment = $("#paySelector").val();
			
	
			
			if(phoneNumber == ""){
				alert("전화번호를 입력하세요.");
				return ;
			}
			
			if(name == ""){
				alert("이름을 입력하세요.");
				return ;
			}
			
			if(payment == ""){
				alert("지불수단을 선택하세요.");
				return ;
			}
			
	
			
			//유효성검사 이름, 전화번호, 결제수단, 전체 동의 
		
			alert(name);
			alert(phoneNumber);
			alert(payment);
			alert(check);
			
			
			$.ajax({//우선여기부터 하자.
				type:"post"
				, url:"/lodging/reserve" //userId는 세션값이라서 빼도되는건가? 다오에서도 뻈다.
				, data:{"roomId":id,"payment":payment, "startDate" : startDate, "endDate" : endDate}
				, success:function(data){
					if(data.result == "success"){
						location.href="/lodging/reservelist/view";
						alert("예약 성공");
					} else {
						alert("예약 실패");
						
					}
				}
					, error:function(){
						alert("예약 에러");
					}
				
			});
			
		
		});
		
		 $("#startDate").datepicker({//datepicker 요일 한글로 검색
             dateFormat:"yy년mm월dd일",
            
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , 
             todayHighlight :true,// 오늘을 표시해줄지. default 가 false
             showButtonPanel:true,
             closeText: 'done',
             minDate: 0,//오늘날짜 부터
             onSelect:function(selectedDate) {
                 
                 $("#endDate").datepicker("option", "minDate", selectedDate);

                 }

         });
		// todayHighlight :true,
       

         $("#endDate").datepicker({//종료일
             dateFormat:"yy년mm월dd일",
           
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
             showButtonPanel:true,//버튼보이기
             closeText: 'done',
             minDate:'+1D',//오늘날짜 다음 부터
             //beforeShow: customRange
              onSelect:function(selectedDate) {
                 
                 $("#startDate").datepicker("option", "maxDate", selectedDate );
                 
             
              }
            

         });
		
		
		 $("#allCheck").on("change", function() {
             // 내 자신이 체크 되었는지 안되었는지
             if($(this).is(":checked")) {
                 $("input[name='check']").prop("checked", true);
             } else {
                 $("input[name='check']").prop("checked", false);
             }
             

             
         });
		
		
	});
	
	
	</script>


</body>
</html>