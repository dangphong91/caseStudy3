package com.phong.order.model;

public class Order {
    private int id;
    private String date;
    private String account;
    private String nameProduct;
    private int idProduct;
    private String type;
    private double price;
    private int count;

    public Order() {
    }

    public Order(String account, int idProduct) {
        this.account = account;
        this.idProduct = idProduct;
    }

    public Order(int id, String date, String account, int idProduct) {
        this.id = id;
        this.date = date;
        this.account = account;
        this.idProduct = idProduct;
    }

    public Order(int id, String date, String nameProduct, String type, double price, int count) {
        this.id = id;
        this.date = date;
        this.nameProduct = nameProduct;
        this.type = type;
        this.price = price;
        this.count = count;
    }

    public Order(String nameProduct,String type,double price,int count) {
        this.nameProduct = nameProduct;
        this.type = type;
        this.price = price;
        this.count = count;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }
}
