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
    	<div id="header"><a href="http://www.wit.edu.cn">武汉工程大学首页</a>&nbsp;&nbsp;&nbsp;&nbsp;今天是<%=y%>年<%=m%>月<%=d%>日&nbsp;&nbsp;&nbsp;&nbsp;您是第&times;&times;&times;位访问者
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
	      <p>&nbsp;</p>
	      <p><a href="http://www.wit.edu.cn"></a>  用户注册 |  登录 | 留言 | <a href="editlist.jsp">管理入口</a></p>
      </div>
		<div id="left">
          <div>
				<h1>纳米材料与新型陶瓷研究中心<br />
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
                  <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                  <param name="expressinstall" value="Scripts/expressInstall.swf" />
                  <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                  <!--[if !IE]>-->
                  <object type="application/x-shockwave-flash" data="images/20090227.swf" width="241" height="142">
                    <!--<![endif]-->
                    <param name="quality" value="high" />
                    <param name="wmode" value="opaque" />
                    <param name="swfversion" value="6.0.65.0" />
                    <param name="expressinstall" value="Scripts/expressInstall.swf" />
                    <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                    <div>
                      <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
                    </div>
                    <!--[if !IE]>-->
                  </object>
                  <!--<![endif]-->
                </object></td>
                <td width="69%"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;武汉工程大学纳米材料与新型陶瓷研究中心成立于二零零八年十二月，由我校材料科学与工程学院、化工与制药学院以及湖北省化学工业研究设计院相关部门及科研和工程技术骨干组成的科研创新团队，目前主要研究领域包括：</p>
                  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1) 氮化硼纳米管粉体材料低成本制备及产业化工程技术； </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2) 先进陶瓷材料、高性能透波陶瓷和军工高技术陶瓷材料；              </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(3) 聚合物纳米复合材料，纳塑增强、导热、抗辐射、电磁屏蔽等高分子复合材料；</p>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(4) 金属/无机、金属/有机聚合物纳米复合材料，磁性材料、电磁屏蔽材料； </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(5) 纳米材料的合成与尺寸形状的控制、新型氮化物发光材料和新能源材料。 </p></td>
              </tr>
            </table>
          </div>
		  <div class="thirds">
    <p><b><a href="#" class="title">热门产品：氮化硼纳米管粉体材料</a></b></p>
				<p><img src="images/chanpin/IMG_1155.JPG" width="162" height="125" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/chanpin/029-1.jpg" width="162" height="125" /><br />
			  <p>外观：灰白色粉体，物理和化学性质稳定；
                <br />
                含量：氮化硼>98.5 wt.%，氮化硼纳米管>80 wt.%；<br />
杂质：吸附水、氧化硼、微量金属等；
<br />
结构：六方BN管状结构，形貌特征以及分散状态可控；<br />
用途：用于材料的增强、增韧和改性。</p>
		  </div>
			
			<div class="thirds">
				<p><b><a href="more.jsp?newstype=5" class="title">相关信息</a></b></p>
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
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>