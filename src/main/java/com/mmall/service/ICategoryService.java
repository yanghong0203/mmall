package com.mmall.service;

import com.mmall.common.ServerResponse;
import com.mmall.pojo.Category;

import java.util.List;

public interface ICategoryService {

    ServerResponse addCategory(String categoryName);

    ServerResponse updateCategoryName(Integer categoryId,String categoryName);

    ServerResponse<List<Category>> getChildenParallelCategory(Integer categoryId);

    ServerResponse<List<Integer>> selectCategoryAndChildenById(Integer categoryId);

    ServerResponse<List<Category>> getCategory();
}
