<%@page import="org.bsworks.catalina.authenticator.oidc.BaseOpenIDConnectAuthenticator.AuthEndpointDesc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page isELIgnored="false" %>
<h1>Login</h1>
<c:redirect url="${requestScope['org.bsworks.oidc.authEndpoints'][0].url}"/>