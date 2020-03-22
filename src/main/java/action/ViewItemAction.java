package action;


import domain.Item;
import domain.Product;
import service.CatalogService;

public class ViewItemAction extends AbstractAction{
    private String itemId;
    private Item item;
    private Product product;
    private CatalogService catalogService;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String execute() throws Exception {
        catalogService = new CatalogService();

        item = catalogService.getItem(itemId);
        item.setQuantity(catalogService.getItemQuantity(itemId));

        product = catalogService.getProduct(item.getProduct().getProductId());

        session.put("product",product);

        return SUCCESS;
    }
}
