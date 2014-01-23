package eznews;

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

public class SaveNewsServlet extends HttpServlet {
	private String title;
	private String author;
	private String txmain;
	private Blob img;
	private Blob img1;
	private Blob img2;
	private Blob img3;
	private Blob imgs[];
	private Blob btxmain;
	private String scope;
	private String sn;
	private String ntype;
	private java.util.Date date;
	Set addonimgSet = new HashSet();
    Tdaddonimgs addimg1 = null;
    Tdaddonimgs addimg2 = null;
    Tdaddonimgs addimg3 = null;
	Session session;
	Session session2;
	Configuration config1;
	/**
	 * Constructor of the object.
	 */
	public SaveNewsServlet() {
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

		title="";
		author="";
		txmain="";
		scope="";
		sn="";
		ntype="";
		date= new java.util.Date();
		addonimgSet = new HashSet();
		Transaction tx=null;
		Transaction tx2=null;
		try{	
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			request.setCharacterEncoding("ISO8859-1");   
			//request.setCharacterEncoding("UTF-8");
			//upload.setHeaderEncoding("UTF-8");
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			//String filename;
			addimg1 = new Tdaddonimgs();
    		addimg2 = new Tdaddonimgs();
    		addimg3 = new Tdaddonimgs();
			while (iter.hasNext()) {
		    	FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
		       			if(item.getFieldName().equals("tfauthor")){
			       			author = item.getString();
		       				/*byte[]   temp3   =   item.getString().getBytes("gb2312");   
			    			author   =   new   String(temp3);*/
			    			
			       		}
		       			if(item.getFieldName().equals("tfsn")){
			       			sn = item.getString();
			       		}
			    		if(item.getFieldName().equals("tftitle")){
			    			title = item.getString();
			    			//System.out.println("!-"+title);
			    			   			
			       		}
			    		if(item.getFieldName().equals("sescope")){
			       			scope = item.getString();   			
			       		}
			    		if(item.getFieldName().equals("newstype")){
			       			ntype = item.getString();
			    			/*ntype = item.getString("gb2312");
			    			byte[]   temp3   =   item.getString().getBytes("gb2312");   
			    			ntype   =   new   String(temp3);*/
			       		}
			    		if(item.getFieldName().equals("tfmain")){
			       			txmain = item.getString();
			       			//String ttxmain = new NewsText().sortString(txmain);
			       			
			       			if (txmain.equals(null)){
			       				txmain = "Oops, null";
			       			}
			       			System.out.println(">>>>"+txmain+"<<<<");
			       			btxmain = Hibernate.createBlob(txmain.getBytes());
			       		}
		    	}else{
		    		if (item.getFieldName().equals("fimg")){
		      			//filename = item.getString("gb2312");
		      			img = Hibernate.createBlob(item.getInputStream());
			      	}
		    		if (item.getFieldName().equals("fimga1")){
		      			//filename = item.getString("gb2312");
		      			img1 = Hibernate.createBlob(item.getInputStream());
		      			//addimg1.setSn(new Integer(sn).intValue());
		      			if(img1.length() > 0){
		      				addimg1.setImg(img1);
		      				addimg1.setSubid(1);
		      				//System.out.println(img1.length());
		                }
			      	}
		    		if (item.getFieldName().equals("fimga2")){
		      			//filename = item.getString("gb2312");
		      			img2 = Hibernate.createBlob(item.getInputStream());
		      			//addimg2.setSn(new Integer(sn).intValue());
		      			if(img2.length() > 0){
		      				addimg2.setImg(img2);
		      				addimg2.setSubid(2);
		      				//System.out.println(img2.length());
		                }
			      	}
		    		if (item.getFieldName().equals("fimga3")){
		      			//filename = item.getString("gb2312");
		    			//addimg3.setSn(new Integer(sn).intValue());
		    			img3 = Hibernate.createBlob(item.getInputStream());
		      			if(img3.length() > 0){
		      				addimg3.setImg(img3);
		      				addimg3.setSubid(3);
		      				//System.out.println(img3.length());
		      			}
			      	}
		    	}
			}
				Tdnews v1 = new Tdnews();
				if(! sn.equals("")){
					//Ready to update a persisted TDNEWS object (Update)
					imgs = new Blob[4];
		    		imgs[1]=img1;
		    		imgs[2]=img2;
		    		imgs[3]=img3;
					session2 = HibernateSessionFactory.getSession();
					tx2 = session2.beginTransaction();
					//List<Object> result2 = session2.createQuery("FROM Tdaddonimgs where sn ="+sn+" order by isn").list();
					List<Object> result2 = session2.createQuery("FROM Tdnews where sn ="+sn).list();
					Object test[];
					Tdnews news = new Tdnews();
					news = (Tdnews)result2.get(0);
					test = news.getTdaddonimgs().toArray();
					Tdaddonimgs tdaddonimg1;
					int isn;
					for(int s=1;s<4;s++){
						boolean flag1=false;
						tdaddonimg1 = new Tdaddonimgs();
						for(int t=0 ;t<(test.length) ;t++){
							if(!flag1){
								tdaddonimg1 = (Tdaddonimgs)test[t];
							}
							if((!flag1)&&(tdaddonimg1.getSubid() == s)) {
								isn = tdaddonimg1.getIsn();
								//if there is a new add-on image from the web
								if (imgs[s].length()>0 ){
										tdaddonimg1.setIsn(isn);
										tdaddonimg1.setSn(new Integer(sn).intValue());
										tdaddonimg1.setImg(imgs[s]);
										tdaddonimg1.setSubid(s);
										flag1 = true;
								}else{
									//if there is No a new add-on image from the web
									tdaddonimg1.setIsn(isn);
									tdaddonimg1.setSubid(s);
									tdaddonimg1.setSn(new Integer(sn).intValue());
									flag1 = true;
								}
							}
						}
						// if there is No add-on image with subid in the original tenews object
						if(!flag1){
							tdaddonimg1 = new Tdaddonimgs();
							tdaddonimg1.setImg(imgs[s]);
							tdaddonimg1.setSn(new Integer(sn).intValue());
							tdaddonimg1.setSubid(s);
						}
						addonimgSet.add(tdaddonimg1);
					}
					v1 = news;
					v1.setSn(new Integer(sn).intValue());
					v1.setAuthor(author);
					v1.setTitle(title);
					v1.setVisitorscope(scope);
					v1.setMaintext(btxmain);
					if(img.length() > 1){
						v1.setImg(img);
					}
					if (addonimgSet.size() != 0){
						v1.setTdaddonimgs(addonimgSet);	
					}
					v1.setNewstype(ntype);
					System.out.println("~~!!"+addonimgSet.size());
					session2.saveOrUpdate(v1);
					tx2.commit();
					session2.close();
				}else{
					//Ready to persist a new TDNEWS object (Insert)
					session = HibernateSessionFactory.getSession();
					tx = session.beginTransaction();
					if(img1.length()> 0 ){
						addimg1.setSubid(1);
						addonimgSet.add(addimg1);
					}
					if(img2.length()> 0 ){
						addimg2.setSubid(2);
						addonimgSet.add(addimg2);
					}
					if(img3.length()> 0 ){
						addimg3.setSubid(3);
						addonimgSet.add(addimg3);
					}
					v1.setCount(1);
					v1.setCdate(date);
					v1.setAuthor(author);
					v1.setTitle(title);
					v1.setVisitorscope(scope);
					v1.setMaintext(btxmain);
					v1.setImg(img);	
					v1.setFlag("W");
					v1.setOwner("ca");
					v1.setNewstype(ntype);
					if (addonimgSet.size() != 0){
						v1.setTdaddonimgs(addonimgSet);	
					}
					session.saveOrUpdate(v1);
					tx.commit();
					session.close();
				}				
				System.out.println("done!");
		}catch (Exception e){
			if (tx != null){
				tx.rollback();
			}
			e.printStackTrace();
		}
		response.sendRedirect("../editlist.jsp");
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
