package eznews;

import java.io.UnsupportedEncodingException;

public class NewsText {
	public   static   String   conversion(String   str){   
        String   string="";   
        if(str!=null){   
            try   {   
                byte[]   bytes   =   str.getBytes("ISO-8859-1");   
                string   =   new   String(bytes,   "gb2312");   
            }   
            catch   (UnsupportedEncodingException   ex)   {   
                   
            }   
            string   =   string.trim();   
            return   string;   
        }else{   
            return   string;   
        }   
    }
	public String sortString(String input){
		if(input == null){
				return "无内容";
		}
		StringBuffer   filtered   =   new   StringBuffer(input.length());   
		char   c;   
		for(int   i=0;   i<input.length();   i++)   {   
		  c   =   input.charAt(i);   
		  if   (c   ==   '<')   {   
		      filtered.append("&lt;");   
		  }   else   if   (c   ==   '>')   {   
		      filtered.append("&gt;");   
		  }   else   if   (c   ==   '"')   {   
		      filtered.append("&quot;");   
		  }   else   if   (c   ==   '&')   {   
		      filtered.append("&amp;");   
		  }   else   if   (c   ==   ' ')   {   
		      filtered.append("&nbsp;");  
		  }   else   if   (c   ==   '\n')   {   
              filtered.append("&lt;br&gt;");   
		  }   else   if   (c   ==   '\b')   {   
              filtered.append("&nbsp;");
		  }   else   {   
		      filtered.append(c);   
		  }   
		}   
		String txmain = filtered.toString();
		//txmain = txmain.replace("\n","<br>");
		return txmain.replace(" ","&nbsp;");
	}
	public String desortString(String input){
		if(input == null){
				return "无内容";
		}
			String txm;
			txm = input.replaceAll("&lt;img&nbsp;","<img ");
			txm = txm.replaceAll("&nbsp;&gt;"," >");
			txm = txm.replaceAll("&lt;","<");
			txm = txm.replaceAll("&gt;",">");
			txm = txm.replaceAll("&quot;","\"");
			//txm = txm.replaceAll("&nbsp;"," ");
			txm = txm.replace("\n","<br>");
			
			return txm;
	}

	public String edesortString(String input){
				if(input == null){
						return "无内容";
				}
					String txm;
					txm = input.replaceAll("&lt;","<");
					txm = txm.replaceAll("&gt;",">");
					txm = txm.replaceAll("&quot;","\"");
					txm = txm.replaceAll("&nbsp;"," ");
					txm = txm.replace("<br>","\n");
					return txm;
	}
	
}
