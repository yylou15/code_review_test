package dao;

import domain.Category;

import java.util.List;


public interface CategoryDAO
{
    //Select All Categories
    List<Category> getCategoryList();

    //Select a Category By ID
    Category getCategory(String categoryId);
}
