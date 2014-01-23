<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.io.*,java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<html>
<style type="text/css">
<!--
body,td,th {
	font-size: 14px;
}
a {
	font-size: 14px;
	color: #000;
}
a:hover {
	color: #CCC;
	text-decoration: none;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
<head>
<title>Welcome to Wuhan Institute of Technology</title>
</head>
<body topmargin="2">
<%
	java.util.Date tt=new java.util.Date();
	int y=tt.getYear()+1900;
	int m=tt.getMonth()+1;
	int d=tt.getDate();
%>
<table width="980" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#000000">
  <tr>
    <td width="980" valign="top" bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/head.jpg" width="980" height="100"></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <tr>
              <td width="471" align="center" valign="top"><table width="96%" border="0" cellspacing="0">
                <tr>
                  <td width="42%" height="20">TODAY IS:<%=y%>-<%=m%>-<%=d%></td>
                  <td width="42%" height="20" rowspan="2">&nbsp;</td>
                  </tr>
                <tr>
                  <td height="20"><a href="index.jsp">CHINESE VERSION</a></td>
                  </tr>
                <tr>
                  <td height="40" colspan="2"><strong>Welcome to Nano and Ceramic Materials Research Center</strong></td>
                </tr>
                <tr>
                  <td colspan="2"><p>We focus on the R&amp;D of boron nitride nanotubes (BNNTs) and related composite materials for engineering applications. We are also sourcing industrial technology for production of BNNTs and advanced ceramic nanomaterials. </p>
<p>For more information: <a href="index.jsp">CHINESE VERSION</a></p></td>
                  </tr>
                <tr>
                  <td height="22" colspan="2"><hr></td>
                </tr>
                <tr>
                  <td height="40" colspan="2"><strong>Production of Boron Nitride Nanotubes</strong></td>
                  </tr>
                <tr>
                  <td><img src="images/chanpin/IMG_1091.JPG" width="200" height="150"></td>
                  <td><img src="images/chanpin/029-1.jpg" width="200" height="150"></td>
                </tr>
                <tr>
                  <td height="35">Precursor </td>
                  <td>BNNTs</td>
                </tr>
                <tr>
                  <td height="100" colspan="2">We produce boron nitride nanotubes in high yield and large quantities through annealing boron-containing precursors. The method can produce multi-walled BN nanotubes with different tubular structures and different sizes, i.e. cylindrical, bamboo and  fabric types with different length, diameter and thickness. </td>
                </tr>
                </table></td>
              <td width="509" align="center" valign="top"><table width="98%"  border="0" align="center" cellpadding="2" cellspacing="2">
                <tr>
                  <td height="35" colspan="3"><strong>Powder Boron Nitride Nanotubes Available</strong></td>
                </tr>
                <tr>
                  <td width="52%" colspan="3"><img src="images/chanpin/IMG_1155.JPG" width="162" height="125"></td>
                </tr>
                <tr>
                  <td height="24" colspan="3"><p>Synonyms: BNNT, BN nanotubes, BN-NT<br>
                    CAS Number: 10043-11-5 <br>
                    Chemical Compositions:<br>
                    &gt; 98.5 wt. % of BN, containing &gt; 80 wt. % of BNNTs.<br>
                    Impurities: absorbed water, B2O3, metal catalysts.<br>
                    Description: <br>
                    Boron nitride nanotubes have similar atomic structure as carbon nanotubes but have many interesting properties including a more stable electronic property and better resistance to oxidation at high temperatures. <br>
                    Possible Applications: <br>
                    1) Far more resistant to oxidation than carbon and therefore suited for high temperature applications in which carbon nanostructures would burn.<br>
                    2) BNNTs are expected to be semiconducting, with predictable electronic properties that are independent of tube diameter and number of layers, unlike tubes made of carbon. <br>
                    Safety Notice: <br>
                    Before using, user shall determine the suitability of the product for its intended use, and user assumes all risk and liability whatsoever in connection therewith. <br>
                    Availability:<br>
                    1) Two weeks after acceptance of your order (Fax or E-mail).<br>
                    2) More than 1 kg  presently only made to customer specification.<br>
                    Packaging: <br>
                    1 gram, 5 grams, 1 kilogram.</p></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="20" align="center" valign="middle">&nbsp;</td>
        </tr>
        <tr bgcolor="#CCCCCC"> 
          <td height="60" align="center" valign="middle">Nano and Ceramic Materials Research Center, Wuhan Institute of Technology<br>
            Address: 693 Xiongchu Avenue, Wuhan, Hubei, P. R. China, Postcode: 430073<br>
          Tel. &amp; Fax: +86-27-87193199, E-mail: bnnt@mail.wit.edu.cn</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
