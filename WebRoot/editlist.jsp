<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	<title>WIT-NCM</title>
</head>
<body>
<%
	String str;
	String sn = "";
	GetNews gn = new GetNews();
	Tdnews lthenews;
	List<Object> nl1;
	nl1 = gn.getNewsList("");
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
					<p>���ײ����������մ��о�����&gt;&gt;&gt;��������&gt;&gt;&gt;&nbsp;���Ź���</p>
				</div>
			</div>				
		  <div class="left_articles">
<%
	out.println("<table width='100%' cellspacing='10'>");
	out.println("<tr>");
  	out.println("<td>"+"����ID"+"</td>");
  	out.println("<td>"+"���ű���"+"</td>");
	out.println("<td>"+"���ŷ���"+"</td>");
  	out.println("<td>"+"����"+"</td>");
  	out.println("<td>"+"����ʱ��"+"</td>");
  	out.println("<td>"+"��ʾ��Χ"+"</td>");
  	out.println("<td>"+"�޸�"+"</td>");
	out.println("<td>"+"ɾ��"+"</td>");
	out.println("</tr>");
	for(int t=0;t<nl1.size();t++){
	lthenews = (Tdnews)nl1.get(t);
	String news_type = (new NewsText().conversion(lthenews.getNewstype()));
	out.println("<tr bgcolor='#EEEEEE'>");
	out.println("<td>"+lthenews.getSn()+"</td>");
	out.println("<td>"+"<a href = shownews.jsp?tfimgid="+lthenews.getSn()+">"+new NewsText().conversion(lthenews.getTitle())+"</a>"+"</td>");
	if (news_type.equals("1")){
		out.println("<td>"+"������Ϣ"+"</td>");
		}
	if (news_type.equals("2")){
		out.println("<td>"+"��Ʒչʾ"+"</td>");
		}
	if (news_type.equals("3")){
		out.println("<td>"+"ʵ����"+"</td>");
		}
	if (news_type.equals("4")){
		out.println("<td>"+"������Ŀ"+"</td>");
		}
	if (news_type.equals("5")){
		out.println("<td>"+"�����Ϣ"+"</td>");
		}
	if (news_type.equals("6")){
		out.println("<td>"+"�������"+"</td>");
		}
	if (news_type.equals("7")){
		out.println("<td>"+"��ϵ��ʽ"+"</td>");
		}
	out.println("<td>"+new NewsText().conversion(lthenews.getAuthor())+"</td>");
	out.println("<td>"+lthenews.getCdate()+"</td>");
	out.println("<td>"+lthenews.getVisitorscope()+"</td>");
	out.println("<td>"+"<a href = editnews.jsp?tfimgid="+lthenews.getSn()+">"+"�޸�"+"</a>"+"</td>");
	out.println("<td>"+"<a href = servlet/DeleteServlet?sn="+lthenews.getSn()+"&type=n"+">"+"ɾ��"+"</a>"+"</td>");
	out.println("</tr>");
	}
	out.println("</table>");
	out.println("<a href = addnews.jsp>"+"�������"+"</a>");
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