<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Untitled Document</title>
</head>

<body> 
<form action="servlet/UploadFileServlet" method="post" enctype="multipart/form-data">
<table width="400" border="1">
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
      <input type="submit" name="Submit" value="Submit" />
    </label></td>
  </tr>
</table>
</form>
</body>
</html>
