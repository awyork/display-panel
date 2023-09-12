package com.yorknation.hub75_2;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		
		String logoutURL =  "https://yorknation-tomcat-test.auth.us-east-1.amazoncognito.com/"
				+ "logout?client_id=45r3u25trcidotmq5gufilpnaf&response_type=code"
				+ "&logout_uri=";

		String logoutURI = "https://" + request.getServerName() + ":" 
				+ request.getServerPort() + "/display-panel/";
		
		logoutURL = logoutURL + URLEncoder.encode(logoutURI, StandardCharsets.UTF_8);
		
		if (session != null)
		{
			session.invalidate();
			System.out.println("Logged out");

		}

		response.sendRedirect(logoutURL);
	}

}
