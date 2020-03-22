package action;


import domain.Product;
import service.CatalogService;

import java.util.List;

public class SearchProductsAction extends AbstractAction {

    private String keyword;
    private CatalogService catalogService;
    private List<Product> productList;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String execute() throws Exception {

        catalogService = new CatalogService();
        productList = catalogService.searchProductList(keyword);

        session.put("searchProductList",productList);

        return SUCCESS;
    }
}
