package action;


import domain.Cart;
import domain.Item;
import service.CatalogService;

import java.math.BigDecimal;

public class AddItemToCartAction extends AbstractAction {
    private String workingItemId;
    private Cart cart;
    BigDecimal subTotal;
    private CatalogService catalogService;

    public String getWorkingItemId() {
        return workingItemId;
    }

    public void setWorkingItemId(String workingItemId) {
        this.workingItemId = workingItemId;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public BigDecimal getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(BigDecimal subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public String execute() throws Exception {

        cart=(Cart) session.get("cart");
        if(cart==null)
        {
            cart = new Cart();
        }
        if(cart.containsItemId(workingItemId))
        {
            cart.incrementQuantityByItemId(workingItemId);
        }
        else
        {
            catalogService = new CatalogService();
            boolean isInStock = catalogService.isItemInStock(workingItemId);
            Item item = catalogService.getItem(workingItemId);
            cart.addItem(item,isInStock);
        }
        subTotal = cart.getSubTotal();

        session.put("cart",cart);
        session.put("subTotal",subTotal);
        return SUCCESS;
    }
}
