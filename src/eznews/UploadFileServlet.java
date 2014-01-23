package eznews;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.io.*;
import java.sql.Blob;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;

import org.apache.commons.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.Configuration;

public class UploadFileServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	Configuration config1;
	private String filename;
	private Date cdate;
	private String filecomment;
	private String filetype;
	Session session;
	int imgsizemax = 2000000;
	String fileName="";
	//String prefix = "C:\\jakarta-tomcat-5.0.28\\webapps\\bnnt\\upload\\";
	String prefix = "/usr/local/eznews/jakarta-tomcat-5.0.28/webapps/eznews/upload/";
	private java.util.Date date= new java.util.Date();
	
	public UploadFileServlet() {
		super();
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

	
		try{	
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			request.setCharacterEncoding("UTF-8");
			//upload.setHeaderEncoding("UTF-8");
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			//String filename;
			while (iter.hasNext()) {
		    	FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
		       			if(item.getFieldName().equals("tffilecomment")){
			       			filecomment = item.getString("gb2312");
			       		}
			    		if(item.getFieldName().equals("rb1")){
				   			filetype = item.getString("gb2312");
				   		}		       			
		    	}else{
		    		if (item.getFieldName().equals("ffile")){
			    		String fieldName = item.getFieldName();
			    		fileName = item.getName();
						fileName = new String(fileName.getBytes("GBK"),"gb2312");
			    		File fullFile  = new File(fileName);   
						fileName = fullFile.getName();
						fileName = FilenameUtils.getName(fileName); //commons.io
			    	 	int blength;
						byte[] bt= fileName.getBytes();
						blength = fileName.length();
						for (int i=0;i<blength ;i++ ){
					 		if (((bt[i]<46)&&(bt[i]>33))||(bt[i]== 96)||(bt[i] == 63)){ // '?
									return;
							}
						}
			    	  	if (fileName == null){
				      		return;
			    	  	}else{
			    			long sizeInBytes = item.getSize();
							/*if ( ! fcontentType.equals("image/pjpeg")){
								if ( ! fcontentType.equals("image/gif")){
									out.println("文件不是 jpeg  gif格式");
									return;
								}
								if ( ! fcontentType.equals("image/gif")){
									out.println("文件不是 jpeg  gif格式");
									return;
								}
							}*/
							File uploadedFile = new File(prefix+fileName);
							if (sizeInBytes > imgsizemax){
								return;
							}
							item.write(uploadedFile);
			    	  	}
			    	}
				}
			}
			session = HibernateSessionFactory.getSession();
			Transaction tx = session.beginTransaction();
			Tdfiles v1 = new Tdfiles();
			v1.setCdate(date);
			v1.setFilename(fileName);
			v1.setFiletype(filetype);
			v1.setFilecomment(filecomment);
			session.save(v1);
			tx.commit();
			session.close();
			System.out.println("done!");
		}catch (Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("../filelist.jsp");
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
			//session = sf.openSession();
			//session.beginTransaction();
			//Transaction tx = session.beginTransaction();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
