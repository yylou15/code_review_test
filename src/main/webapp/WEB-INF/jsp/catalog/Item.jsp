<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="BackLink">

	<a href="<s:url action="viewProduct">
	<s:param name="productId">
	<s:property value="#session.product.productId"/>
</s:param>
</s:url> ">
		Return to
		<s:property value="#session.product.productId"/>
	</a>
</div>



<div id="Catalog">

<table>
	<tr>
		<td><s:property value="#session.product.description" escapeHtml="false"/></td>
	</tr>
	<tr>
		<td><b><s:property value="item.itemId"/></b></td>
	</tr>
	<tr>
		<td><b><font size="4">
			<s:property value="item.attribute1"/>
			<s:property value="item.attribute2"/><s:property value="item.attribute3"/>
			<s:property value="item.attribute4"/><s:property value="item.attribute5"/>
			<s:property value="#session.product.name"/> </font></b></td>
	</tr>
	<tr>
		<td>
			<s:property value="#session.product.name"/>
		</td>
	</tr>
	<tr>
		<td>
			<s:if test="item.quantity <= 0">
				Back ordered.
			</s:if>
			<s:if test="item.quantity > 0">
				<s:property value="item.quantity"/> in stock.
			</s:if>
		</td>
	</tr>
	<tr>
		<td>
			<s:property value="item.formatListPrice()"/>
		</td>
	</tr>

	<tr>
		<td>
			<a class="Button" href="<s:url action="addItemToCart">
							<s:param name="workingItemId"><s:property value="itemId"/></s:param>
					</s:url>">
				Add to Cart
			</a>
		</td>
	</tr>
</table>

</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>



