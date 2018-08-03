<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ict.test.CarService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	/* CarService cs = new CarService();
	List<Map<String, String>> carList = cs.getCarList(); */
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String id = "ictu";
	private static String pwd = "12345678";
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	
	public List<Map<String, String>> getCarList() {
		List<Map<String, String>> carList = new ArrayList<Map<String,String>>();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, id, pwd);
			String sql = "select carNo, carName, carPrice, carVendor from car";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Map<String, String> car;
			while(rs.next()) {
				car = new HashMap<String,String>();
				car.put("name", rs.getString("carName"));
				car.put("price", rs.getString("carPrice"));
				car.put("vendor", rs.getString("carVendor"));
				carList.add(car);
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return carList;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bt-337/dist/css/bootstrap.css" />
<link rel="stylesheet" href="/css/bt-337/dist/css/bootstrap-theme.css" />
<style>
.table th, td {
	text-align: center;
}

.table td:hover {
	font-weight: bold;
	color: red;
	background-color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>자동차종류</th>
					<th>가격</th>
					<th>회사명</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Map<String,String>> carList = getCarList();
					for (Map<String, String> car : carList) {
				%>
				<tr>
					<td><%=car.get("name")%></td>
					<td><%=car.get("price")%></td>
					<td><%=car.get("vendor")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>