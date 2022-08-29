<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>상품 후기 작성창</title>
	
	<script language="javascript">
  function showPopup() { window.open("08_2_popup.html", "후기 작성창", "width=1200, height=1000, left=200, top=200"); }
  </script>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/star.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/basic_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/product_style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
</head>
<body>
	<main>
		<div>
			<h4>상품 후기 작성</h4>
		    <p class="review-guide">작성하신 후기는 다른 회원이 상품 구매에 참고 할 수 있도록 상품 후기란에 공개 됩니다.</p>
			<hr>
		 	<form name="myform" id="myform" method="post">
				<fieldset>
					<input type="radio" name="star_point" value="5" id="rate1">
					<label for="rate1">★</label>
					<input type="radio" name="star_point" value="4" id="rate2">
					<label for="rate2">★</label>
					<input type="radio" name="star_point" value="3" id="rate3">
					<label for="rate3">★</label>
					<input type="radio" name="star_point" value="2" id="rate4">
					<label for="rate4">★</label>
					<input type="radio" name="star_point" value="1" id="rate5">
					<label for="rate5">★</label>
				</fieldset>
				<input type="file" id="review_photo" name="review_photo"> 
			    <p class="review-guide">상품에 대한 평가를 15자 이상, 50자 이내로 작성해 주세요.</p>
			    <div>
					<textarea rows="5" id="review_contents" name="review_contents"></textarea>
				</div>
				<div style="margin-bottom:0">
				    <button id="submit_btn" type="button">등록</button>
				</div>
			</form>
		</div>
	</main>
<script type="text/javascript">
$(document).ready(function() {
	$("#submit_btn").click(function() {
		let form = new FormData( document.getElementById( "myform" ) );
		var detail_no = ${detail_no};
		form.append("detail_no", detail_no);
		
		let keys = form.keys();
		for(key of keys) console.log(key);

		let values = form.values();
		for(value of values) console.log(value);
		
		$.ajax({
			type : "POST"
			, encType : "multipart/form-data"
			, url : "${pageContext.request.contextPath}/review/write"
			, data : form
			, processData : false
			, contentType : false
			, cache : false
			, success : function(result) {
				alert("리뷰가 등록 되었습니다.");
				location.href = "${pageContext.request.contextPath}/main";
			}//call back function
			, error : function(xhr) {
				alert("잠시 후 다시 시도해 주세요.");
			}//call back function//xhr : xml http request/response
	});//ajax	
	});
});
</script>
</body>
</html>