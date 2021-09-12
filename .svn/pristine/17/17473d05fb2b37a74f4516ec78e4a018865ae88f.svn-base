<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html>
<head>
<s:csrfMetaTags/>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<form action="/admin/test" method="post">
		<s:csrfInput/>
		상품명 : <input type="text" name="product_name" id="product_name"><br>
		상품색상<br>
		<input type="checkbox" name="product_option_color" value="빨강">빨강
		<input type="checkbox" name="product_option_color" value="노랑">노랑
		<input type="checkbox" name="product_option_color" value="초록">초록<br>
		상품크기<br>
		<input type="text" name="product_option_size">
		<input type="text" name="product_option_size">
		<input type="text" name="product_option_size">
		<button type="submit">테스트</button>
		
	</form>

</body>
</html>