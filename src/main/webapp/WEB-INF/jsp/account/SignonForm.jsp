<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="Catalog">
	<script type="text/javascript">
	function change_yanzhengma()
	{
	document.getElementById("checkcode_img").src = "checkcode.jsp?" + new Date().getTime();
	}
	</script>
<form action="login" method="post">

	<p>Please enter your username and password.</p>
	<p>
		Username:
		<input type="text" name="username"  value="j2ee"/> <br />
		Password:
		<input type="password" name="password"  value="j2ee"/><br/>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img alt="refresh" src="../checkcode.jsp" border="0" id="checkcode_img" onClick="change_yanzhengma();" />
		<br/>
		Checkcode:
		<input type="text" name="userCode" id="userCode"/>

		<br/>
	</p>

		<input type="submit" name="signon" value="Login">

</form>

	Need a user name and password?
	<a href="register">Register Now!</a>

</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>

