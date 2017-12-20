<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<style type='text/css'>
div#wrapper {
    margin: 0 auto;
    padding: 5px 5px 5px 5px;
    border: 0;
    width: 1134px;
    text-align: left;
    background: #64B1FF;
}
.header_menu{
	width:1120px;
	
}
.context{
	width:1110px;
	margin:5px;
	padding:5px 5px 5px 5px;
	background:#FFF;
}

</style>
<body>
	<div id='wrapper'>
    	<div class='header_menu'>
    		<jsp:include page="Header.jsp"/>
    	</div>
		<div class='context' align="center">	
        	<jsp:include page='wc.jsp'/>
            </div >	
        </div> 
    </div>
</body>
</html>