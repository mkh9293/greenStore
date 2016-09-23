<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<tiles:insertAttribute name="head" />
</head>
<body>
	<tiles:insertAttribute name="menu" />
	
    <tiles:insertAttribute name="content" />
    
    <tiles:insertAttribute name="footer" />
</body>
</html>