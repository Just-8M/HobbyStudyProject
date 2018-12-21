<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


${SingleCourseDetalis.name} <br/>
${SingleCourseDetalis.id}
<br/>
${recommendPhotoSlide}
<br/>
 <c:forEach items="${chaptSections}" var="cps" >
     ${cps.name}<br/>
</c:forEach>

<br/>
${user.username}
<br/>
${recomdCourseList}
<br/>

<c:forEach items="${recomdCourseList}" var="cps" >
     ${cps.name}<br/>
</c:forEach>
</body>
</html>