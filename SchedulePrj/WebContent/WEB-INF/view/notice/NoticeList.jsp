<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>    
<%
session.setAttribute("SESSION_USER_ID", "USER01"); //세션 강제 적용, 로그인된 상태로 보여주기 위함

List<NoticeDTO> rList =   (List<NoticeDTO>)request.getAttribute("rList");

//게시판 조회 결과 보여주기
if (rList==null){
   rList = new ArrayList<NoticeDTO>();
   
}

%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지 리스트</title>
<script type="text/javascript">

//상세보기 이동
function doDetail(seq){
   location.href="/notice/NoticeInfo.do?nSeq="+ seq;
}

</script>

</head>
<body>
<h2>공지사항</h2>
<hr/>
<br/>

<table border="1" width="1000px" style="border-collapse:collapse; border-bottom:1px;">
<tr style="background-color:#5CD1E5">
   <th width="100" align="center">순번</th>
   <th width="250" align="center">제목</th>
   <th width="100" align="center">조회수</th>
   <th width="100" align="center">등록자</th>
   <th width="100" align="center">등록일</th>
</tr>
<%
for (int i=0;i<rList.size();i++){
   NoticeDTO rDTO = rList.get(i);

   if (rDTO==null){
      rDTO = new NoticeDTO();
   }
   
%>
<tr>
   <td align="center">
   <%
   //공지글이라면, [공지]표시 
   if (CmmUtil.nvl(rDTO.getNotice_yn()).equals("1")){
      out.print("<b>[공지]</b>");
      
   //공지글이 아니라면, 글번호 보여주기       
   }else{
      out.print(CmmUtil.nvl(rDTO.getNotice_seq()));
         
   }
   %></td>
   <td align="center">
      <a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getNotice_seq())%>');">
      <%=CmmUtil.nvl(rDTO.getTitle()) %></a>
   </td>
   <td align="center"><%=CmmUtil.nvl(rDTO.getRead_cnt()) %></td>
   <td align="center"><%=CmmUtil.nvl(rDTO.getUser_name()) %></td>
   <td align="center"><%=CmmUtil.nvl(rDTO.getReg_dt()) %></td>
</tr>
<%
}
%>
</table>
<a href="/notice/NoticeReg.do">[글쓰기]</a>
</body>
</html>