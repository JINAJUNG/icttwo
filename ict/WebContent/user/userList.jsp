<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="ictdb.test.SearchService"%>
<%@page import="java.util.Iterator"%>
<%@page import="ictdb.test.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ictdb.test.impl.UserDAOImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="ict.com.test.CookiesList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* 	UserDAO udao = new UserDAOImpl();
	HashMap<String, String> user = new HashMap<String, String>(); 
	user = null;
	ArrayList<HashMap<String, String>> userList = udao.selectUserList(user);*/
	Iterator<String> it;
	SearchService cs = SearchService.getSearch(); //객체 생성

	String[] chStr = request.getParameterValues("chStr");
	String searchStr = request.getParameter("searchStr"); //검색조건 넘김

	List<HashMap<String, String>> carList = cs.getsearchService(searchStr, chStr);
	Set<String> col = cs.getColName();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/bt-337/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/bt-337/dist/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="/css/bt-337/dist/css/bootstrap-theme.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form action="" class="form-inline">
			<div style="text-align: center;">
				<input type="checkbox" name="chStr" value="MEMNUM">번호
				<input type="checkbox" name="chStr" value="MEMID">아이디
				<input type="checkbox" name="chStr" value="MEMPWD">비밀번호
				<input type="checkbox" name="chStr" value="MEMNAME">이름
				<input type="checkbox" name="chStr" value="MEMAGE">나이
				<input type="checkbox" name="chStr" value="MEMETC">비고
				<input type="checkbox" name="chStr" value="MODTIM">mo시간
				<input type="checkbox" name="chStr" value="MODDAT">mo날짜
				<input type="checkbox" name="chStr" value="CRETIM">cr시간
				<input type="checkbox" name="chStr" value="CREDAT">cr날짜
			</div>
			<div style="text-align: center;">
				<input type="text" class="form-control" name="searchStr">
				<button class="btn btn-default">검색</button>
			</div>

		</form>
		<table class="table table-hover">

			<tr style="text-align: center;">
				<%
					for(String colna : col){
				%>
				<th><%=colna%></th>
				<%
					}
				%>
			</tr>
			<%
				for (int i = 0; i < carList.size(); i++) {
			%>
			<tr>
				<%
					HashMap<String, String> hm = carList.get(i);
						it = hm.keySet().iterator();
						while (it.hasNext()) {
							String setCol = it.next();
				%>
				<td><%=hm.get(setCol)%></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>