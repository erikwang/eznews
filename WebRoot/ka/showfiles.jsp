<%@ page language="java" contentType="text/html; charset=gb2312" %>


 <%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String str;
	String sn = "";
	if (request.getParameter("tfimgid") == null){
		
	}else{
		sn = request.getParameter("tfimgid");
	}
	
	List<Object> nl1;
	GetFiles gn = new GetFiles();
	Tdfiles lthenews;
	nl1 = gn.getFilesList(" order by sn desc");
%>
<p>hi~</p>

<% for(int t=0;t<nl1.size();t++){
	lthenews = (Tdfiles)nl1.get(t);
	out.println("<hr>");
	out.println(lthenews.getSn());
	out.println("<a href=\"upload\\"+lthenews.getFilename()+"\">"+lthenews.getFilename()+"</a>");
	out.println(new NewsText().conversion(lthenews.getFilecomment()));
	out.println(lthenews.getCdate());
	out.println(lthenews.getFiletype());

}
%>
<p></p>

<p>&nbsp;</p>
<a href = "uploadfile.jsp">UPLOAD</a>

</body>
</html>