package action;

import domain.Account;
import domain.Category;
import domain.Product;
import service.CatalogService;
import com.opensymphony.xwork2.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ViewCategoryAction extends AbstractAction {

    private Account account;
    private CatalogService catalogService;
    private Category category;
    private String categoryId;
    private List<Product> productList;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    @Override
    public String execute() throws Exception{
        catalogService=new CatalogService();
        category=catalogService.getCategory(categoryId);
        productList=catalogService.getProductListByCategory(categoryId);
        session.put("category",category);
        session.put("productList",productList);
       return SUCCESS;
    }

}
