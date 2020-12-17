<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일명 : 07GoodsSelect1.jsp --%>
<%
request.setCharacterEncoding("UTF-8");
String gName = request.getParameter("goodsOptionName");
if(gName.equals("op01")){
%>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css">
<script src="../common/jquery/jquery-3.5.1.js"></script >
<script type="text/javascript">
$(function() {
	$("#remove").click(function(){
		$.ajax({
			url : "./JQ07ShoppingCart.jsp",
			type : "get",
			dataType : "html", //콜백데이터의 타입
			contentType : "text/html;charset:utf-8",
			success : function (d) {
				console.log(d);
				$('#goodsList').empty();
			},
			error : function(e) {
				alert("실패" + e.status);
			}
		});
	});
});
</script>
<table class="table table-bordered">
  <tr>
    <th>옵션명 :</th>
    <th>옵션선택1(AAA추가)</th>
  </tr>
  <tr>
    <td class="table-danger">추가비용 : + 5,000원</td>
    <td><button id="">삭제하기</button></td>
  </tr>
</table>
<% } else if(gName.equals("op02")) {%>
<table class="table table-bordered">
  <tr>
    <th>옵션명 :</th>
    <th>옵션선택2(BBB추가)</th>
  </tr>
  <tr>
    <td colspan="2" class="table-danger">추가비용 : + 7,000원</td>
  </tr>
</table>
<% } else if(gName.equals("op03")) {%>
<table class="table table-bordered">
  <tr>
    <th>옵션명 :</th>
    <th>옵션선택3(CCC추가)</th>
  </tr>
  <tr>
    <td colspan="2" class="table-danger">추가비용 : + 10,000원</td>
  </tr>
</table>
<% } %>
