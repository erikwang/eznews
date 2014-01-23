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
					<p>纳米材料与新型陶瓷研究中心&gt;&gt;&gt;新闻中心&gt;&gt;&gt;&nbsp;上传文件</p>
				</div>
			</div>				
		  <div class="subheader">
<form action="servlet/UploadFileServlet" method="post" enctype="multipart/form-data">
<table width="80%" border="1">
  <tr>
    <td><label> 
      <input name="ffile" type="file" id="ffile" />
      <input name="rb1" type="radio" value="r" checked />
      研究资料
      <input name="rb1" type="radio" value="t" />
      教学材料
      <input name="rb1" type="radio" value="e" />
      其他
      <br />
      <textarea name="tffilecomment" cols="100" rows="10" id="tffilecomment"></textarea>
      <br />
      <input type="submit" name="Submit" value="上传文件" />
    </label></td>
  </tr>
</table>
</form>
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