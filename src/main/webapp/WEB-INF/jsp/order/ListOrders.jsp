<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<h2>My Orders</h2>

<table>
	<tr>
		<th>Order ID</th>
		<th>Date</th>
		<th>Total Price</th>
	</tr>

	<s:iterator value="orderList">
		<tr>
			<td>
				<a href="<s:url action="checkOrder">
					<s:param name="orderId"><s:property value="orderId"/></s:param>
				</s:url>">
					<s:property value="orderId"/>
				</a>
			</td>
			<td>
				<s:date name="orderDate" format="yyyy/MM/dd hh:mm:ss"/>
			</td>
			<td>
				<s:property value="formatTotalPrice()"/>
			</td>
		</tr>
	</s:iterator>
</table>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>


