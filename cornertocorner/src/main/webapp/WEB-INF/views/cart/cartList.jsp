<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
   // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
    }

}
function calcGoodsPrice(bookPrice,delivery,obj){
	var totalPrice,final_total_price,totalNum,total_delivery_price,total_sales_price;
	var checked_goods=document.querySelectorAll('input[name="checked_goods"]:checked');
	var goods_qty = checked_goods.length;
	//alert("총 상품금액"+goods_qty.value);
	var p_totalNum=document.getElementById("p_totalGoodsNum");
	var p_totalPrice=document.getElementById("p_totalGoodsPrice");
	var p_totalDelivery=document.getElementById("p_totalDeliveryPrice");
	var p_final_totalPrice=document.getElementById("p_final_totalPrice");
	var p_totalSalesPrice = document.getElementById("p_totalSalesPrice");
	var h_totalNum=document.getElementById("h_totalGoodsNum");
	var h_totalPrice=document.getElementById("h_totalGoodsPrice");
	var h_totalDelivery=document.getElementById("h_totalDeliveryPrice");
	var h_final_total_price=document.getElementById("h_final_totalPrice");
	var h_totalSalesPrice = document.getElementById("h_totalSalesPrice");
	if(obj.checked==true){
	//	alert("체크 했음")
		
		totalNum = goods_qty;
		total_delivery_price = Number(h_totalDelivery.value) + delivery;
		total_sales_price = Number(h_totalSalesPrice.value);
		
		//alert("totalNum:"+totalNum);
		totalPrice=Number(h_totalGoodsPrice.value) + bookPrice;
		//alert("totalPrice:"+totalPrice);
		final_total_price=totalPrice + total_delivery_price - Number(h_totalSalesPrice.value);
		//alert("final_total_price:"+final_total_price);

	}else{
	//	alert("h_totalNum.value:"+h_totalNum.value);
		totalNum= goods_qty;
	//	alert("totalNum:"+ totalNum);
		total_delivery_price = Number(h_totalDelivery.value) - delivery;
		
		total_sales_price = Number(h_totalSalesPrice.value) - (bookPrice*0.1);
		
		totalPrice= Number(h_totalGoodsPrice.value) - bookPrice;
	//	alert("totalPrice="+totalPrice);
		final_total_price=totalPrice + total_delivery_price - total_sales_price;
	//	alert("final_total_price:"+final_total_price);
	}
	
	h_totalNum.value=totalNum;
	
	h_totalPrice.value=totalPrice;
	h_final_total_price.value=final_total_price;
	h_totalDelivery.value=total_delivery_price;
	h_totalSalesPrice = total_sales_price;
	
	total_delivery_price = total_delivery_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	total_sales_price = total_sales_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	final_total_price = final_total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	
	p_totalSalesPrice.innerHTML = total_sales_price + "원"; 
	p_totalDelivery.innerHTML=total_delivery_price + "원";
	p_totalNum.innerHTML=totalNum + "개";
	p_totalPrice.innerHTML=totalPrice + "원";
	p_final_totalPrice.innerHTML=final_total_price + "원";
}

function modify_cart_qty(goods_id,bookPrice,index){
	//alert(index);
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
	if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;		
	}else{
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
	}
		
	var cart_goods_qty=Number(_cart_goods_qty);
	//alert("cart_goods_qty:"+cart_goods_qty);
	//console.log(cart_goods_qty);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			goods_id:goods_id,
			cart_goods_qty:cart_goods_qty
		},
		
		success : function(data, textStatus) {
			//alert(data);
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");	
				location.reload();
			}else{
				alert("다시 시도해 주세요!!");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}


