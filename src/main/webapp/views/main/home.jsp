<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="/res/js/common/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/res/js/common/jcl.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$('#ok').click(function(){
				var username = $('#username').val();
				var passwrod = $('#password').val();
				$.ajax({
					url: "index",
					type: "post",
					dataType: "json",
					data :{'username':username,'password':passwrod},
					success:function(data){
						if(data.result.toString() == "success")
						{
						jcl.go("/index.htm");

						}
						else
						{
							alert(data.result);
						}
					}
				});
			});
		});
	</script>

<title>home</title>
</head>
<body>
<h2>spring mvc ÊµÀý</h2>

	username:<input type="text" id="username" />
	<p>
	password:<input type="password" id="password"/>
	<p>
	<input type="submit" id="ok" value="submit" />

<a href="other.html">other page</a>
</body>
</html>