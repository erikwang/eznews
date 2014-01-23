package eznews;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class AuditNewsServlet extends HttpServlet {
	Session session;
	Transaction tx;
	Configuration config1;
	
	/**
	 * Constructor of the object.
	 */
	public AuditNewsServlet() {
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
			throws ServletException, IOException {}

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
		Tdnews v1=null;
		String sn = request.getParameter("tfsn");
		String flag = request.getParameter("flag");
		System.out.println("!!"+sn);
		try{
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			List<Object> result = session.createQuery("FROM Tdnews where sn ="+sn).list();
			if(result.size() !=0){
	   			v1 = (Tdnews)result.get(0);
	   		}else{
	   			v1 = null;
	   		}
			if(v1 != null){
				v1.setFlag(flag);
			}
			System.out.println(v1.getFlag());
			session.update(v1);
			tx.commit();
			session.close();
		}catch(Exception e){
			if (tx != null){
				tx.rollback();
				e.printStackTrace();
			} 
		}
		response.sendRedirect("../editlist.jsp");
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		try {
			config1 = new Configuration().configure();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
