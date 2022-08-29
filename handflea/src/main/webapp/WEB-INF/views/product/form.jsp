<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 상품 등록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/product_style.css">
		<style type="text/css">
		.write_label {
			font-size : 0.9em;
			color : red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
		<h2> 판매 상품 등록 </h2>
		<form id="write_form">
			<div id="prdt-input">
				<table>
					<tr>
						<td class="input-label">상품명 (*)</td>
						<td colspan="3" class="input-cnts">
							<input type="text" id="prdt_name" name="prdt_name" maxlength="40" placeholder="한글 최대 20자, 영문, 숫자 최대 60자">
							<label for="prdt_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<td class="input-label">판매자</td>
						<td colspan="3" class="input-cnts">${login_info.mem_email}</td>
					</tr>
					<tr>
						<td class="input-label">카테고리 (*)</td>
						<td colspan="3" class="input-cnts">
							<select id="bigcate_no" name="bigcate_no">
								<option value="0" selected="selected">대분류 선택</option>
							</select>
							>
							<select id="smallcate_no" name="smallcate_no">
								<option value="0" selected="selected">소분류 선택</option>
							</select>
							<label for="smallcate_no" id="smallcate_no_label" class="write_label"></label>
						</td>
						</td>
					</tr>
					<tr>
						<td class="input-label">판매 가격 (*)</td>
						<td class="input-cnts">
							<input type="text" id="price" name="price"> 원
							<label for="price" id="price_label" class="write_label"></label>
						</td>
						<td class="input-label"> 배송비 (*)  </td>
						<td class="input-cnts">
							<input type="text" id="delivery_price" name="delivery_price"> 원
							<label for="delivery_price" id="delivery_price_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<td class="input-label"> 주문 옵션  </td>
						<td class="input-cnts" colspan="3">
							<button type="button" id="add_option_btn" class="mb-1"> 옵션 입력 추가 </button>
							<label for="option_yes" id="option_yes_label" class="write_label"></label>
							<div id="option_name_div">
							</div>
						</td>
					</tr>
					<tr>
						<td class="input-label">상품 준비 기간 (*)</td>
						<td class="input-cnts" colspan="3">
							<input type="text" id="prdt_rdy" name="prdt_rdy"> 일
							<label for="prdt_rdy" id="prdt_rdy_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<td class="input-label"> 썸네일 이미지 (*) </td>
						<td class="input-cnts">
							<input type="file" id="thumbnail" name="thumbnail">
							<label for="thumbnail" id="thumbnail_label" class="write_label"></label>
						</td>
						<td class="input-label"> 상품 설명 이미지 </td>
						<td class="input-cnts">
							<input type="file" id="desc_img" name="desc_img">
							<label for="desc_img" id="desc_img_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<td class="input-label"> 상품 상세 설명   </td>
						<td class="input-cnts" colspan="3">
							<textarea class="form-contol" id="desc_txt" name="desc_txt"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("desc_txt");
							</script>
						</td>
					</tr>
				</table>
			</div>
		</form>		
		<div id="prdt-button">
			<a href="${pageContext.request.contextPath}/product/sellerlist">
				<button> 상품 등록 취소 </button>
			</a>
			<button id="write_btn"> 상품 등록 </button>
		</div>
		</main>
		<%@ include file="/WEB-INF/views/footer.jsp" %>

		<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;

	$(document).ready(function() {
		$("#write_btn").click(function() {
			let tmpArr2 = $("input[id^='option_no']");
			let arr_option2 = new Array();
			for( let i=0; i < tmpArr2.length; i++ ){
				arr_option2.push( tmpArr2[i].value );
			}

			if( $.trim( $("#prdt_name").val() ) == "" ){
				$("#prdt_name_label").text("상품명을 입력 하세요.");
				return;
			} else { $("#prdt_name_label").text(""); }

			if( $("#smallcate_no").val() == "0" ){
				$("#smallcate_no_label").text("카테고리를 선택하세요");
				return;
			} else { $("#smallcate_no_label").text(""); }
			
			if( $("#price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#price_label").text(""); }
		
			if( $("#delivery_price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#delivery_price_label").text("배송비를 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_price_label").text(""); }
			
			if( $("#prdt_rdy").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#prdt_rdy_label").text("상품 준비 기간을 입력하세요, 숫자만 허용 됩니다.");
				return;
			} else { $("#product_prepare_label").text("해당 기간 내에 출고가 되지 않을 경우, 구매자가 환불을 요청할 수 있습니다."); }
			
			let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
			let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
								|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
			if( $.trim( $("#thumbnail").val() ) == "" || tmp1_boolean == false ){
				$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#thumbnail_label").text(""); }

			let tmp3 = $("#desc_img").val().substring($("#desc_img").val().length-3);
			let tmp3_boolean = (tmp3 == "jpg" || tmp3 == "jpeg" || tmp3 == "gif" || tmp3 == "png"
				|| tmp3 == "JPG" || tmp3 == "JPEG" || tmp3 == "GIF" || tmp3 == "PNG");
			if( $.trim( $("#desc_img").val() ) != "" && tmp3_boolean == false ){
				$("#desc_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#desc_img_label").text(""); }

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );
			form.append( "arr_option", arr_option2 );
			
			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);

			$.ajax({
				type : "POST"
				, encType : "multipart/form-data"
				, url : "${pageContext.request.contextPath}/product/insert"
				, data : form
				, processData : false
				, contentType : false
				, cache : false
				, success : function(result) {
					alert("상품이 등록 되었습니다.");
					location.href = "${pageContext.request.contextPath}/main";
				}//call back function
				, error : function(xhr) {
					alert("잠시 후 다시 시도해 주세요.");
				}//call back function//xhr : xml http request/response
		});//ajax	
		});//click
	});//ready
	</script>

		<script type="text/javascript">
		let optionNo = 0;
		$(document).ready(function() {
			$("#add_option_btn").click(function() {
				$("#option_name_div").append(
					'<div id="div_option_no'+optionNo+'" class="div_option">'
					+'<input type="text" id="option_no'+optionNo+'" class="option_no" placeholder="옵션을 입력하세요.">'
					+'<button type="button" id="option_remove_btn'+optionNo+'" class="option_remove_btn"> X </button>'
					+ '</div>'
				);//append
				$("#option_remove_btn"+optionNo).on("click", function(){
					//alert( $(this).attr("id") );
					//alert( $(this).parent().attr("id") );
					$(this).parent().remove();
				});//on
				optionNo++;
			});//click
		});//ready
		</script>

		<script type="text/javascript">
		
		$(document).ready(function() {
			$("#bigcate_no").change(function() {
				$.get(
						"${pageContext.request.contextPath}/product/smallcate"
						, { bigcate_no : $("#bigcate_no").val() }
						, function(data, status) { 
							$("#smallcate_no").empty();
							$("#smallcate_no").append("<option value='0'>선택하세요</option>");
							$.each(JSON.parse(data), function(idx, dto) {
								$("#smallcate_no").append("<option value='" + dto.smallcate_no + "'>" + dto.smallcate_name + "</option>");
							});//each
						}//call back function
				);//get
			});//change
		});//ready
		
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/product/bigcate"
					, function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) { 
							$("#bigcate_no").append("<option value='" + dto.bigcate_no + "'>" + dto.bigcate_name + "</option>");
						});//each
					}//call back function
			);//get
		});//ready
		</script>	
		
		
		
	</body>
</html>