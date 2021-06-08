package com.phong.product.controller;

import com.phong.order.dao.OrderDAO;
import com.phong.order.model.Order;
import com.phong.pay.dao.PayDAO;
import com.phong.pay.model.Pay;
import com.phong.product.dao.ProductDAO;
import com.phong.product.model.Product;
import com.phong.user.dao.UserDAO;
import com.phong.user.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private UserDAO userDAO;
    private OrderDAO orderDAO;
    private PayDAO payDAO;
    private static int count_user;
    private static String user;
    private static String view;
    private int count = 1;

    public void init() {
        productDAO = new ProductDAO();
        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
        payDAO = new PayDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "add":
                    addToCart(request, response);
                    break;
                case "sort":
                    sort(request, response);
                    break;
                case "showOrder":
                    showOrder(request,response);
                    break;
                case "showPay":
                    showPay(request,response);
                    break;
                case "deleteOrder":
                    deleteOrder(request,response);
                    break;
                case "deletePay":
                    deletePay(request,response);
                    break;
                case "logout":
                    logUot(request, response);
                    break;
                case "showTable":
                    listView(request,response);
                    break;
                case "showDiv":
                    folderView(request,response);
                    break;
                case "addPay":
                    addtoPay(request,response);
                    break;
                default:
                    if ((request.getParameter("key") != null)){
                        search(request, response);
                    }
                    else {
                        listProduct(request, response);
                    }
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                try {
                    updateProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "create":
                try {
                    insertProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                if (user == null) {
                    try {
                        logIn(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void logIn(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("user");
        String pass = request.getParameter("pass");
        User account = userDAO.selectUser(name);
        if (account != null && pass.equals(account.getPassword())) {
            user = name;
            if (!user.equals("admin")) {
                count_user = orderDAO.getCount(user);
            } else {
                count_user = payDAO.getCount();
            }
            List<Product> listProduct = productDAO.selectAllProducts();
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("user", user);
            request.setAttribute("count", count_user);
            request.setAttribute("view", view);
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("textin", "Error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        double price = Double.parseDouble(request.getParameter("price"));
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        String img = request.getParameter("img");
        Product newProduct = new Product(name, type, price, inventory, img);
        productDAO.insertProduct(newProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void sort(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        count++;
        if(count%2 ==0) {
            request.setAttribute("rank", "");
        } else {
            request.setAttribute("rank", "Yes");
        }
        List<Product> listProduct = productDAO.sortProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("key");
        List<Product> listProduct = productDAO.searchProducts(name);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(id);
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.selectProduct(id);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        request.setAttribute("product", product);
        dispatcher.forward(request, response);
    }

    private void logUot(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        user = null;
        count_user = 0;
        view = null;
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        double price = Double.parseDouble(request.getParameter("price"));
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        String img = request.getParameter("img");
        Product book = new Product(id, name, type, price, inventory, img);
        productDAO.updateProduct(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int idProduct = Integer.parseInt(request.getParameter("id"));
        Order order = new Order(user, idProduct);
        orderDAO.insertOrder(order);
        count_user = orderDAO.getCount(user);
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Order> listOrder = orderDAO.selectOrderByUser(user);
        List<Pay> listPay = payDAO.searchPays(user);
        double total = payDAO.getSum(user);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/show_order.jsp");
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listPay", listPay);
        request.setAttribute("total", total);
        dispatcher.forward(request, response);
    }

    private void showPay(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        count_user = payDAO.getCount();
        List<Pay> listPay = payDAO.selectAllPays();
        List<User> listUser = userDAO.selectAllUsers();
        List<Pay> listTotal = payDAO.getTotal();
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/show_pay.jsp");
        request.setAttribute("listPay", listPay);
        request.setAttribute("listUser", listUser);
        request.setAttribute("listTotal", listTotal);
        dispatcher.forward(request, response);
    }

    private void addtoPay(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = orderDAO.selectOrderById(id);
        Pay pay = new Pay(user, order.getNameProduct(), order.getType(), order.getPrice(), order.getCount());
        payDAO.insertPay(pay);
        orderDAO.deleteOrder(id);
        count_user = orderDAO.getCount(user);
        double total = payDAO.getSum(user);
        List<Order> listOrder = orderDAO.selectOrderByUser(user);
        List<Pay> listPay = payDAO.searchPays(user);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/show_order.jsp");
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listPay", listPay);
        request.setAttribute("total", total);
        dispatcher.forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        orderDAO.deleteOrder(id);
        count_user = orderDAO.getCount(user);
        double total = payDAO.getSum(user);
        List<Order> listOrder = orderDAO.selectOrderByUser(user);
        List<Pay> listPay = payDAO.searchPays(user);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/show_order.jsp");
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listPay", listPay);
        request.setAttribute("total", total);
        dispatcher.forward(request, response);
    }

    private void deletePay(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        payDAO.deletePay(id);
        count_user = payDAO.getCount();
        List<Pay> listPay = payDAO.selectAllPays();
        List<User> listUser = userDAO.selectAllUsers();
        List<Pay> listTotal = payDAO.getTotal();
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/show_pay.jsp");
        request.setAttribute("listPay", listPay);
        request.setAttribute("listUser", listUser);
        request.setAttribute("listTotal", listTotal);
        dispatcher.forward(request, response);
    }

    private void listView(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        view = "error";
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void folderView(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        view = null;
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("user", user);
        request.setAttribute("count", count_user);
        request.setAttribute("view", view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }
}
