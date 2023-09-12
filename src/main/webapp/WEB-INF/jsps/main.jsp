<%@page
	import="org.bsworks.catalina.authenticator.oidc.BaseOpenIDConnectAuthenticator.AuthEndpointDesc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page isELIgnored="false"%>
<html>
<%@ page import="java.util.Date"%>
<head>
<title><%=application.getServletContextName()%></title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
</head>
<body class="main">
	<div>
		<h1><%=application.getServletContextName()%></h1>

		<p>
			This is a 4 layer board for driving a HUB75 Display Panel. <br /> It
			is based on the <a href="https://github.com/2dom/PxMatrix">PxMatrix
				project.</a>
		</p>

		<p>
			<video width="640" height="480" controls>
				<source src="../x/images/video.mp4" type="video/mp4">
			</video>
		</p>

		<a href="../LogoutServlet">Logout</a>
		<p>
			Welcome to the test site:
			<%=session.getAttribute("uname")%></p>
		<p>
			Email:
			<%=session.getAttribute("emailId")%></p>
		<p>
			Header:
			<%=request.getAttribute("header")%>
		<p>
			Id Token:<br />
			<%=request.getAttribute("idToken")%></p>
		<strong>Current Time is</strong>:
		<%=new Date()%>
		<h2>Schematic:</h2>
	</div>
	<img alt="" src="../x/images/HUB75-2.svg">
	<div>
		<h2>Traces exported from KiCad</h2>
		<h3>Top:</h3>
	</div>
	<img alt="" src="../x/images/HUB75-2-F_Cu.svg">
	<div>
		<h3>Ground Pane:</h3>
	</div>
	<img alt="" src="../x/images/HUB75-2-In1_Cu.svg">
	<div>
		<h3>Power Pane:</h3>
	</div>
	<img alt="" src="../x/images/HUB75-2-In2_Cu.svg">
	<div>
		<h3>Bottom:</h3>
	</div>
	<img alt="" src="../x/images/HUB75-2-B_Cu.svg">
	<div>
		<p>
			Background image provided by <a
				href="https://www.freepik.com/free-vector/circuit-board-seamless-pattern_4546129.htm#query=circuit%20board&position=4&from_view=keyword&track=ais">
				Image by macrovector_official</a> on Freepik
		</p>
	</div>
</body>
</html>
