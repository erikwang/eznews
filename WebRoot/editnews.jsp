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
					<p>纳米材料与新型陶瓷研究中心&gt;&gt;&gt;新闻中心&gt;&gt;&gt;修改新闻</p>
				</div>
			</div>				
		  <div class="subheader">
<form action="servlet/SaveNewsServlet"  method="post" enctype="multipart/form-data">
<table width="80%" border="0">
  <tr>
    <td height="30">新闻ID</td>
    <td height="30"><input name="tfsn" type="text" value="<%=thenews.getSn()%>" readonly="readonly"/></td>
  </tr>
  <tr>
    <td height="30">新闻标题</td>
    <td height="30"><label>
      <input type="text" name="tftitle" value="<%=new NewsText().conversion(thenews.getTitle())%>"/>
    </label></td>
  </tr>
  <tr>
    <td height="30">新闻分类</td>
    <td height="30"><select name="newstype" id="newstype">
      <option value="null" selected="selected">--选择分类--</option>
          <option value="1">招生信息</option>
          <option value="2">产品展示</option>
          <option value="3">实验室</option>
          <option value="4">合作项目</option>
          <option value="5">相关信息</option>
          <option value="6">相关链接</option>
          <option value="7">联系方式</option>
    </select></td>
  </tr>
  <tr>
    <td height="30">作者</td>
    <td height="30"><input type="text" name="tfauthor" value="<%=new NewsText().conversion(thenews.getAuthor())%>"/></td>
  </tr>
  <tr>
    <td height="30">新闻内容</td>
   <td height="30">
    <textarea name="tfmain" class="wymeditor">
    <%=(new NewsText().edesortString(str))%>
    </textarea>
    </td>
  </tr> 
  <tr>
    <td rowspan="5">修改图片</td>
    <td height="30">第一张图片：<input type="file" name="fimg" />
    这里的图片将自动显示在新闻上</td>
  </tr>
  <tr>
    <td height="30">请将下列文本框中代码复制到增加图片<img src="HtmlEditor/images/19.gif" width="21" height="20" />中：</td>
  </tr>
  <tr>
    <td height="30">第二张图片：<input type="file" name="fimga1" />
      <input name="imgdrv2" type="text" id="imgdrv2" value="./servlet/GetAimg1?tfimgid=<%=sn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="30">第三张图片：<input type="file" name="fimga2" />
      <input name="imgdrv3" type="text" id="imgdrv3" value="./servlet/GetAimg2?tfimgid=<%=sn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="30">第四张图片：<input type="file" name="fimga3" />
      <input name="imgdrv4" type="text" id="imgdrv4" value="./servlet/GetAimg3?tfimgid=<%=sn%>" size="30" /></td>
  </tr>
  <tr>
    <td height="30">范围</td>
    <td height="30"><label>
      <select name="sescope">
        <option value="all">全部</option>
        <option value="in">校内</option>
      </select>
    <%=thenews.getVisitorscope()%></label></td>
  </tr>
  <tr>
    <td height="30"><label>
      <input type="submit" name="Submit" class="wymupdate" alue="编辑新闻" />
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