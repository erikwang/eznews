package eznews;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.io.FileOutputStream;
import java.io.*;
import org.jdom.output.*;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.output.XMLOutputter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class GetNewsServlet extends HttpServlet {

	Session session;
	public List<Object> newslist;
	Configuration config1;
	/**
	 * Constructor of the object.
	 */
	public GetNewsServlet() {
		super();
	}

	public void toXml(List<Object> inlist){
		Element root = new Element("list");
        Document Doc = new Document(root);
        for (int i = 0; i < inlist.size(); i++) {
	        Tdnews thenews = (Tdnews)inlist.get(i);   
        	Element elements = new Element("news");
        	elements.setAttribute("id", ""+thenews.getSn());
        	elements.addContent(new Element("title").setText(thenews.getTitle()));
        	elements.addContent(new Element("author").setText(thenews.getAuthor()));
        	elements.addContent(new Element("date").setText(""+thenews.getCdate()));
        	String str="";
        	try{
        		if(thenews.getImg().length()>0){
        			elements.addContent(new Element("img").setText("http://210.42.24.87:8081/eznews/servlet/GetImage?tfimgid="+thenews.getSn()));        		
        		}else{
        			elements.addContent(new Element("img").setText("null"));
        		}
        		InputStream ins = thenews.getMaintext().getBinaryStream();
        		ByteArrayOutputStream   baos   =   new   ByteArrayOutputStream(); 
            	int   t=-1; 
            	while((t=ins.read())!=-1){
            		baos.write(t);
            	} 
            	str = baos.toString();
            	ins.close();
        	}catch(Exception e){
        		
        	}
        	elements.addContent(new Element("main").setText(""+str));
        	root.addContent(elements);
        }
        	XMLOutputter outp = new XMLOutputter(Format.getPrettyFormat());
	       // Êä³ö user.xml ÎÄ¼þ£»
	        try{
	        	outp.output(Doc, new FileOutputStream("c:\\user.xml"));
	        }catch(Exception e){
	        	e.printStackTrace();
	        }
	}
	
	public List<Object> getItemList(String owner,String type,String condition){
		
        try {
	    		config1 = new Configuration().configure();
	    		session = HibernateSessionFactory.getSession();
	    		Query q;
	    		if(type.equals("all")){
	    			q = session.createQuery("FROM Tdnews s where s.owner = :powner "+condition);
	    			q.setParameter("powner",owner);
	    		}else{
	    			q = session.createQuery("FROM Tdnews s where s.owner = :powner and s.newstype =	 :pnewstype "+condition);
	    			q.setParameter("powner",owner); 
		    		q.setParameter("pnewstype",type);
	    		}
	    		newslist = (List<Object>)q.list();
	    		Transaction tx = session.beginTransaction();
	            tx.commit();
	            session.close();                     
        } catch (Exception e) {
            e.printStackTrace();
        }
		return newslist;
	}
	
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
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
		List<Object> nl1;
		nl1 = getItemList("ca","all","");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(nl1.size());
		out.println(", using the GET method");
		out.print("<table>");
		for(int t=0;t<nl1.size();t++){
			out.print("<tr>");
			Tdnews lthenews = (Tdnews)nl1.get(t);
			out.print("<td>"+lthenews.getTitle()+"</td>"+"<td>"+lthenews.getTitle()+"</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		toXml(nl1);
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
		try {
			config1 = new Configuration().configure();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
