<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<title>WIT-NCM</title>
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
</head>
<body>
<%
	
	String str;
	String sn = "";
	//String newstype = request.getParameter("newstype");
	
	//String inip = request.getRemoteAddr(); // get current request ip
	/*if (request.getParameter("tfimgid") == null){
		sn = "1";
	}else{
		sn = request.getParameter("tfimgid");
	}*/
	List<Object> nl1;
	GetNews gn = new GetNews();
	Tdnews lthenews;
	//Tdnews thenews = gn.getTdnews(sn,inip);
	String newstype = "5";
	System.out.println("*************");
	nl1 = gn.getNewsList("where newstype = "+newstype);
	System.out.println("*"+nl1.size());
  /**error**********************************/
  /* thenews.getMaintext() == null
	InputStream ins = thenews.getMaintext().getBinaryStream();
	ByteArrayOutputStream   baos   =   new   ByteArrayOutputStream(); 
	int   i=-1; 
	while((i=ins.read())!=-1){
		baos.write(i);
	} 
	str = baos.toString();
	ins.close();*/
%>
<%
	java.util.Date tt=new java.util.Date();
	int y=tt.getYear()+1900;
	int m=tt.getMonth()+1;
	int d=tt.getDate();
%>
<div id="content">
    	<div id="header"><a href="http://www.wit.edu.cn">�人���̴�ѧ��ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;������<%=y%>��<%=m%>��<%=d%>��&nbsp;&nbsp;&nbsp;&nbsp;���ǵ�&times;&times;&times;λ������
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
	      <p><a href="http://www.wit.edu.cn"></a>  �û�ע�� |  ��¼ | ���� | <a href="editlist.jsp">�������</a></p>
      </div>
		<div id="left">
          <div>
				<h1>���ײ����������մ��о�����<br />
				</h1>
            <h3>Nano and Ceramic Materials Research Center</h3>
            <h3><br />
            </h3>
          </div>
          <div class="left_articles">
            <table width="100%" border="0" cellspacing="1">
              <tr>
                <td width="31%"><object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="241" height="142">
                  <param name="movie" value="images/20090227.swf" />
                  <param name="quality" value="high" />
                  <param name="wmode" value="opaque" />
                  <param name="swfversion" value="6.0.65.0" />
                  <!-- �� param ��ǩ��ʾʹ�� Flash Player 6.0 r65 �͸��߰汾���û��������°汾�� Flash Player��������������û���������ʾ���뽫��ɾ���� -->
                  <param name="expressinstall" value="Scripts/expressInstall.swf" />
                  <!-- ��һ�������ǩ���ڷ� IE �����������ʹ�� IECC ����� IE ���ء� -->
                  <!--[if !IE]>-->
                  <object type="application/x-shockwave-flash" data="images/20090227.swf" width="241" height="142">
                    <!--<![endif]-->
                    <param name="quality" value="high" />
                    <param name="wmode" value="opaque" />
                    <param name="swfversion" value="6.0.65.0" />
                    <param name="expressinstall" value="Scripts/expressInstall.swf" />
                    <!-- ��������������������ʾ��ʹ�� Flash Player 6.0 �͸��Ͱ汾���û��� -->
                    <div>
                      <h4>��ҳ���ϵ�������Ҫ���°汾�� Adobe Flash Player��</h4>
                      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="��ȡ Adobe Flash Player" width="112" height="33" /></a></p>
                    </div>
                    <!--[if !IE]>-->
                  </object>
                  <!--<![endif]-->
                </object></td>
                <td width="69%"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�人���̴�ѧ���ײ����������մ��о����ĳ����ڶ��������ʮ���£�����У���Ͽ�ѧ�빤��ѧԺ����������ҩѧԺ�Լ�����ʡ��ѧ��ҵ�о����Ժ��ز��ż����к͹��̼����Ǹ���ɵĿ��д����Ŷӣ�Ŀǰ��Ҫ�о����������</p>
                  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1) ���������׹ܷ�����ϵͳɱ��Ʊ�����ҵ�����̼����� </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2) �Ƚ��մɲ��ϡ�������͸���մɺ;����߼����մɲ��ϣ�              </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(3) �ۺ������׸��ϲ��ϣ�������ǿ�����ȡ������䡢������εȸ߷��Ӹ��ϲ��ϣ�</p>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(4) ����/�޻�������/�л��ۺ������׸��ϲ��ϣ����Բ��ϡ�������β��ϣ� </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(5) ���ײ��ϵĺϳ���ߴ���״�Ŀ��ơ����͵����﷢����Ϻ�����Դ���ϡ� </p></td>
              </tr>
            </table>
          </div>
		  <div class="thirds">
    <p><b><a href="#" class="title">���Ų�Ʒ�����������׹ܷ������</a></b></p>
				<p><img src="images/chanpin/IMG_1155.JPG" width="162" height="125" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/chanpin/029-1.jpg" width="162" height="125" /><br />
			  <p>��ۣ��Ұ�ɫ���壬����ͻ�ѧ�����ȶ���
                <br />
                ������������>98.5 wt.%�����������׹�>80 wt.%��<br />
���ʣ�����ˮ��������΢�������ȣ�
<br />
�ṹ������BN��״�ṹ����ò�����Լ���ɢ״̬�ɿأ�<br />
��;�����ڲ��ϵ���ǿ�����ͺ͸��ԡ�</p>
		  </div>
			
			<div class="thirds">
				<p><b><a href="more.jsp?newstype=5" class="title">�����Ϣ</a></b></p>
<% 
	out.println("<table width='100%' cellspacing='2'>");
	for(int t=0;t<nl1.size();t++){
	lthenews = (Tdnews)nl1.get(t);
	out.println("<tr>");
    out.println("<td>"+"<a href = shownews.jsp?tfimgid="+lthenews.getSn()+">"+new NewsText().conversion(lthenews.getTitle())+"</a>"+"</td>");
	out.println("<td>"+lthenews.getCdate()+"</td>");
	out.println("</tr>");
	}
	out.println("</table>");
%>
<a href="more.jsp?newstype=5"><img src="images/comment.gif" alt="Comment" /></a></p>
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
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>