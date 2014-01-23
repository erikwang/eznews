package eznews;
import org.hibernate.cfg.Configuration;
import org.hibernate.*;

import java.util.*;
import java.io.*;

public class GetNews {
	public Tdnews v1 =new Tdnews();
	public List<Object> newslist;
    Session session;
	
    public GetNews(){
		
	}
	public List<Object> getNewsList(String condition){
		Configuration config1;
        try {
	    		System.out.println("!!!!!!!!!!!!!!");
        		config1 = new Configuration().configure();
	    		session = HibernateSessionFactory.getSession();
	    		//newslist = session.createQuery("FROM Tdnews "+condition).list();
	    		newslist = session.createQuery("FROM Tdnews ").list();
	            Transaction tx = session.beginTransaction();
	            tx.commit();
	            session.close();                     
        } catch (Exception e) {
            e.printStackTrace();
        }
		return newslist;
	}
	
	public List<Object> getItemList(String owner,String type,String condition){
		Configuration config1;
        try {
	    		config1 = new Configuration().configure();
	    		session = HibernateSessionFactory.getSession();
	    		Query q;
	    		if(type.equals("all")){
	    			q = session.createQuery("FROM Tdnews s where s.owner = :powner "+condition);
	    			q.setParameter(0,owner); 
	    		}else{
	    			q = session.createQuery("FROM Tdnews s where s.owner = :powner and s.newstype =	 :pnewstype "+condition);
	    			q.setParameter(0,owner); 
		    		q.setParameter(1,type);
	    		}
	    		newslist = (List)q.uniqueResult();
	    		Transaction tx = session.beginTransaction();
	            tx.commit();
	            session.close();                     
        } catch (Exception e) {
            e.printStackTrace();
        }
		return newslist;
	}
	
	public Tdnews getTdnews(String sn,String requestip) {
		Configuration config1;
        try {
    		config1 = new Configuration().configure();
    		session = HibernateSessionFactory.getSession();
    		List<Object> result = session.createQuery("FROM Tdnews where sn ="+sn).list();
            Transaction tx = session.beginTransaction();
       		if(result.size() !=0){
       			v1 = (Tdnews)result.get(0);
       		}else{
       			v1 = null;
       			return v1;
       		}
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        /*if(! new IpFilter().isInside(requestip)){
			if(v1.getVisitorscope().equals("in")){
				v1.setMaintext(Hibernate.createBlob("未认证IP".getBytes()));
				v1.setImg(Hibernate.createBlob("".getBytes()));
			}
		}
        if(v1.getFlag().equals("F")){
        	v1.setMaintext(Hibernate.createBlob("未经过审核".getBytes()));
			v1.setImg(Hibernate.createBlob("".getBytes()));
        }*/
		return v1;
    }
	public void auditingNews(int sn,String newsstate){
		Configuration config1;
        try {
    		config1 = new Configuration().configure();
    		session = HibernateSessionFactory.getSession();
    		List<Object> result = session.createQuery("FROM Tdnews where sn ="+sn).list();
            Transaction tx = session.beginTransaction();
           	for(int t = 0; t<result.size();t++){
           		v1 = (Tdnews)result.get(t);
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
        
		
	}
	
}