<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<title>WIT-NCM</title></head>
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
	GetFiles gn = new GetFiles();
	Tdfiles lthenews;
	nl1 = gn.getFilesList("order by sn desc");
%>
	<div id="content">
    	<div id="header">
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
      </div>
		<div id="left">
			<div class="border">
				<div class="subheader">
					<p>���ײ����������մ��о�����&gt;&gt;&gt;��������&gt;&gt;&gt;�ϴ�����</p>
				</div>
			</div>				
		  <div class="left_articles">
	<%
	out.println("<table width='100%' cellspacing='10'>");
	out.println("<tr>");
  	out.println("<td>"+"�ļ�˵��"+"</td>");
  	out.println("<td>"+"�ϴ�·��"+"</td>");
  	out.println("<td>"+"����ʱ��"+"</td>");
  	out.println("<td>"+"�ļ���С"+"</td>");
	out.println("<td>"+"ɾ��"+"</td>");
	out.println("</tr>");
	for(int t=0;t<nl1.size();t++){
	lthenews = (Tdfiles)nl1.get(t);
	out.println("<tr bgcolor='#EEEEEE'>");
	out.println("<td>"+new NewsText().conversion(lthenews.getFilecomment())+"</td>");
	out.println("<td>"+"<a href=\"upload\\"+lthenews.getFilename()+"\">"+lthenews.getFilename()+"</a>"+"</td>");
	out.println("<td>"+lthenews.getCdate()+"</td>");
	out.println("<td>"+lthenews.getFiletype()+"</td>");
	out.println("<td>"+"<a href = servlet/DeleteServlet?sn="+lthenews.getSn()+"&type=f"+">"+"ɾ��"+"</td>");
	out.println("</tr>");
	}
	out.println("</table>");
	out.println("<a href = uploadfile.jsp>"+"�ϴ��ļ�"+"</a>");
	%>
		  </div>
		</div>	
		
		<div id="right">
			<ul id="side_menu">
            	<li><a href="english.jsp">��&nbsp;&nbsp;English</a></li>
                <li><a href="index.jsp">��&nbsp;&nbsp;��ҳ</a></li>
                <li><a href="editlist.jsp">��&nbsp;&nbsp;���Ź���</a></li>
                <li><a href="filelist.jsp">��&nbsp;&nbsp;�ϴ�����</a></li>
			</ul>
    </div>
		
		<div id="footer">
			<p class="right">&copy; 2009 <a href="#">WIT-NCM</a></p>
			<p><a href="#">�人���̴�ѧ-���ײ����������մ��о����ģ�WIT-NCM��</a> ��ַ���й�.����.�人.�۳����693�� �ʱࣺ430073<br />
		  </p>
</div>
	</div>
</body>
</html>