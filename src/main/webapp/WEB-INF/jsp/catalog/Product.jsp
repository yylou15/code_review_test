<%@ include file="../common/IncludeTop.jsp"%>

<div id="Content">
<div id="BackLink">
	<a href="<s:url action="viewCategory">
		<s:param name="categoryId">
		<s:property value="#session.product.categoryId"/>
		</s:param>
		</s:url>">
		Return to <s:property value="#session.product.categoryId"/>
	</a>
</div>


<div id="Catalog">

<h2><s:property value="#session.product.name"/></h2>

<table>
	<tr>
		<th>Item ID</th>
		<th>Product ID</th>
		<th>Description</th>
		<th>List Price</th>
		<th>&nbsp;</th>
	</tr>
	<s:iterator value="itemList">
		<tr>
			<td>
				<a href="<s:url action="viewItem">
							<s:param name="itemId"><s:property value="itemId"/></s:param>
						</s:url>">
					<s:property value="itemId"/>
				</a>
			</td>
			<td>
				<s:property value="#session.product.productId"/>
			</td>
			<td>
				<s:property value="attribute1"/> <s:property value="attribute2"/> <s:property value="attribute3"/>
				<s:property value="attribute4"/> <s:property value="attribute5"/> <s:property value="product.name"/>
			</td>
			<td>
				<s:property value="formatListPrice()"/>
			</td>
			<td>
				<a class="Button" href="<s:url action="addItemToCart">
							<s:param name="workingItemId"><s:property value="itemId"/></s:param>
					</s:url>">
					Add to Cart
				</a>
			</td>
		</tr>
	</s:iterator>
	<tr>
		<td>
		</td>
	</tr>
</table>

</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>





