<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forumtopic.model.*"%>
<%@ page import="java.util.*,java.io.*"%>

<%
	ForumTopicService forumtopicSvc = new ForumTopicService();
	List<ForumTopicVO> list = forumtopicSvc.getAll();
%>
<html>
<head>

<title>所有主題資料 - listAllForumTopic.jsp</title>
<style>
a {
	text-decoration: none;
	color: green;
}

a:hover {
	color: red;
	text-decoration: underline;
}

th {
	font-size: 1em;
}

td {
	font-size: 0.8em;
}

div {
	width: 100px;
	height: 150px;
}

img {
	max-width: 100%;
	max-height: 100%;
}
</style>
</head>
<body>
	<a href="<%=request.getContextPath() %>/back-end/forumtopic/select_page.jsp">回首頁</a>
	
	<table style="border: 1px GREEN solid;" border='1'>
		<tr>
			<th>主題編號</th>
			<th>班級編號</th>
			<th>主題名稱</th>
			<th>主題介紹</th>
			<th>板規</th>
			<th>發文格式</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<%
			for (ForumTopicVO forumTopicVO : list) {
		%>
		<tr>

			<td><%=forumTopicVO.getForumTopicNo()%></td>
			<td><%=forumTopicVO.getBanjiNo()%></td>
			<td><%=forumTopicVO.getForumTopicName()%></td>
			<td><%=forumTopicVO.getContent()%></td>
		    <td><%=forumTopicVO.getRule()%></td>
			<td><%=forumTopicVO.getPostTemplete()%></td>
						
			<td align="center">
			<form method="post" action="<%=request.getContextPath() %>/forumTopic/forumTopic.do" >
			
					<input type="submit" value="修改"> 
					<input type="hidden" name="forumTopicNo" value="<%=forumTopicVO.getForumTopicNo()%>"> 
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
			<form method="post" action="<%=request.getContextPath() %>/forumTopic/forumTopic.do" >
			     <input type="submit" value="刪除">
			     <input type="hidden" name="forumTopicNo"  value="<%=forumTopicVO.getForumTopicNo()%>">
			     <input type="hidden" name="action" value="delete">
			</FORM>
			</td>
			
			<%
				}
			%>
		</tr>
	</table>


</body>
</html>