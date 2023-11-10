package com.khy.pojo;

public class Goods {

    private Integer goodsId;
    private String goodsName;
    private String goodsDescribe;
    private String goodsMoney;
    private String goodsNumber;
    private String inCar;



    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsDescribe() {
        return goodsDescribe;
    }

    public void setGoodsDescribe(String goodsDescribe) {
        this.goodsDescribe = goodsDescribe;
    }

    public String getGoodsMoney() {
        return goodsMoney;
    }

    public void setGoodsMoney(String goodsMoney) {
        this.goodsMoney = goodsMoney;
    }

    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public String getInCar() {
        return inCar;
    }

    public void setInCar(String inCar) {
        this.inCar = inCar;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", goodsDescribe='" + goodsDescribe + '\'' +
                ", goodsMoney='" + goodsMoney + '\'' +
                ", goodsNumber='" + goodsNumber + '\'' +
                ", inCar='" + inCar + '\'' +
                '}';
    }


}
