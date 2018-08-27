package com.mmall.vo;

import java.math.BigDecimal;
import java.util.List;

public class OrderProductVo {
    private List<OrderItemVo> orderItemVoList;
    private BigDecimal producTotalPrice;
    private String imageHost;

    public List<OrderItemVo> getOrderItemVoList() {
        return orderItemVoList;
    }

    public void setOrderItemVoList(List<OrderItemVo> orderItemVoList) {
        this.orderItemVoList = orderItemVoList;
    }

    public BigDecimal getProducTotalPrice() {
        return producTotalPrice;
    }

    public void setProducTotalPrice(BigDecimal producTotalPrice) {
        this.producTotalPrice = producTotalPrice;
    }

    public String getImageHost() {
        return imageHost;
    }

    public void setImageHost(String imageHost) {
        this.imageHost = imageHost;
    }




}
