package action;

import com.opensymphony.xwork2.Action;
import domain.Cart;
import service.CatalogService;

public class ViewCartAction extends AbstractAction {

    private CatalogService catalogService;

    public String viewCart() {
        try {
            Cart cart = (Cart) session.get("cart");
            if (cart == null) {
                cart = new Cart();
                session.put("cart", cart);
            }
            return "VIEW_CART";
        }catch (Exception e){e.printStackTrace();}
        return ERROR;
    }
}
