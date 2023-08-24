package com.yorknation.hub75_2;

import java.io.IOException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bsworks.catalina.authenticator.oidc.BaseOpenIDConnectAuthenticator.Authorization;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Hub75Servlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Logger logger = Logger.getLogger(Hub75Servlet.class.getName());
		logger.setLevel(Level.ALL);
	    //logger.info(logger.getLevel().toString());
		logger.info("INFO!!");
		logger.fine("FINE!!");
		logger.finest("You so fine");
		
		System.out.println("Hello!");
		
		HttpSession session = request.getSession(false);
		
		if (session == null)
		{
			System.out.println("Logged in");
			session = request.getSession(true);
		}
		
		Authorization auth = (Authorization)session.getAttribute("org.bsworks.oidc.authorization");
		if (auth != null)
		{
			String[] chunks = auth.getIdToken().split("\\.");
			
			Base64.Decoder decoder = Base64.getUrlDecoder();

			String header = new String(decoder.decode(chunks[0]));
			String payload = new String(decoder.decode(chunks[1]));
			
			request.setAttribute("header", header);
			request.setAttribute("idToken", payload);
			
			payload = payload.replace("cognito:username", "cognito_username");
			payload = payload.replace("custom:role", "custom_role");
			
			ObjectMapper om = new ObjectMapper();
		
			IdToken root = om.readValue(payload, IdToken.class);
			
			
			session.setAttribute("uname", root.cognito_username);
			session.setAttribute("emailId", root.email);
		}
		

		
		request.getRequestDispatcher("MainJsp").forward(request, response);
	}

}
