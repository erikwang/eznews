package eznews;

import java.util.List;

public class NewsList {
	List<Object> newslist;
	public NewsList(){
	
	}
	public int getSize(){
		return newslist.size();
	}
	public Tdnews getTdnews(int index){
		return (Tdnews)newslist.get(index);
	}
	
}
