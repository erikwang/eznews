<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	<title>WIT-NCM</title>
</head>
<body>
<%
	String str;
	String sn = "";
	String inip = request.getRemoteAddr(); // get current request ip
	if (request.getParameter("tfimgid") == null){
		sn = "1";
	}else{
		sn = request.getParameter("tfimgid");
	}
	List<Object> nl1;
	GetNews gn = new GetNews();
	Tdnews lthenews;
	Tdnews thenews = gn.getTdnews(sn,inip);
	nl1 = gn.getNewsList("");
	InputStream ins = thenews.getMaintext().getBinaryStream();								
	ByteArrayOutputStream   baos   =   new   ByteArrayOutputStream(); 
	int   i=-1; 
	while((i=ins.read())!=-1){
		baos.write(i);
	} 
	str = baos.toString();
	ins.close();
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
					<p>纳米材料与新型陶瓷研究中心&gt;&gt;&gt;
					<%
					String news_type = (new NewsText().conversion(thenews.getNewstype()));
					if (news_type.equals("1")){
						out.println("招生信息");
					}
					if (news_type.equals("2")){
						out.println("产品展示");
					}
					if (news_type.equals("3")){
						out.println("实验室");
					}
					if (news_type.equals("4")){
						out.println("合作项目");
					}
					if (news_type.equals("5")){
						out.println("相关信息");
					}
					if (news_type.equals("6")){
						out.println("相关链接");
					}
					if (news_type.equals("7")){
						out.println("联系方式");
					}
					%>
                    &gt;&gt;&gt;&nbsp;<%=new NewsText().conversion(thenews.getTitle())%></p>
				</div>
			</div>				
		  <div class="left_articles">
				<h2><%=new NewsText().conversion(thenews.getTitle())%></h2>
		    <p class="date">发布时间：<%=thenews.getCdate()%> 被阅览数：<%=thenews.getCount()%>次 来源：<%=new NewsText().conversion(thenews.getAuthor())%></p>
    		<p>
			<%
				if(thenews.getImg().length() < 1){
    			out.println("没有相关图片");
    			}
				else{
    		%>
                <label>
                <img id="test" src="servlet/GetImage?tfimgid=<%=sn%>">
                </label>
    			<%}%>
            </p>
				<p><%=(new NewsText().edesortString(str))%></p>
				</p>
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