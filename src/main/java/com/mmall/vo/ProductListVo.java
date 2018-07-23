package com.mmall.vo;

import java.math.BigDecimal;

public class ProductListVo {
    private Integer id;

    private Integer categoryId;

    private String name;

    private String subtitle;

    private String mainImage;

    private String[] subImage;

    private BigDecimal price;

    private Integer stock;

    private Integer indexStatus;

    private Integer status;

    private String imageHost;

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public String[] getSubImage() {
        return subImage;
    }

    public void setSubImage(String[] subImage) {
        this.subImage = subImage;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getIndexStatus() {
        return indexStatus;
    }

    public void setIndexStatus(Integer indexStatus) {
        this.indexStatus = indexStatus;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getImageHost() {
        return imageHost;
    }

    public void setImageHost(String imageHost) {
        this.imageHost = imageHost;
    }
}
