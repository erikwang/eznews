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
					<p>���ײ����������մ��о�����&gt;&gt;&gt;
					<%
					String news_type = (new NewsText().conversion(thenews.getNewstype()));
					if (news_type.equals("1")){
						out.println("������Ϣ");
					}
					if (news_type.equals("2")){
						out.println("��Ʒչʾ");
					}
					if (news_type.equals("3")){
						out.println("ʵ����");
					}
					if (news_type.equals("4")){
						out.println("������Ŀ");
					}
					if (news_type.equals("5")){
						out.println("�����Ϣ");
					}
					if (news_type.equals("6")){
						out.println("�������");
					}
					if (news_type.equals("7")){
						out.println("��ϵ��ʽ");
					}
					%>
                    &gt;&gt;&gt;&nbsp;<%=new NewsText().conversion(thenews.getTitle())%></p>
				</div>
			</div>				
		  <div class="left_articles">
				<h2><%=new NewsText().conversion(thenews.getTitle())%></h2>
		    <p class="date">����ʱ�䣺<%=thenews.getCdate()%> ����������<%=thenews.getCount()%>�� ��Դ��<%=new NewsText().conversion(thenews.getAuthor())%></p>
    		<p>
			<%
				if(thenews.getImg().length() < 1){
    			out.println("û�����ͼƬ");
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
            	<li><a href="english.jsp">��&nbsp;&nbsp;English</a></li>
                <li><a href="index.jsp">��&nbsp;&nbsp;��ҳ</a></li>
				<li><a href="shownews.jsp?tfimgid=1">��&nbsp;&nbsp;������Ϣ</a></li>
				<li><a href="shownews.jsp?tfimgid=2">��&nbsp;&nbsp;��Ʒչʾ</a></li>
                <li><a href="shownews.jsp?tfimgid=3">��&nbsp;&nbsp;ʵ����</a></li>
                <li><a href="more.jsp?newstype=4">��&nbsp;&nbsp;������Ŀ</a></li>
                <li><a href="more.jsp?newstype=5">��&nbsp;&nbsp;�����Ϣ</a></li>
                <li><a href="file.jsp">��&nbsp;&nbsp;����</a></li>
                <li><a href="http://mse.wit.edu.cn/" target="_blank">��&nbsp;&nbsp;����ѧԺ</a></li>
                <li><a href="http://mep.wit.edu.cn/" target="_blank">��&nbsp;&nbsp;��ҩѧԺ</a></li>
                <li><a href="shownews.jsp?tfimgid=4">��&nbsp;&nbsp;�������</a></li>
                <li><a href="shownews.jsp?tfimgid=5">��&nbsp;&nbsp;��ϵ��ʽ</a></li>
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