<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="Catalog">
	<form action="newAccount" method="post" name="registerForm">


	<h3>User Information</h3>

	<table>
		<tr>
			<td>User ID:</td>
			<td><input type="text" name="account.username" onblur="usernameIsExist();" />
			<div id="usernameMsg"></div>
				<script type="text/javascript" src="../register.js"></script>
			</td>
		</tr>
		<tr>
			<td>New password:</td>
			<td><input type="password" name="account.password" /></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input type="password" name="repeatedPassword" /></td>
		</tr>
	</table>

	<%@ include file="IncludeAccountFields.jsp"%>
		<input type="submit" name="newAccount" value="Save Account Information"/>

	</form>

</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>