package com.phong.pay.model;

public class Pay {
    private int id;
    private String user;
    private String date;
    private String name;
    private String type;
    private double price;
    private int count;
    private double total;

    public Pay(int id,String user, String date, String name, String type, double price, int count) {
        this.id = id;
        this.user = user;
        this.date = date;
        this.name = name;
        this.type = type;
        this.price = price;
        this.count = count;
    }

    public Pay(String user, String name, String type, double price, int count) {
        this.user = user;
        this.name = name;
        this.type = type;
        this.price = price;
        this.count = count;
    }

    public Pay(String user, double total) {
        this.user = user;
        this.total = total;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
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

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
