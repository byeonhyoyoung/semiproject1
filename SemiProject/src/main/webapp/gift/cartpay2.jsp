<%@page import="data.dao.GiftDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>장바구니와 결제</title>
<style type="text/css">
   img.photo{
      width: 60px;
      height: 80px;
      border: 2px solid gray;
   }

   div.sangpum{cursor: pointer;}
</style>

</head>

<%
  String id=(String)session.getAttribute("myid");
  GiftDao dao=new GiftDao();
  List<HashMap<String,String>> list=dao.getCartList(id);
  NumberFormat nf=NumberFormat.getInstance();
  int totalmoney=0;
%>

<body>

<div class="container mt-3" align="center">
 
<form action="" method="post" onclick="return check(this)">

<h4 class="alert alert-info" style="width: 1000px;"><%=id %>님의 장바구니</h4>

<table class="table table-striped" style="width: 1000px;">
   <tr>
      <th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
      <th style="width: 200px;">상품정보</th>
      <th style="width: 200px;">상품금액</th>   
      
   </tr>
   
   <% for(int i=0; i<list.size(); i++) {
       HashMap<String,String> map=list.get(i);
       String g_image_1=map.get("g_image_1");
       int g_price=Integer.parseInt(map.get("g_price"));
       int cnt=Integer.parseInt(map.get("cnt"));
       g_price *= cnt;
       totalmoney += g_price;
   %>
   <tr>
     <td>
       <input type="checkbox" name="idx" idx="<%=map.get("idx")%>" class="idx">
     </td>
     <td>
       <div class="sangpum" g_num="<%=map.get("g_num")%>">
         <img alt="" src="gift/image_gift/<%=g_image_1%>" class="photo" align="left" hspace="20">
         <b>상품명: <%=map.get("g_name") %></b><br>
         <b>갯수: <%=map.get("cnt") %>개</b><br>
         <b>가격: <%=map.get("g_price") %>원</b><br>
         <b>날짜: <%=map.get("cartday") %></b><br>
       </div>
     </td>
     <td style="vertical-align: middle;">
       <h6><%=nf.format(g_price) %>원
          <i class="bi bi-trash del" idx="<%=map.get("idx")%>" style="color: red; margin-left: 20px;"></i>
       </h6>
     </td>
   </tr>
   <% } %>
   
   <tr>
      <td colspan="3">
        <button type="button" class="btn btn-danger btn-lg" style="margin-left: 100px;" id="btncartdel">선택상품삭제</button>
        <button type="button" class="btn btn-danger btn-lg" style="margin-left: 100px;" id="btnpayment">결제하기</button>
        <span style="font-size: 1.5em; float: right;">총주문금액  <b style="color: green;"> <%=nf.format(totalmoney) %>  원</b></span>
      </td>
   </tr>
</table>

</form>
</div>

<script
  type="text/javascript"
  src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
></script>
<script
  type="text/javascript"
  src="https://unpkg.com/axios/dist/axios.min.js"
></script>

<script type="text/javascript">
  $(function(){
    // 전체 선택/해제 기능
    $("#allcheck").click(function(){
      var chk = $(this).is(":checked");
      $(".idx").prop("checked", chk);
    });

    // 상품 클릭 시 디테일 페이지로 이동
    $("div.sangpum").click(function(){
      var g_num = $(this).attr("g_num");
      location.href = "index.jsp?main=gift/giftdetailview.jsp?g_num=" + g_num;
    });

    // 선택한 상품 삭제 버튼
    $("#btncartdel").click(function(){
      var cnt = $(".idx:checked").length;

      if(cnt == 0){
        alert("먼저 삭제할 상품을 1개 이상 선택해 주세요");
        return;
      }

      $(".idx:checked").each(function(i, elt){
        var idx = $(this).attr("idx");
        // 선택한 장바구니 상품 모두 삭제하기
        del(idx);
      });

      // 현재 페이지 새로고침
      location.reload();
    });

    // i 태그 한 개 삭제 이벤트
    $("i.del").click(function(){
      var idx = $(this).attr("idx");
      var a = confirm("삭제하려면 [확인]을 눌러주세요");
      if(a){
        del(idx);
        location.reload();
      }
    });

    // 상품 삭제 함수
    function del(idx) {
      $.ajax({
        type: "get",
        url: "gift/cartdelete.jsp",
        dataType: "html",
        data: {"idx": idx},
        success: function(){
          // 삭제 성공시 동작
        }
      });
    }

    // 결제하기 버튼 클릭 시
    $("#btnpayment").click(function(){
      var totalmoney = <%= totalmoney %>;

      mypayment(totalmoney, function(success) {
        if(success) {
          window.location.href = "index.jsp?main=gift/paysuccess.jsp";
        } else {
          // 실패 처리
          alert("결제에 실패했습니다. 다시 시도해주세요.");
        }
      });
    });

    // 결제 함수
    function mypayment(totalmoney, callback) {
      const IMP = window.IMP;
      IMP.init("imp48834665"); // 이니시스페이먼츠 가맹점 식별코드
      IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        name: "KyotoInside",
        amount: totalmoney,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181",
        m_redirect_url: "",
      }, async (rsp) => {
        if (rsp.success) {
          await axios.post(
            "http://localhost:3000/graphql",
            {
              query: `
                mutation {
                  buyTicket(impUid: "${rsp.imp_uid}", amount: ${rsp.paid_amount},pay_method:"${rsp.pay_method}") {
                    id
                    count
                    money
                    method
                  }
                }
              `,
            },
            {
              headers: {
                authorization: "Bearer 액세스토큰",
              },
            }
          );
          callback(true); // 결제 성공시 true를 콜백으로 전달
        } else {
          // 결제 실패시
          callback(false); // 결제 실패시 false를 콜백으로 전달
        }
      });
    }
  });
</script>

</body>
</html>

