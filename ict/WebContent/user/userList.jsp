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
	/* 	CookiesList cl = CookiesList.getCookies();
		String[] chStr = request.getParameterValues("chStr");
		String searchStr = request.getParameter("searchStr");
		List<HashMap<String, String>> cList = cl.getCookiesList(searchStr,chStr); */

	UserDAO udao = new UserDAOImpl();
	HashMap<String, String> user = new HashMap<String, String>();
	Iterator<String> it;
	user = null;
	ArrayList<HashMap<String, String>> userList = udao.selectUserList(user);
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
				<input type="checkbox" name="chStr" value="cName">과지이름 <input
					type="checkbox" name="chStr" value="cPay">과지가격 <input
					type="checkbox" name="chStr" value="cFactory">과지생산지
			</div>
			<div style="text-align: center;">
				<input type="text" class="form-control" name="searchStr">
				<button class="btn btn-default">검색</button>
			</div>

		</form>
		<table class="table table-hover">

			<tr style="text-align: center;">
				<%
					HashMap<String, String> hrHm = userList.get(0);
					it = hrHm.keySet().iterator();
					while (it.hasNext()) {
						String setCol = it.next();
				%>
				<th><%=setCol%></th>
				<%
					}
				%>
			</tr>
			<%
				for (int i = 0; i < userList.size(); i++) {
			%>
			<tr>
				<%
					HashMap<String, String> hm = userList.get(i);
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