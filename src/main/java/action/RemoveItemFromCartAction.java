package action;

import domain.Cart;
import domain.Item;

import java.math.BigDecimal;

public class RemoveItemFromCartAction extends AbstractAction
{
    private String workingItemId;
    private Cart cart;
    private BigDecimal subTotal;

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
        workingItemId= (String) session.get("workingItemId");
        cart=(Cart)session.get("cart");
        Item item=cart.removeItemById(workingItemId);
        session.put("subTotal",subTotal);
        session.put("cart",cart);
            return SUCCESS;
    }
}
