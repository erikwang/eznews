<%@ page language="java" contentType="text/html; charset=gb2312" %>


 <%@page import="eznews.*,java.io.*,java.util.*"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str;
	String sn = "";
	if (request.getParameter("tfimgid") == null){
		sn = "1";
	}else{
		sn = request.getParameter("tfimgid");
	}
	
	List<Object> nl1;
	GetNews gn = new GetNews();
	Tdnews lthenews;
	Tdnews thenews = gn.getTdnews(sn,"");
	nl1 = gn.getNewsList(" order by sn desc");
	InputStream ins = thenews.getMaintext().getBinaryStream();								
	ByteArrayOutputStream   baos   =   new   ByteArrayOutputStream(); 
	int   i=-1; 
	while((i=ins.read())!=-1){
		baos.write(i);
	} 
	str = baos.toString();
	ins.close();
%>
<p>hi~</p>

<% for(int t=0;t<nl1.size();t++){
	lthenews = (Tdnews)nl1.get(t);
	out.println("<hr>");
	out.println(lthenews.getAuthor());
	out.println(lthenews.getTitle());
	out.println(lthenews.getVisitorscope());
}
%>
<p></p>
<table width="80%" border="1">
  <tr>
    <td height="30">title</td>
    <td height="30"><label><%=new NewsText().conversion(thenews.getTitle())%></label></td>
  </tr>
  <tr>
    <td height="30">auth</td>
    <td height="30"><%=new NewsText().conversion(thenews.getAuthor())%></td>
  </tr>
  <tr>
    <td height="30">main</td>
    <td height="30"><%=(new NewsText().desortString(str))%></td>
  </tr>
  <tr>
    <td height="30">img</td>
    <td height="30">
    <%if(thenews.getImg().length() < 1){
    	out.println("没有相关图片");
    }else{    	 
    %><label><img id="test" src="servlet/GetImage?tfimgid=<%=sn%>"></label>
    <%}%>
    </td>
  </tr>
  <tr>
    <td height="30">scope</td>
    <td height="30"><label><%=thenews.getVisitorscope()%></label></td>
  </tr>
  <tr>
    <td height="30" colspan="2"><label>
      <input type="submit" name="Submit2" value="Submit" />
      </label>
        <label></label></td>
  </tr>
</table>
<p>&nbsp;</p>
<form action="showimg.jsp" >
<p>
  <label>
  <input type="text" name="tfimgid">
  </label>
  <label>
  <input type="submit" name="Submit" value="Submit">
  </label>
</p>
</form>

</body>
</html>