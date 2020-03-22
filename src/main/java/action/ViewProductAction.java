package action;

import domain.Item;
import domain.Product;
import service.CatalogService;
import com.opensymphony.xwork2.Action;

import java.util.List;

public class ViewProductAction extends AbstractAction {

    private String productId;
    private Product product;
    private List<Item> itemList;
    private CatalogService catalogService;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    @Override
    public String execute() throws Exception {
        catalogService = new CatalogService();
        product = catalogService.getProduct(productId);
        itemList = catalogService.getItemListByProduct(productId);
        session.put("product",product);

        return SUCCESS;
    }
}
