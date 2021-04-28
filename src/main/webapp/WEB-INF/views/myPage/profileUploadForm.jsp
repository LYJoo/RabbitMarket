<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
        <style type="text/css"></style>
    </head>
    <body>
        <form action="profileUpload" method="post" enctype="multipart/form-data">
        	<input type="file" name="profilefile" onchange="fileView(this)">
        </form>
    </body>
    <script type="text/javascript">
	    var path = '${path}';
		if(path != ""){
	    	var elem = opener.document.getElementById("editable");
	    	elem.innerHTML = "<img src='${path}' width='150' height='150' id='profileImg' class='${profileName2.oriFilename}?${profileName2.newFileName}'/>";
	    	self.close();
		}
    
	    function fileView(elem) {
			console.log(elem);
			$('form').submit();
		}
    </script>
</html>
