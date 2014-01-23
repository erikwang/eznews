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
					<p>纳米材料与新型陶瓷研究中心&gt;&gt;&gt;新闻中心&gt;&gt;&gt;&nbsp;新闻管理</p>
				</div>
			</div>				
		  <div class="left_articles">
<%
	out.println("<table width='100%' cellspacing='10'>");
	out.println("<tr>");
  	out.println("<td>"+"新闻ID"+"</td>");
  	out.println("<td>"+"新闻标题"+"</td>");
	out.println("<td>"+"新闻分类"+"</td>");
  	out.println("<td>"+"作者"+"</td>");
  	out.println("<td>"+"发布时间"+"</td>");
  	out.println("<td>"+"显示范围"+"</td>");
  	out.println("<td>"+"修改"+"</td>");
	out.println("<td>"+"删除"+"</td>");
	out.println("</tr>");
	for(int t=0;t<nl1.size();t++){
	lthenews = (Tdnews)nl1.get(t);
	String news_type = (new NewsText().conversion(lthenews.getNewstype()));
	out.println("<tr bgcolor='#EEEEEE'>");
	out.println("<td>"+lthenews.getSn()+"</td>");
	out.println("<td>"+"<a href = shownews.jsp?tfimgid="+lthenews.getSn()+">"+new NewsText().conversion(lthenews.getTitle())+"</a>"+"</td>");
	if (news_type.equals("1")){
		out.println("<td>"+"招生信息"+"</td>");
		}
	if (news_type.equals("2")){
		out.println("<td>"+"产品展示"+"</td>");
		}
	if (news_type.equals("3")){
		out.println("<td>"+"实验室"+"</td>");
		}
	if (news_type.equals("4")){
		out.println("<td>"+"合作项目"+"</td>");
		}
	if (news_type.equals("5")){
		out.println("<td>"+"相关信息"+"</td>");
		}
	if (news_type.equals("6")){
		out.println("<td>"+"相关链接"+"</td>");
		}
	if (news_type.equals("7")){
		out.println("<td>"+"联系方式"+"</td>");
		}
	out.println("<td>"+new NewsText().conversion(lthenews.getAuthor())+"</td>");
	out.println("<td>"+lthenews.getCdate()+"</td>");
	out.println("<td>"+lthenews.getVisitorscope()+"</td>");
	out.println("<td>"+"<a href = editnews.jsp?tfimgid="+lthenews.getSn()+">"+"修改"+"</a>"+"</td>");
	out.println("<td>"+"<a href = servlet/DeleteServlet?sn="+lthenews.getSn()+"&type=n"+">"+"删除"+"</a>"+"</td>");
	out.println("</tr>");
	}
	out.println("</table>");
	out.println("<a href = addnews.jsp>"+"添加新闻"+"</a>");
%>
		  </div>
		</div>	
		
		<div id="right">
			<ul id="side_menu">
            	<li><a href="english.jsp">●&nbsp;&nbsp;English</a></li>
                <li><a href="index.jsp">●&nbsp;&nbsp;首页</a></li>
                <li><a href="editlist.jsp">●&nbsp;&nbsp;新闻管理</a></li>
                <li><a href="filelist.jsp">●&nbsp;&nbsp;上传管理</a></li>
			</ul>
    </div>
		
		<div id="footer">
			<p class="right">&copy; 2009 <a href="#">WIT-NCM</a></p>
			<p><a href="#">武汉工程大学-纳米材料与新型陶瓷研究中心（WIT-NCM）</a> 地址：中国.湖北.武汉.雄楚大街693号 邮编：430073<br />
		  </p>
</div>
	</div>
</body>
</html>