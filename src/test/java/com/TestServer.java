package com;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.webapp.WebAppContext;

public class TestServer {

	private Server server;

	@After
	public void after() throws Exception {
		server.stop();
	}

	@Before
	public void before() throws Exception {
		server = new Server(2282);
		WebAppContext context = new WebAppContext();

		context.setContextPath("/t");
		context.setDescriptor("src/main/webapp/WEB-INF/web.xml");
		context.setResourceBase("src/main/webapp");
		server.setHandler(context);
		server.start();
	}
	
	public static void main(String args[]) throws Exception{
		Server server = new Server(2282);
		WebAppContext context = new WebAppContext();

		System.setProperty("devMode", "true");
		context.setContextPath("/t");
		context.setDescriptor("src/main/webapp/WEB-INF/web.xml");
		context.setResourceBase("src/main/webapp");
		server.setHandler(context);
		server.start();
		
		String timestamp = new SimpleDateFormat("MM-dd HH:mm:ss.SSS").format(new Date());

		System.out.println(String.format("[%s] [INFO] Press any key to stop server ... ", timestamp));
		System.in.read();
	}

	@Test
	public void test() throws IOException {
		String timestamp = new SimpleDateFormat("MM-dd HH:mm:ss.SSS").format(new Date());

		System.out.println(String.format("[%s] [INFO] Press any key to stop server ... ", timestamp));
		System.in.read();
	}
}
