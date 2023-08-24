<%@page import="org.bsworks.catalina.authenticator.oidc.BaseOpenIDConnectAuthenticator.AuthEndpointDesc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page isELIgnored="false" %>
<h1>Login</h1>

<% 
  java.util.Enumeration<String> e = request.getAttributeNames();
    while (e.hasMoreElements()){ 
        String name = (String) e.nextElement();
        out.print("<b>" + name + ": </b>"); 
          out.print(request.getAttribute(name) + "<br>");
      } 
  
%>
<%= request.getAttribute("org.bsworks.oidc.authEndpoints") %>
<%
  AuthEndpointDesc desc = (AuthEndpointDesc)((java.util.ArrayList)request.getAttribute("org.bsworks.oidc.authEndpoints")).get(0);
  out.print(desc.getUrl());
%>
<%-- offer OpenID Connect providers if authenticator is configured --%>
<c:set var="authEndpoints" value="${requestScope['org.bsworks.oidc.authEndpoints']}"/>
<p>${request }</p>
<c:if test="${!empty authEndpoints}">
<h2>Using OpenID Connect</h2>
<ul>
  <c:forEach items="${authEndpoints}" var="ep">
  <li><a href="${ep.url}"><c:out value="${ep.name}"/></a></li>
  </c:forEach>
</ul>
</c:if>

<%-- offer local login form if not explicitely disabled --%>
<c:if test="${!requestScope['org.bsworks.oidc.noForm']}">
<h2>Using Form</h2>
<form method="post" action="j_security_check">
  <ul>
    <li>
      <label for="usernameInput">Username</label>
      <div><input id="usernameInput" type="text" name="j_username"></div>
    </li>
    <li>
      <label for="passwordInput">Password</label>
      <div><input id="passwordInput" type="password" name="j_password"></div>
    </li>
    <li>
      <button type="submit">Submit</button>
    </li>
  </ul>
</form>
</c:if>