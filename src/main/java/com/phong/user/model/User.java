package com.phong.user.model;

public class User {
    private String name;
    private String password;
    private String fullName;
    private String address;
    private String phone;

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public User(String name, String password, String fullName, String address, String phone) {
        this.name = name;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
    }

    public User(String name, String fullName, String address, String phone) {
        this.name = name;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }
}
