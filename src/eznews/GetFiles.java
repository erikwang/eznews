package eznews;
import org.hibernate.cfg.Configuration;
import org.hibernate.*;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.*;

public class GetFiles {
	public Tdfiles v1 =new Tdfiles();
	public List<Object> newslist;
    Session session;
	
    public GetFiles(){
		
	}
	public List<Object> getFilesList(String condition){
		Configuration config1;
        try {
	    		config1 = new Configuration().configure();
	    		session = HibernateSessionFactory.getSession();
	    		newslist = session.createQuery("FROM Tdfiles "+condition).list();
	            Transaction tx = session.beginTransaction();
	            tx.commit();
	            session.close();                       
        } catch (Exception e) {
            e.printStackTrace();
        }
		return newslist;
	}
	
	public Tdfiles getTdfiles(String sn) {
        Configuration config1;
        try {
    		config1 = new Configuration().configure();
    		session = HibernateSessionFactory.getSession();
    		List<Object> result = session.createQuery("FROM Tdfiles where sn ="+sn).list();
            Transaction tx = session.beginTransaction();
           	for(int t = 0; t<result.size();t++){
           		v1 = (Tdfiles)result.get(t);
           		if (v1 != null){
           			int tt = v1.getCount()+1;
           			v1.setCount(tt);
           			session.update(v1);
           		}
            }
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return v1;
    }
}