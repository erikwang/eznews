package eznews;
import java.math.*;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.CacheMode; 
import org.hibernate.cfg.Configuration;

public class IpFilter {
	Vector<IpSec> ipseclist = new Vector<IpSec>();
	List<IpSec> result;
	private void getIpsec(){
		Session session = null;
		Transaction tx = null;
		try{
			Configuration config = new Configuration().configure();
			session = HibernateSessionFactory.getSession();
			session.setCacheMode(CacheMode.GET);
			result = session.createQuery("FROM IpSec").list();
			tx = session.beginTransaction();
			tx.commit();
			session.close();
		}catch (Exception e){
			if(tx != null){
				tx.rollback();
			}
			e.printStackTrace();
		}
	}
	public boolean isInside(String inip){
		getIpsec();
		long iniplong = iptolong(inip);
		for(int t=0;t<result.size();t++){
			long ipsecs = iptolong((String)result.get(t).getIpsecstart());
			long ipsece = iptolong((String)result.get(t).getIpsecend());
			if((iniplong > ipsecs) && (iniplong < ipsece)){
				return true;
			}
		}
		return false;
	}
	private static long iptolong(String strip){ 
		int j=0; 
		int i=0; 
		long[] ip=new long[4]; 
		int position1=strip.indexOf("."); 
		int position2=strip.indexOf(".",position1+1); 
		int position3=strip.indexOf(".",position2+1); 
		ip[0]=Long.parseLong(strip.substring(0,position1)); 
		ip[1]=Long.parseLong(strip.substring(position1+1,position2)); 
		ip[2]=Long.parseLong(strip.substring(position2+1,position3)); 
		ip[3]=Long.parseLong(strip.substring(position3+1)); 
		return (ip[0]<<24)+(ip[1]<<16)+(ip[2]<<8)+ip[3];  
	} 

}
