package eznews;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.*;
import java.io.*;
import java.sql.Blob;


public class SaveNews {
	public boolean SaveNews(){
		String title;
		String author;
		author = "KCET2009";
		title = "test";
		//String maintext="hi blob!";
		SessionFactory sf;
		Session session;
		Configuration config1;
		try {
			System.out.println("in");
			FileInputStream fis = new FileInputStream("C:\\65.jpg");
			Blob img = Hibernate.createBlob(fis);
			config1 = new Configuration().configure();
			sf = config1.buildSessionFactory();
			session = sf.openSession();
			Transaction tx = session.beginTransaction();
			Tdnews v1 = new Tdnews();
			v1.setAuthor(author);
			v1.setTitle(title);
			v1.setVisitorscope("all");
			//v1.setMaintext(img);
			v1.setImg(img);
			session = sf.openSession();
            session.beginTransaction();
    		session.save(v1);
    		tx.commit();
    		session.close();
    		System.out.println("done!");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}	
	public static void main(String[] args){
		System.out.println("saving...");
		new SaveNews().SaveNews();
		System.out.println("out");
	}	
}