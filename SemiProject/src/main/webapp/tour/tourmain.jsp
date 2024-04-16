<%@page import="javax.swing.ListCellRenderer"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.TourDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="food_menu_design_2/dist/style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.photo{
      width: 300px;
      height: 200px;
      border: 0px solid gray;
      margin-right: 10px;
   }
   
   .tour{
      padding: 10px;
      height: 150px;
   }
   
   a.goDetail{
      text-decoration: none;
      color: black;
   }

   a:hover {
      text-decoration: underline;
      color: gray;
   }
</style>
<script type="text/javascript">
  $(function(){
     $("a.goDetail").click(function(){
        var t_num=$(this).attr("t_num");
        var t_category=$(this).attr("t_category");
        //alert(t_num);
        //디테일 페이지로 이동
        location.href="index.jsp?main=tour/tourdetailview.jsp?t_num="+t_num+"&t_category="+t_category;
     })
  });
</script>

</head>
<%
  TourDao dao=new TourDao();
  List<TourDto> list=dao.getAllTour();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
%>

<body>
<div class="container mt-3">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-total" style="text-decoration: none; color:gray;">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-sawon" style="text-decoration: none; color:gray;">사원 및 신사</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-mus" style="text-decoration: none; color:gray;">박물관</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-event" style="text-decoration: none; color:gray;">축제</a>
    </li>
  </ul>

  <!-- tab panes -->
  <div class="tab-content">
    <div id="tabs-total" class="container tab-pane active"><br>
      <h3>전체</h3>
      <br>
      <table class="tour" style="width: 500px;">
        <% for (int i = 0; i < list.size(); i+=5) { %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
              TourDto dto = list.get(j);
              if (j == i) { %>
                 <!-- 한 행의 첫 번째 열 -->
                <td colspan="2" rowspan="2">
                  <!-- 이미지와 관광 정보 제목을 표시하며, 디테일 페이지로 이동할 수 있는 링크 -->
                  <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                    <img src="tour/image_tour/<%=dto.getT_image()%>" class="photo" style="width: 650px; height: 435px;">
                    <br><%=dto.getT_subject()%>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    <!-- 다음 행으로 이동하여 다시 첫 번째 열로 시작 -->
                    </tr>
                    <tr>
                        <td>
                          <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                            <img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                            <br><%=dto.getT_subject()%>
                          </a>
                        </td>
                    <%}else if(j%5==4){
                    %>
                       <td>
                             <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                               <br><%=dto.getT_subject()%>
                             </a>
                           </td>
                    <%}else{
                    %>
                       <td>
                             <a t_num="<%=dto.getT_num()%>" t_category="<%=dto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=dto.getT_image()%>" class="photo">
                               <br><%=dto.getT_subject()%>
                             </a>
                           </td>
                    <%}
                 }
            } %>
          </tr>
        <% } %>
   </table>
   </div>
   
    <div id="tabs-sawon" class="container tab-pane fade"><br>
      <h3>사원 및 신사</h3>
      <br>
      <table class="tour" style="width: 500px;">
         <% 
           List<TourDto> slist=dao.getAllCategory("sawon");
        for (int i = 0; i <slist.size(); i+=5) {
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
               TourDto sdto=slist.get(j);
              if (j == i) { %>
                <td colspan="2" rowspan="2">
                  <a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
  				  <div class="img-box-large">
                    <img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo" style="width: 650px; height: 435px;">
                    <div class="transparent-box">
				        <div class="caption">
				          <p>Library</p>
				          <p class="opacity-low">Architect Design</p>
				        </div>
				      </div> 
				    </div>
                    
                    <br><%=sdto.getT_subject()%>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    </tr>
                    <tr>
                        <td>
                          <a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                            <img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
                            <br><%=sdto.getT_subject()%>
                          </a>
                    </td>
                    <%}else if(j%5==4){
                    %>
                       <td>
                             <a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
                               <br><%=sdto.getT_subject()%>
                             </a>
                       </td>
                    <%}else{
                    %>
                       <td>
                             <a t_num="<%=sdto.getT_num()%>" t_category="<%=sdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=sdto.getT_image()%>" class="photo">
                               <br><%=sdto.getT_subject()%>
                             </a>
                       </td>
                    <%}
                 }
            }
            %>
          </tr>
        <% } %>
   </table>
   </div>
   
    <div id="tabs-mus" class="container tab-pane fade"><br>
      <h3>박물관</h3>
      <br>
      <table class="tour" style="width: 500px;">
         <% 
           List<TourDto> mlist=dao.getAllCategory("mus");
        for (int i = 0; i < mlist.size(); i+=5) {
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
               TourDto mdto=mlist.get(j);
              if (j == i) { %>
                <td colspan="2" rowspan="2">
                  <a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                    <img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo" style="width: 650px; height: 435px;">
                    <br><%=mdto.getT_subject()%>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    </tr>
                    <tr>
                        <td>
                          <a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                            <img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
                            <br><%=mdto.getT_subject()%>
                          </a>
                        </td>
                    <%}else if(j%5==4){
                    %>
                       <td>
                             <a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
                               <br><%=mdto.getT_subject()%>
                             </a>
                       </td>
                    <%}else{
                    %>
                       <td>
                             <a t_num="<%=mdto.getT_num()%>" t_category="<%=mdto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=mdto.getT_image()%>" class="photo">
                               <br><%=mdto.getT_subject()%>
                             </a>
                       </td>
                    <%}
                 }
            }
            %>
          </tr>
        <% } %>
   </table>
   </div>
    
    <div id="tabs-event" class="container tab-pane fade"><br>
      <h3>축제</h3>
      <br>
      <table class="tour" style="width: 500px;">
         <%
           List<TourDto> elist=dao.getAllCategory("event");
        for (int i = 0; i < elist.size(); i+=5) { 
        %>
          <tr>
            <% for (int j = i; j < i + 5 && j < list.size(); j++) {
               TourDto edto=elist.get(j);
              if (j == i) { %>
                <td colspan="2" rowspan="2">
                  <a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                    <img src="tour/image_tour/<%=edto.getT_image()%>" class="photo" style="width: 650px; height: 435px;">
                    <br><%=edto.getT_subject()%>
                  </a>
                </td>
              <% } else {
                    if(j%5==3){
                    %>
                    </tr>
                    <tr>
                        <td>
                          <a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                            <img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
                            <br><%=edto.getT_subject()%>
                          </a>
                    </td>
                    <%}else if(j%5==4){
                    %>
                       <td>
                             <a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
                               <br><%=edto.getT_subject()%>
                             </a>
                       </td>
                    <%}else{
                    %>
                       <td>
                             <a t_num="<%=edto.getT_num()%>" t_category="<%=edto.getT_category()%>" style="cursor: pointer;" class="goDetail">
                               <img src="tour/image_tour/<%=edto.getT_image()%>" class="photo">
                               <br><%=edto.getT_subject()%>
                             </a>
                       </td>
                    <%}
                 }
            }
            %>
          </tr>
        <% } %>
   </table>
   </div>
</div>
</div>
</body>
</html>