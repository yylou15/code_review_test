<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="Catalog">

	<form action="confirmOrder" method="post">

		<table>
			<tr>
				<th colspan=2>Payment Details</th>
			</tr>
			<tr>
				<td>Card Type:</td>
				<td>
					<select name="cardType">
						<s:iterator value="#session.creditCardTypes" >
							<option selected="selected" value="Visa">Visa</option>
							<option value="MasterCard">MasterCard</option>
							<option value="American Express">American Express</option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr>
				<td>Card Number:</td>
				<td>
					<input type="text" name="order.creditCard" value="<s:property value="#session.order.creditCard"/>">
					* Use a fake number!
				</td>
			</tr>
			<tr>
				<td>Expiry Date (MM/YYYY):</td>
				<td>
					<input type="text" name="order.expiryDate" value="<s:property value="#session.order.expiryDate"/>">
				</td>
			</tr>
			<tr>
				<th colspan=2>Billing Address</th>
			</tr>

			<tr>
				<td>First name:</td>
				<td>
					<input type="text" name="order.firstName" value="<s:property value="#session.order.billToFirstName"/>">
				</td>
			</tr>
			<tr>
				<td>Last name:</td>
				<td>
					<input type="text" name="order.lastName" value="<s:property value="#session.order.billToLastName"/>">
				</td>
			</tr>
			<tr>
				<td>Address 1:</td>
				<td>
					<input type="text" name="order.address1" value="<s:property value="#session.order.billAddress1"/>">
				</td>
			</tr>
			<tr>
				<td>Address 2:</td>
				<td>
					<input type="text" name="order.address2" value="<s:property value="#session.order.billAddress2"/>">
				</td>
			</tr>
			<tr>
				<td>City:</td>
				<td>
					<input type="text" name="order.city" value="<s:property value="#session.order.billCity"/>">
				</td>
			</tr>
			<tr>
				<td>State:</td>
				<td>
					<input type="text" name="order.state" value="<s:property value="#session.order.billState"/>">
				</td>
			</tr>
			<tr>
				<td>Zip:</td>
				<td>
					<input type="text" name="order.zip" value="<s:property value="#session.order.billZip"/>">
				</td>
			</tr>
			<tr>
				<td>Country:</td>
				<td>
					<input type="text" name="order.country" value="<s:property value="#session.order.billCountry"/>">
				</td>
			</tr>

			<tr>
				<td colspan=2>
					<input type="checkbox" name="shippingAddressRequired" value="shippingAddressRequired">
					Ship to different address...
				</td>
			</tr>

		</table>

		<input type="submit" value="Continue">

	</form>
</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>