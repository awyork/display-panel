<%@page import="org.bsworks.catalina.authenticator.oidc.BaseOpenIDConnectAuthenticator.AuthEndpointDesc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page isELIgnored="false" %>
<html>
<%@ page import="java.util.Date" %>
<head>
	<title><%= application.getServletContextName() %></title>
	<link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>
<body>
<h1><%= application.getServletContextName() %></h1>

<a href="../LogoutServlet">Logout</a>
<p>Welcome to the test site: <%= session.getAttribute("uname") %></p>
<p>Email: <%= session.getAttribute("emailId") %></p>
<p>Header: <%= request.getAttribute("header") %>
<p>Id Token:<br/> <%= request.getAttribute("idToken") %></p>
<strong>Current Time is</strong>: <%=new Date() %>
<h2>Schematic:</h2>
<img alt="" src="../x/images/HUB75-2.svg">
<h2>Traces:</h2>
<p>Top:</p>
<img alt="" src="../x/images/HUB75-2-F_Cu.svg">
<p>Ground Pane:</p>
<img alt="" src="../x/images/HUB75-2-In1_Cu.svg">
<p>Power Pane:</p>
<img alt="" src="../x/images/HUB75-2-In2_Cu.svg">
<p>Bottom:</p>
<img alt="" src="../x/images/HUB75-2-B_Cu.svg">
</body>
</html>
