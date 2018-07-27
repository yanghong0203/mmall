package com.mmall.service;

import com.mmall.common.ServerResponse;
import com.mmall.pojo.Category;

import java.util.List;

public interface ICategoryService {

    ServerResponse addCategory(String categoryName);

    ServerResponse updateCategory(Category category);

    ServerResponse<List<Category>> getChildenParallelCategory(Integer categoryId);

    ServerResponse<List<Integer>> selectCategoryAndChildenById(Integer categoryId);

    ServerResponse<List<Category>> getAllCategory();

    ServerResponse<List<Category>> getCategory(Integer categoryId);
}
