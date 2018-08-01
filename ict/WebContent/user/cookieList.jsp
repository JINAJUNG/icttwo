<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="ict.com.test.CookiesList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CookiesList cl = new CookiesList(); //싱글톤패턴이 아니라 새로굄할때마다 새 인스턴스를 사용
	String[] chStr = request.getParameterValues("chStr"); 
	String searchStr = request.getParameter("searchStr");
	List<HashMap<String, String>> cList = cl.getCookiesList(searchStr,chStr);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/bt-337/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/css/bt-337/dist/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link href="/css/bt-337/dist/css/bootstrap-theme.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
	<form action="" class="form-inline">
	<div style="text-align: center;">
		<input type="checkbox" name="chStr" value="cName">과지이름
		<input type="checkbox" name="chStr" value="cPay">과지가격
		<input type="checkbox" name="chStr" value="cFactory">과지생산지
	</div>
	<div style="text-align: center;">
		<input type="text" class="form-control" name="searchStr">
	<button class="btn btn-default">검색</button>
	</div>
	
	</form>
		<table class="table table-hover">
			<tr style="text-align: center;">
				<th>과자이름</th>
				<th>가격</th>
				<th>생산지</th>
			</tr>
			<%
				for (int i = 0; i < cList.size(); i++) {
					HashMap<String, String> hm = cList.get(i);
			%>
			<tr>
				<td><%=hm.get("cName")%></td>
				<td><%=hm.get("cPay")%></td>
				<td><%=hm.get("cFactory")%></td>
			</tr>

			<%
				}
			%>
		</table>
	</div>
</body>
</html>