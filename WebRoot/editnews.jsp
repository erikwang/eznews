<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	<title>WIT-NCM</title>
	
<script type="text/javascript" src="./jquery/jquery.js"></script>
<!-- WYMeditor main JS file, minified version -->
<script type="text/javascript" src="./wymeditor/jquery.wymeditor.min.js"></script>

<script type="text/javascript">

/* Here we replace each element with class 'wymeditor'
 * (typically textareas) by a WYMeditor instance.
 * 
 * We could use the 'html' option, to initialize the editor's content.
 * If this option isn't set, the content is retrieved from
 * the element being replaced.
 */

jQuery(function() {
    jQuery('.wymeditor').wymeditor();
});

</script>
	
	
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
					<p>���ײ����������մ��о�����&gt;&gt;&gt;��������&gt;&gt;&gt;�޸�����</p>
				</div>
			</div>				
		  <div class="subheader">
<form action="servlet/SaveNewsServlet"  method="post" enctype="multipart/form-data">
<table width="80%" border="0">
  <tr>
    <td height="30">����ID</td>
    <td height="30"><input name="tfsn" type="text" value="<%=thenews.getSn()%>" readonly="readonly"/></td>
  </tr>
  <tr>
    <td height="30">���ű���</td>
    <td height="30"><label>
      <input type="text" name="tftitle" value="<%=new NewsText().conversion(thenews.getTitle())%>"/>
    </label></td>
  </tr>
  <tr>
    <td height="30">���ŷ���</td>
    <td height="30"><select name="newstype" id="newstype">
      <option value="null" selected="selected">--ѡ�����--</option>
          <option value="1">������Ϣ</option>
          <option value="2">��Ʒչʾ</option>
          <option value="3">ʵ����</option>
          <option value="4">������Ŀ</option>
          <option value="5">�����Ϣ</option>
          <option value="6">�������</option>
          <option value="7">��ϵ��ʽ</option>
    </select></td>
  </tr>
  <tr>
    <td height="30">����</td>
    <td height="30"><input type="text" name="tfauthor" value="<%=new NewsText().conversion(thenews.getAuthor())%>"/></td>
  </tr>
  <tr>
    <td height="30">��������</td>
   <td height="30">
    <textarea name="tfmain" class="wymeditor">
    <%=(new NewsText().edesortString(str))%>
    </textarea>
    </td>
  </tr> 
  <tr>
    <td rowspan="5">�޸�ͼƬ</td>
    <td height="30">��һ��ͼƬ��<input type="file" name="fimg" />
    �����ͼƬ���Զ���ʾ��������</td>
  </tr>
  <tr>
    <td height="30">�뽫�����ı����д��븴�Ƶ�����ͼƬ<img src="HtmlEditor/images/19.gif" width="21" height="20" />�У�</td>
  </tr>
  <tr>
    <td height="30">�ڶ���ͼƬ��<input type="file" name="fimga1" />
      <input name="imgdrv2" type="text" id="imgdrv2" value="./servlet/GetAimg1?tfimgid=<%=sn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="30">������ͼƬ��<input type="file" name="fimga2" />
      <input name="imgdrv3" type="text" id="imgdrv3" value="./servlet/GetAimg2?tfimgid=<%=sn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="30">������ͼƬ��<input type="file" name="fimga3" />
      <input name="imgdrv4" type="text" id="imgdrv4" value="./servlet/GetAimg3?tfimgid=<%=sn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="30">��Χ</td>
    <td height="30"><label>
      <select name="sescope">
        <option value="all">ȫ��</option>
        <option value="in">У��</option>
      </select>
    <%=thenews.getVisitorscope()%></label></td>
  </tr>
  <tr>
    <td height="30"><label>
      <input type="submit" name="Submit" class="wymupdate" alue="�༭����" />
    </label>
	</td>
    <td height="30">&nbsp;</td>
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