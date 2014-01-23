<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Untitled Document</title>
</head>

<body>
<form action="servlet/SaveNewsServlet"  method="post" enctype="multipart/form-data">
<table width="80%" border="1">
  <tr>
    <td height="30">title</td>
    <td height="30"><label>
      <input type="text" name="tftitle" />
    </label></td>
  </tr>
  <tr>
    <td height="30">auth</td>
    <td height="30"><input type="text" name="tfauthor" /></td>
  </tr>
  <tr>
    <td height="30">main</td>
    <td height="30"><textarea name="tfmain" cols="100" rows="10"></textarea></td>
  </tr>
  <tr>
    <td height="30">img</td>
    <td height="30"><label>
      <input type="file" name="fimg" />
    </label>
    <input type="file" name="fimga1" />
    <input type="file" name="fimga2" />
    <input type="file" name="fimga3" /></td>
  </tr>
  <tr>
    <td height="30">scope</td>
    <td height="30"><label>
      <select name="sescope">
        <option value="all">全部</option>
        <option value="in">校内</option>
      </select>
    </label></td>
  </tr>
  <tr>
    <td height="30" colspan="2"><label>
      <input type="submit" name="Submit" value="Submit" />
    </label>
      <label></label></td>
    </tr>
</table>
</form>
</body>
</html>
