<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	<title>WIT-NCM</title></head>
<body>
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
					<p>���ײ����������մ��о�����&gt;&gt;&gt;��������&gt;&gt;&gt;&nbsp;�ϴ��ļ�</p>
				</div>
			</div>				
		  <div class="subheader">
<form action="servlet/UploadFileServlet" method="post" enctype="multipart/form-data">
<table width="80%" border="1">
  <tr>
    <td><label> 
      <input name="ffile" type="file" id="ffile" />
      <input name="rb1" type="radio" value="r" checked />
      �о�����
      <input name="rb1" type="radio" value="t" />
      ��ѧ����
      <input name="rb1" type="radio" value="e" />
      ����
      <br />
      <textarea name="tffilecomment" cols="100" rows="10" id="tffilecomment"></textarea>
      <br />
      <input type="submit" name="Submit" value="�ϴ��ļ�" />
    </label></td>
  </tr>
</table>
</form>
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