<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="BackLink">
<a href="main">Return to Main Menu</a>
</div>
<div id="Catalog">

	<table>
		<tr>
			<th align="center" colspan="2">Order #<s:property value="#session.order.orderId"/>
				<s:date name="#session.order.orderDate" format="yyyy/MM/dd hh:mm:ss"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">Payment Details</th>
		</tr>
		<tr>
			<td>Card Type:</td>
			<td><s:property value="#session.order.cardType"/></td>
		</tr>
		<tr>
			<td>Card Number:</td>
			<td><s:property value="#session.order.creditCard"/> * Fake
				number!</td>
		</tr>
		<tr>
			<td>Expiry Date (MM/YYYY):</td>
			<td><s:property value="#session.order.expiryDate"/></td>
		</tr>
		<tr>
			<th colspan="2">Billing Address</th>
		</tr>
		<tr>
			<td>First name:</td>
			<td><s:property value="#session.order.billToFirstName"/></td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td><s:property value="#session.order.billToLastName"/></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><s:property value="#session.order.billAddress1"/></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><s:property value="#session.order.billAddress2"/></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><s:property value="#session.order.billCity"/></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><s:property value="#session.order.billState"/></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><s:property value="#session.order.billZip"/></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><s:property value="#session.order.billCountry"/></td>
		</tr>
		<tr>
			<th colspan="2">Shipping Address</th>
		</tr>
		<tr>
			<td>First name:</td>
			<td><s:property value="#session.order.shipToFirstName"/></td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td><s:property value="#session.order.shipToLastName"/></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><s:property value="#session.order.shipAddress1"/></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><s:property value="#session.order.shipAddress2"/></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><s:property value="#session.order.shipCity"/></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><s:property value="#session.order.shipState"/></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><s:property value="#session.order.shipZip"/></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><s:property value="#session.order.shipCountry"/></td>
		</tr>
		<tr>
			<td>Courier:</td>
			<td><s:property value="#session.order.courier"/></td>
		</tr>
		<tr>
			<td colspan="2">Status: <s:property value="#session.order.status"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<table>
					<tr>
						<th>Item ID</th>
						<th>Description</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Total Cost</th>
					</tr>
					<s:iterator value="#session.lineItems">
						<tr>
							<td>
								<a href="<s:url action="viewItem">
							<s:param name="itemId"><s:property value="itemId"/></s:param>
    					</s:url>">
									<s:property value="itemId"/>
								</a>
							</td>
							<td>
								<s:if test="item != null">
									<s:property value="item.attribute1"/>
									<s:property value="item.attribute2"/>
									<s:property value="item.attribute3"/>
									<s:property value="item.attribute4"/>
									<s:property value="item.attribute5"/>
									<s:property value="item.product.name"/>
								</s:if>
								<s:if test="item == null">
									<i>{description unavailable}</i>
								</s:if>
							</td>
							<td><s:property value="quantity"/></td>
							<td><s:property value="formatUnitPrice()"/></td>
							<td><s:property value="formatTotal()"/></td>
						</tr>
					</s:iterator>
					<tr>
						<th colspan="5">Total: <s:property value="#session.order.formatTotalPrice()"/></th>
					</tr>
				</table>
			</td>
		</tr>

	</table>

</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>
