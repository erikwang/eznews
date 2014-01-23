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
					<p>纳米材料与新型陶瓷研究中心&gt;&gt;&gt;新闻中心&gt;&gt;&gt;&nbsp;共享下载</p>
				</div>
			</div>				
		  <div class="left_articles">
	<%
	out.println("<table width='100%' cellspacing='10'>");
	out.println("<tr>");
  	out.println("<td>"+"文件说明"+"</td>");
  	out.println("<td>"+"上传路径"+"</td>");
  	out.println("<td>"+"发布时间"+"</td>");
  	out.println("<td>"+"文件大小"+"</td>");
	out.println("</tr>");
	for(int t=0;t<nl1.size();t++){
	lthenews = (Tdfiles)nl1.get(t);
	out.println("<tr bgcolor='#EEEEEE'>");
	out.println("<td>"+new NewsText().conversion(lthenews.getFilecomment())+"</td>");
	out.println("<td>"+"<a href=\"upload\\"+lthenews.getFilename()+"\">"+lthenews.getFilename()+"</a>"+"</td>");
	out.println("<td>"+lthenews.getCdate()+"</td>");
	out.println("<td>"+lthenews.getFiletype()+"</td>");
	out.println("</tr>");
	}
	out.println("</table>");
	%>
		  </div>
		</div>	
		
		<div id="right">
			<ul id="side_menu">
            	<li><a href="english.jsp">●&nbsp;&nbsp;English</a></li>
                <li><a href="index.jsp">●&nbsp;&nbsp;首页</a></li>
				<li><a href="shownews.jsp?tfimgid=1">●&nbsp;&nbsp;招生信息</a></li>
				<li><a href="shownews.jsp?tfimgid=2">●&nbsp;&nbsp;产品展示</a></li>
                <li><a href="shownews.jsp?tfimgid=3">●&nbsp;&nbsp;实验室</a></li>
                <li><a href="more.jsp?newstype=4">●&nbsp;&nbsp;合作项目</a></li>
                <li><a href="more.jsp?newstype=5">●&nbsp;&nbsp;相关信息</a></li>
                <li><a href="file.jsp">●&nbsp;&nbsp;下载</a></li>
                <li><a href="http://mse.wit.edu.cn/" target="_blank">●&nbsp;&nbsp;材料学院</a></li>
                <li><a href="http://mep.wit.edu.cn/" target="_blank">●&nbsp;&nbsp;化药学院</a></li>
                <li><a href="shownews.jsp?tfimgid=4">●&nbsp;&nbsp;相关链接</a></li>
                <li><a href="shownews.jsp?tfimgid=5">●&nbsp;&nbsp;联系方式</a></li>
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