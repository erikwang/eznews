<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="eznews.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	<title>WIT-NCM</title>
	<!-- jQuery library is required, see http://jquery.com/ -->
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
					<p>纳米材料与新型陶瓷研究中心&gt;&gt;&gt;新闻中心&gt;&gt;&gt;&nbsp;添加新闻</p>
				</div>
			</div>				
		  <div class="subheader">
<form action="servlet/SaveNewsServlet"  method="post" enctype="multipart/form-data">
<table width="662" border="0" height="365">
  <tr>
    <td width="120" height="30">新闻标题</td>
    <td height="30"><label>
      <input type="text" name="tftitle" />
    </label></td>
  </tr>
  <tr>
    <td height="30">新闻分类</td>
    <td height="30">
      <label>
        <select name="newstype" id="newstype">
          <option value="null" selected="selected">--选择分类--</option>
          <option value="1">招生信息</option>
          <option value="2">产品展示</option>
          <option value="3">实验室</option>
          <option value="4">合作项目</option>
          <option value="5">相关信息</option>
          <option value="6">相关链接</option>
          <option value="7">联系方式</option>
        </select>
      </label>
</td>
  </tr>
  <tr>
    <td height="30">作者</td>
    <td height="30"><input type="text" name="tfauthor" /></td>
  </tr>
  <tr>
    <td height="30">新闻内容</td>
    <td height="30">
    <textarea name="tfmain" class="wymeditor" width="500"></textarea>
    </td>
  </tr>
  <tr>
    <td rowspan="4">上传图片</td>
    <td height="30">第一张图片：<input type="file" name="fimg" />
      这里的图片将自动显示在新闻上</td>
  </tr>
  <tr>
    <td height="30">第二张图片：<input type="file" name="fimga1" />
      <a href="editlist.jsp">定位图片</a></td>
  </tr>
  <tr>
    <td height="30">第三张图片：<input type="file" name="fimga2" />
      <a href="editlist.jsp">定位图片</a></td>
  </tr>
  <tr>
    <td height="30">第四张图片：<input type="file" name="fimga3" />
      <a href="editlist.jsp">定位图片</a></td>
  </tr>
  <tr>
    <td height="30">范围</td>
    <td height="30"><label>
      <select name="sescope">
        <option value="all">全部</option>
        <option value="in">校内</option>
      </select>
    </label></td>
  </tr>
  <tr>
    <td height="30"><label>
      <input type="submit" name="Submit" value="发布新闻" class="wymupdate"/>
    </label>
	</td>
    <td height="30">&nbsp;</td>
    </tr>
</table>
</form>		  </div>
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