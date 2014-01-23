package eznews;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.*;

public class DeleteServlet extends HttpServlet {
	private String sn;
	Configuration config1;
	Session session;
	/**
	 * Constructor of the object.
	 */
	public DeleteServlet() {
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

		sn = request.getParameter("sn");
		String type = request.getParameter("type");
		String aisn = request.getParameter("aisn");
		Transaction tx = null;
		try{
			if(type.equals("n")){
				Tdnews v1 = new Tdnews();
				v1.setSn(new Integer(sn).intValue());
				session = HibernateSessionFactory.getSession();
				tx = session.beginTransaction();
				session.delete(v1);
				tx.commit();
				session.close();
				response.sendRedirect("../editlist.jsp");
			}
		}catch(Exception e){
			if(tx != null){
				tx.rollback();
			}
			e.printStackTrace();
		}
		
		try{
			if(type.equals("f")){
				Tdfiles v1 = new Tdfiles();
				v1.setSn(new Integer(sn).intValue());
				session = HibernateSessionFactory.getSession();
				tx = session.beginTransaction();
				session.delete(v1);
				tx.commit();
				session.close();
				response.sendRedirect("../filelist.jsp");
			}
		}catch(Exception e){
			if(tx != null){
				tx.rollback();
			}
			e.printStackTrace();
		}
		if(type.equals("ai")){
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			String hql = "delete from Tdaddonimgs s where s.sn = :psn and s.subid = :psubid"; 
			Query q = session.createQuery(hql); 
			q.setParameter("psn",new Integer(sn).intValue());
			q.setParameter("psubid",new Integer(aisn).intValue());
			q.executeUpdate();
			tx.commit();
			session.close();
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
		}catch (Exception e){
			
		}
	}

}