function fn_order_each_goods(goods_code,goods_name,goods_saleprice,goods_category,cart_headcount){
	var total_price,final_total_price,_goods_qty;
	var cart_goods_qty=document.getElementById("cart_headcount"+goods_code);
	
	/* _order_goods_qty=cart_goods_qty.value; */ //장바구니에 담긴 개수 만큼 주문한다.
	var formObj=document.createElement("form");
	var i_goods_code = document.createElement("input"); 
    var i_goods_name = document.createElement("input");
    var i_goods_saleprice=document.createElement("input");
    var i_goods_category=document.createElement("input");
    /* var i_fileName=document.createElement("input"); */
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_code.name="goods_code";
    i_goods_name.name="goods_name";
    i_goods_saleprice.name="goods_saleprice";
    i_goods_category.name="goods_category";
    /* i_fileName.name="goods_fileName"; */
    i_order_goods_qty.name="reser_headcount";
    
    i_goods_code.value=goods_code;
    i_goods_category.value=goods_category;
    i_order_goods_qty.value=cart_headcount; 
    i_goods_name.value=goods_name;
    i_goods_saleprice.value=goods_saleprice;
    /* i_fileName.value=fileName; */
    
    formObj.appendChild(i_goods_code);
    formObj.appendChild(i_goods_name);
    formObj.appendChild(i_goods_saleprice);
    formObj.appendChild(i_goods_category);
    /* formObj.appendChild(i_fileName); */
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
}

function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var length=checked_goods.length;
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
				//alert(select_goods_qty[i].value);
				console.log(cart_goods_qty[i].value);
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=cart_goods_qty.value;
		cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}



</script>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>장바구니</title>
   <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<style>
		.btn .btn-sm {
			background-color : #00aff0;
		}
		.btn .btn-md {
			background-color : #00aff0;
		}
	</style>
</head>
<body>


	<div class="container">
		<div class="row justify-content-center">
			<span class = "d-flex mt-2 fs-3 fw-bold">장바구니</span>
			<div class = "container d-flex col-md-12 justify-content-end">
				<!-- 구현 불가능<a href="#" class = "btn btn-outline-dark btn-sm my-2 mx-1">선택삭제</a> -->
			</div>
			<hr class = "event_hr col-md-12">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
						<th scope="col"><!-- 구현불가능 <input type = "checkbox"> --></th>
						<th scope="col">구분</th>
						<th scope="col">상품정보</th>
						<th scope="col">금액</th>
						<th scope="col">예약</th>
						<th scope="col">삭제</th>
						</tr>
					</thead>
					
					<c:choose>
					 <c:when test="${ empty myCartList }">
				    <tr>
				       <td colspan=8 class="fixed">
				         <strong>장바구니에 상품이 없습니다.</strong>
				       </td>
				     </tr>
				    </c:when>
					<c:otherwise>
					<c:forEach var="item" items="${myGoodsList}" varStatus="status">
					<c:set var="cart_headcount" value="${myCartList[status.count-1].cart_headcount}"/>
					<tbody>
						<tr>
							<th scope="row"></th>
							<td class = "col-md-3">
								<img src="${contextPath}/resources/image/package/pckItem01.jpg" width="60%">
								<span class="badge badge-light" style = "font-size : 15px; color : black; border : 1px solid grey;" >${item.goods_category}</span>
							</td>
							<td class = "col-md-5">
								<p class = "fs-5 fw-bolder">${item.goods_name}</p>
								<br>
								<small class="smallCaption text-secondary"><br>출발기간 :<fmt:formatDate value="${item.goods_departure_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${item.goods_arrival_date}" pattern="yyyy-MM-dd"/></small>
								<small class="smallCaption text-secondary"><br>예약인원 : ${cart_headcount}명</small>
							</td>
							<td class = "col-md-2"><p class = "fs-5">${cart_headcount != 0 ? item.goods_saleprice * cart_headcount : item.goods_saleprice}<small class="smallCaption text-secondary"> 원</small></p></td>
							<td class = "col">
								<a href="javascript:fn_order_each_goods('${item.goods_code }','${item.goods_name }','${item.goods_saleprice}','${item.goods_category}','${cart_headcount}');">
					     		  	<button class = "btn btn-sm" style = "background-color : #00aff0;">즉시예약</button>
								</a><br>
							</td>
							<td class = "col"><a href="${contextPath}/cart/removeCartGoods.do?goods_code=${item.goods_code}&member_id=${myCartList[status.index].member_id}"><img src = "${contextPath}/resources/image/x.png"></a></td>
						</tr>
					</tbody>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</table>
				<div class = "container d-flex col-md-12 justify-content-end">
					<button class = "btn btn-md" onclick="location.href='${contextPath}/order/order.do'" style = "background-color : #00aff0;">예약하기</button>
				</div>
			</div>
		</div>
	</div>
			
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>