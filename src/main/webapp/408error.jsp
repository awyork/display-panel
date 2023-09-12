<%@page import="org.bsworks.catalina.authenticator.oidc.BaseOpenIDConnectAuthenticator.AuthEndpointDesc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login timeout</title>
</head>
<body>
<p>The SSO login process took too long.  You will be redirected in 5 seconds</p>

<script type="text/javascript">
    function redirect() {
        location.href = "x/MainJsp";
    }
    window.setTimeout("redirect()", 5000);
</script>

</body>
</html>