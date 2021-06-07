package com.phong.product.model;

public class Product {
    private int id;
    private String name;
    private String type;
    private double price;
    private int inventory;
    private String img;

    public Product() {
    }

    public Product(String name, String type, double price, int inventory, String img) {
        this.name = name;
        this.type = type;
        this.price = price;
        this.inventory = inventory;
        this.img = img;
    }

    public Product(int id, String name, String type, double price, int inventory, String img) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.inventory = inventory;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
