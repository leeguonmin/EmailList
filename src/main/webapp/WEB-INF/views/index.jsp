<%@page import="java.util.Iterator"%>
<%@page import="learnbyteaching.emaillist.vo.EmailVo"%>
<%@page import="java.util.List"%>
<%@ page import="learnbyteaching.emaillist.dao.EmailListDaoImpl"%>
<%@ page import="learnbyteaching.emaillist.dao.EmailListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" 
prefix="c" %>


<%--  20250110 jstl 배우고, 이걸로 코드 바꾸려고 주석처리하고 수정임 
<%
List<EmailVo> list = null;


list = (List<EmailVo>)request.getAttribute("list");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일링 리스트:메인</title>
<!-- Bootstrap CSS 추가 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">
	<script>
	function confirm_delete(no) {
		let result = confirm("정말 삭제하겠습니까?");
		
		if (result) {
			document.location.href = "<%= request.getContextPath() %>/el?a=delete&no="+no; 
		}
	}
	</script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">메일링 리스트(Model 2 방법)</h1>
        

        <!-- 리스트 -->
        <!-- vo 객체의 getter를 이용, 리스트를 표시 -->
        <table class="table table-bordered mt-3">
            <thead class="thead-light">
                <tr>
                    <th scope="col">성/이름</th>
                    <th scope="col">이메일</th>
                    <th scope="col">도구</th>
                </tr>
            </thead>
            <tbody>
            <%--   
            <%
        	for (EmailVo vo: list) {
       		 %> --%>
       		 <c:forEach items="${list }" var="vo">
			  <tr>
                    						<%-- <td><%= vo.getLastName() %><%= vo.getFirstName() %></td> --%>
                    <td>${vo.lastName }${vo.firstName }</td>
                    						<%-- <td><%= vo.getEmail() %></td> --%>
                    <td>${vo.email }</td>
                    						<!-- < td><a class="btn btn-danger" href="delete.jsp?no=">삭제</a></td > -->
                   							<%--  <td><a class="btn btn-danger btn-sm" href="#" onclick="confirm_delete(<%= vo.getNo() %>)">삭제</a></td> --%>
                    <td><a class="btn btn-danger btn-sm" href="#" onclick="confirm_delete(${vo.no})">삭제</a></td>
                </tr>
               <%-- (20250110 주석 처리 -> 코드 수정)  
               <%
                }
                %> --%>
				</c:forEach>
            </tbody>
        </table>
       
        <br />

        <p>
        <!-- <a href="form.jsp?a=form" class="btn btn-primary">추가 이메일 등록</a>  -->
        <a href="<%= request.getContextPath() %>/el?a=form" class="btn btn-primary">추가 이메일 등록</a>
        </p>
    </div>

    <!-- Bootstrap JS 및 종속성 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous"></script>
</body>
</html>