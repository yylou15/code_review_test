package service;

import dao.SqlSessionFactoryUtil;
import domain.Category;
import domain.Item;
import domain.Product;
import dao.CategoryDAO;
import dao.ItemDAO;
import dao.ProductDAO;
import org.apache.ibatis.session.SqlSession;


import java.util.List;

public class CatalogService {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
    private ItemDAO itemDAO;
    private SqlSession sqlSession;

    public CatalogService(){
        sqlSession = SqlSessionFactoryUtil.getSqlSessionFactory().openSession(true);
        categoryDAO = sqlSession.getMapper(CategoryDAO.class);
        productDAO = sqlSession.getMapper(ProductDAO.class);
        itemDAO = sqlSession.getMapper(ItemDAO.class);
    }

    public List<Category> getCategoryList() {

        return categoryDAO.getCategoryList();
    }


    public Category getCategory(String categoryId) {
        return categoryDAO.getCategory(categoryId);
    }

    public Product getProduct(String productId) {
        return productDAO.getProduct(productId);
    }

    public List<Product> getProductListByCategory(String categoryId) {
        return productDAO.getProductListByCategory(categoryId);
    }

    // TODO enable using more than one keyword
    public List<Product> searchProductList(String keyword) {
        return productDAO.searchProductList("%" + keyword.toLowerCase() + "%");
    }

    public List<Item> getItemListByProduct(String productId) {
        return itemDAO.getItemListByProduct(productId);
    }

    public Item getItem(String itemId) {
        return itemDAO.getItem(itemId);
    }

    public boolean isItemInStock(String itemId) {
        return itemDAO.getInventoryQuantity(itemId) > 0;
    }

    public int getItemQuantity(String itemId){ return itemDAO.getInventoryQuantity(itemId); }

}
