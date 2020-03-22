<div id="Content"><h3>Account Information</h3>
	<table>
		<tr>
			<td>First name:</td>
			<td>
				<input type="text" name="account.firstName" value=<s:property value="#session.account.firstName"/> />
			</td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td>
				<input type="text" name="account.lastName" value=<s:property value="#session.account.lastName"/> />
			</td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input type="text" size="40" name="account.email" value=<s:property value="#session.account.email"/> /></td>
		</tr>
		<tr>
			<td>Phone:</td>
			<td><input type="text" name="account.phone" value=<s:property value="#session.account.phone"/> /></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><input type="text" size="40" name="account.address1" value=<s:property value="#session.account.address1"/> /></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><input type="text" size="40" name="account.address2" value=<s:property value="#session.account.address2"/> /></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><input type="text" name="account.city" value=<s:property value= "#session.account.city"/> /></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><input type="text" size="4" name="account.state" value=<s:property value="#session.account.state"/> /></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><input type="text" size="10" name="account.zip" value=<s:property value="#session.account.zip"/> /></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><input type="text" size="15" name="account.country" value=<s:property value="#session.account.country"/> /></td>
		</tr>
	</table>

	<h3>Profile Information</h3>

	<table>
		<tr>
			<td>Language Preference:</td>
			<td>
				<select name="account.languagePreference" id="languagePreference">
					<option value="english" <s:if test="#session.account.languagePreference=='english'"> selected="selected"</s:if>>english</option>
					<option value="japanese" <s:if test="#session.account.languagePreference=='japanese'"> selected="selected"</s:if>>japanese</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Favourite Category:</td>
			<td>
				<select name="account.favouriteCategoryId" id="favouriteCategoryId">
					<option value="FISH" <s:if test="#session.account.favouriteCategoryId=='FISH'"> selected="selected"</s:if>>FISH</option>
					<option value="DOGS" <s:if test="#session.account.favouriteCategoryId=='DOGS'"> selected="selected"</s:if>>DOGS</option>
					<option value="REPTILES" <s:if test="#session.account.favouriteCategoryId=='REPTILES'"> selected="selected"</s:if>>REPTILES</option>
					<option value="CATS" <s:if test="#session.account.favouriteCategoryId=='CATS'"> selected="selected"</s:if>>CATS</option>
					<option value="BIRDS" <s:if test="#session.account.favouriteCategoryId=='BIRDS'"> selected="selected"</s:if>>BIRDS</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Enable MyList</td>
			<td><input type="checkbox" name="account.listOption" value=<s:if test="#session.account.listOption"/> /></td>
		</tr>
		<tr>
			<td>Enable MyBanner</td>
			<td><input type="checkbox" name="account.bannerOption" value=<s:if test="#session.account.bannerOption"/>/></td>
		</tr>

	</table>
</div>