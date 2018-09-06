package com.mmall.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.mmall.common.ServerResponse;
import com.mmall.dao.CategoryMapper;
import com.mmall.pojo.Category;
import com.mmall.service.ICategoryService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Set;
@Slf4j
@Service("iCategoryService")
public class CategoryServiceImpl implements ICategoryService {

    // private log logger = LoggerFactory.getLogger(CategoryServiceImpl.class);

    @Autowired
    private CategoryMapper categoryMapper;

    public ServerResponse addCategory(String categoryName){
        if (StringUtils.isBlank(categoryName)){
            return ServerResponse.createByErrorMessage("添加品类参数错误");
        }

        Category category = new Category();
        category.setName(categoryName);
        category.setParentId(0);
        category.setStatus(true);  // 这个分类是可用的

        int rowCount = categoryMapper.insert(category);
        if (rowCount > 0){
            return ServerResponse.createBySuccess("添加品类成功");
        }
        return ServerResponse.createByErrorMessage("添加品类失败");
    }

    public ServerResponse updateCategory(Category category){
        if (category.getId() == null ){
            return ServerResponse.createByErrorMessage("更新品类参数错误");
        }
        int rowCount = categoryMapper.updateByPrimaryKeySelective(category);
        if (rowCount > 0){
            return  ServerResponse.createBySuccess("更新品类成功");
        }
        return ServerResponse.createByErrorMessage("更新品类失败");
    }

    public ServerResponse<List<Category>> getChildenParallelCategory(Integer categoryId){
        List<Category> categoryList = categoryMapper.selectCategoryChildenByParentId(categoryId);
        if (CollectionUtils.isEmpty(categoryList)){
            log.info("未找到当前分类的子分类");
        }
        return ServerResponse.createBySuccess(categoryList);
    }

    public ServerResponse<List<Category>> getCategory(Integer categoryId) {
        List<Category> categoryList = Lists.newArrayList();
        if (categoryId == null){
            categoryList = categoryMapper.selectCategory();
            if (CollectionUtils.isEmpty(categoryList)){
                log.info("分类为空");
            }
            return ServerResponse.createBySuccess(categoryList);
        }else {
            Category category = categoryMapper.selectByPrimaryKey(categoryId);
            categoryList.add(category);
            return ServerResponse.createBySuccess(categoryList);
        }
    }
    public ServerResponse<List<Category>> getAllCategory(){
        List<Category> categoryList = categoryMapper.selectCategory();
        if (CollectionUtils.isEmpty(categoryList)){
            log.info("分类为空");
        }
        return ServerResponse.createBySuccess(categoryList);
    }
    // 递归查询本节点的id及孩子节点的id
    public ServerResponse<List<Integer>> selectCategoryAndChildenById(Integer categoryId){
        Set<Category> categorySet = Sets.newHashSet();
        findChildCategory(categorySet,categoryId);

        List<Integer> categoryIdList = Lists.newArrayList();
        if (categoryId != null){
            for (Category categoryItem : categorySet){
                categoryIdList.add(categoryItem.getId());
            }
        }
        return ServerResponse.createBySuccess(categoryIdList);
    }

    // 递归算法，算出子节点
    private Set<Category> findChildCategory(Set<Category> categorySet,Integer categoryId){
        Category category = categoryMapper.selectByPrimaryKey(categoryId);
        if (category != null){
            categorySet.add(category);
        }
        List<Category> categoryList = categoryMapper.selectCategoryChildenByParentId(categoryId);
        for (Category categoryItem : categoryList){
            findChildCategory(categorySet,categoryItem.getId());
        }
        return categorySet;
    }
}
