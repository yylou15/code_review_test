<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="BackLink">
<a href="main">Return to Main Menu</a>
</div>

<div id="Catalog">

<div id="Cart">

<h2>Shopping Cart</h2>
	<script type="text/javascript" src="../cart.js"></script>


	<form action="updateCartQuantities" method="post" name="cartForm">
	<table id="cartTable">
		<thead>
		<tr>
			<th><b>Item ID</b></th>
			<th><b>Product ID</b></th>
			<th><b>Description</b></th>
			<th><b>In Stock?</b></th>
			<th><b>Quantity</b></th>
			<th><b>List Price</b></th>
			<th><b>Total Cost</b></th>
			<th>&nbsp;</th>
		</tr>
		</thead>

		<tbody>
		<s:if test="#session.cart.numberOfItems == 0">
			<tr>
				<td colspan="8"><b>Your cart is empty.</b></td>
			</tr>
		</s:if>

		<s:iterator value="#session.cart.cartItems">
			<tr>
				<td>

					<a href=" <s:url action="viewItem">
					<s:param><s:property value="item.itemId" /></s:param>
					</s:url> ">
							<s:property value="item.itemId"/>
					</a>

				</td>

				<td>
					<s:property value="item.product.productId"/>
				</td>
				<td>
					<s:property value="item.attribute1"/><s:property value="item.attribute2"/>
					<s:property value="item.attribute3"/><s:property value="item.attribute4"/>
					<s:property value="item.attribute5"/><s:property value="item.product.name"/>
				</td>
				<td>
					<s:property value="inStock"/>
				</td>
				<td>
					<input type="number" id="<s:property value="item.itemId"/>" value="<s:property value="quantity"/>" >

				</td>
				<td>
					<s:property value="item.formatListPrice()"/>
				</td>
				<td>
					<s:property value="total"/>
				</td>
				<td>
					<a href="<s:url action="removeItemFromCart"><s:param><s:property value="item.itemId" /></s:param>
					</s:url>" class="Button">Remove</a>
				</td>
			</tr>
		</s:iterator>
		</tbody>

		<tr>
			<td colspan="7" id="subTotal">
			SubTotal:<s:property value="#session.cart.formatSubTotal()"/>
				<input type="submit" value="Update Cart">
		</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	</form>




	<s:if test="#session.cart.numberOfItems > 0">

		<a href="newOrderForm"  class="Button">Proceed to Checkout</a>
</s:if>

</div>


<div id="Separator">&nbsp;</div>
</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>