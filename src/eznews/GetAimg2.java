package eznews;
import java.io.*;
import java.sql.Blob;
import java.util.List;
import java.util.Set;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class GetAimg2 extends HttpServlet {

	private Session session;
	Transaction tx;
	private String imgid = "";
	private String addon="";
	private String addonimgid="";
	/**
	 * Constructor of the object.
	 */
	public GetAimg2() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		tx.commit();
		session.close();
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		imgid = request.getParameter("tfimgid");
		if(imgid == ""){
			System.out.println("No img");
			return;
		}
		addon = request.getParameter("addon");
		/*if(addon == ""){
			System.out.println("No img");
			return;
		}*/
		addonimgid = request.getParameter("addonimgid");
		/*if(imgid == ""){
			System.out.println("No img");
			return;
		}*/
		try{
			//Tdnews tdnews = (Tdnews)session.load(Tdnews.class,new Integer(1));
			boolean isaddon = false;
			session = HibernateSessionFactory.getSession();
			List<Object> result;
			//result = session.createQuery("FROM Tdaddonimgs where sn="+imgid+" and subid=1").list();
			result = session.createQuery("FROM Tdnews where sn="+imgid).list();
			isaddon = true;
			tx = session.beginTransaction();
			Blob img=null;
			if(result.size() == 0){
				System.out.println("No adaptable");
			}else{
				Tdaddonimgs tdaddonimg = new Tdaddonimgs();
				if(isaddon){
					Object test[];
					Tdnews news = new Tdnews();
					news = (Tdnews)result.get(0);
					test = news.getTdaddonimgs().toArray();
					System.out.println(test.length);
					for(int t=0 ;t<(test.length) ;t++){
						tdaddonimg = (Tdaddonimgs)test[t];
						//System.out.println(tdaddonimg.getSubid());
						if(tdaddonimg.getSubid() == 2){
							img = tdaddonimg.getImg();
						}
					}
					//System.out.println("subid"+tdaddonimg.getSubid());
					
				}
				//Integer ssn = tdnews.getSn();
				if(img != null){
					InputStream in = img.getBinaryStream();
					OutputStream outstream = response.getOutputStream();
					byte[] buff=  new byte[1024];
					int len;
					while((len = in.read(buff))!=-1){
						outstream.write(buff,0,len);
					}
					in.close();
					outstream.close();	
				}
			}
			tx.commit();
			session.close();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
		}
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		try{
			Configuration config = new Configuration().configure();
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
