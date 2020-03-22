<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="Catalog">
	<form action="confirmEdit?username=<s:property value="#session.account.username"/>" method="post">

	<h3>User Information</h3>

	<table>
		<tr>
			<td>User ID:</td>
			<td><s:property value="#session.account.username"/></td>
		</tr>
		<tr>
			<td>New password:</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input type="password" name="repeatedPassword" /></td>
		</tr>
	</table>
	<%@ include file="IncludeAccountFields.jsp"%>

		<input type="submit" name="editAccount" value="Save Account Information" />
	</form>
		<a href="orderList">My Orders</a>
</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>
