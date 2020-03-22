<%@ include file="../common/IncludeTop.jsp"%>
<div id="Content">
<div id="BackLink">
<a href="main">	Return to Main Menu</a>
</div>
<div id="Catalog">

<table>
	<tr>
		<th>&nbsp;</th>
		<th>Product ID</th>
		<th>Name</th>
	</tr>
	<s:iterator value="#session.searchProductList">
		<tr>
			<td>
				<a href="<s:url action="viewProduct">
						<s:param name="productId"><s:property value="productId"/></s:param>
					</s:url>">
					<s:property value="description" escapeHtml="false"/>
				</a>
			</td>
			<td>
				<b>
					<a href="<s:url action="viewProduct">
						<s:param name="productId"><s:property value="productId"/></s:param>
					</s:url>">
						<s:property value="productId"/>
					</a>
				</b>
			</td>
			<td><s:property value="name"/></td>
		</tr>
	</s:iterator>
	<tr>
		<td></td>
	</tr>


</table>

</div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>




