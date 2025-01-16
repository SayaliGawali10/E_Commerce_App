<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Customer Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
    body {
        background-image: url("images/customers.jpeg");
        background-repeat: no-repeat;
        background-size: cover;
        background-color: rgba(210, 180, 140, 0.8);
        color: #ffffff;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        position: relative;
    }

    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: -1;
    }

    .card-custom {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        margin-top: 40px;
        margin-bottom: 40px;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .card-custom:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }

    .form-title {
        color: #333;
        font-size: 2.2rem;
        font-weight: bold;
        margin-bottom: 20px;
        text-transform: uppercase;
    }

    .form-label {
        color: #007bff;
        font-weight: 600;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        padding: 10px 20px;
        border-radius: 25px;
        font-weight: 600;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .search-box {
        margin-top: 20px;
    }

    .search-input {
        width: 300px;
        margin-right: 10px;
        border-radius: 25px;
        padding: 10px;
    }

    .search-label {
        color: #007bff;
        font-weight: 600;
    }

    .customer-list {
        margin-top: 30px;
    }

    table {
        width: 100%;
        margin-top: 20px;
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        text-align: center;
        padding: 10px;
    }

    th {
        background-color: #f8f9fa;
        color: #007bff;
    }

    .btn-success, .btn-danger, .btn-warning {
        padding: 6px 12px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .btn-success:hover {
        background-color: #218838;
    }

    .btn-danger:hover {
        background-color: #c82333;
    }

    .btn-warning:hover {
        background-color: #e0a800;
    }

    .header-btn {
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .text-center-custom {
        color: #007bff;
        font-weight: 600;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<div class="container text-center mt-3">
    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-warning header-btn">
        <i class="bi bi-house-door"></i> Home
    </a>
</div>

<div class="container">
    <!-- Search Customer Section -->
    <div class="card-custom">
        <h2 class="text-center form-title">
            <i class="bi bi-search"></i> Search Customer by ID
        </h2>
        <form action="/SearchCustomer" method="get" class="search-box text-center">
            <label for="searchId" class="search-label">Enter Customer ID to Search:</label>
            <input type="text" id="searchId" name="id" class="form-control search-input" placeholder="Search by Customer ID" required>
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-search"></i> Search
            </button>
        </form>

        <!-- Search Result Section -->
        <div class="customer-list">
            <c:if test="${not empty searchedCustomer}">
                <h3 class="text-center-custom">Search Result</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Customer ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${searchedCustomer.id}</td>
                            <td>${searchedCustomer.name}</td>
                            <td>${searchedCustomer.email}</td>
                            <td>${searchedCustomer.mobileNo}</td>
                            <td>${searchedCustomer.address}</td>
                        </tr>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty searchedCustomer}">
                <h3 class="text-center-custom text-danger">${message}</h3>
            </c:if>
        </div>
    </div>

    <!-- Add Customer Section -->
    <div class="card-custom">
        <h2 class="text-center form-title">
            <i class="bi bi-person-plus"></i> Add New Customer
        </h2>
        <form action="/AddCustomer" method="post">
            <div class="mb-3">
                <label for="id" class="form-label">Customer ID</label>
                <input type="text" class="form-control" id="id" name="id" placeholder="Enter Customer ID" required>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Full Name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address" required>
            </div>
            <div class="mb-3">
                <label for="mobileNo" class="form-label">Mobile Number</label>
                <input type="text" class="form-control" id="mobileNo" name="mobileNo" placeholder="Enter Mobile Number" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" id="address" name="address" placeholder="Enter Address" required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-plus-circle"></i> Add Customer
                </button>
            </div>
        </form>
    </div>

    <!-- Display All Customers Section -->
    <div class="card-custom">
        <h2 class="text-center form-title">
            <i class="bi bi-list"></i> All Customers
        </h2>
        <c:if test="${not empty customers}">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.name}</td>
                            <td>${customer.email}</td>
                            <td>${customer.mobileNo}</td>
                            <td>${customer.address}</td>
                            <td>
                                <form action="/EditCustomer" method="get" class="d-inline">
                                    <input type="hidden" name="id" value="${customer.id}">
                                    <button type="submit" class="btn btn-sm btn-primary">
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </button>
                                </form>
                                <form action="/DeleteCustomer" method="post" class="d-inline">
                                    <input type="hidden" name="id" value="${customer.id}">
                                    <button type="submit" class="btn btn-sm btn-danger">
                                        <i class="bi bi-trash"></i> Delete
                                    </button>
                                </form>
                                <form action="order.jsp" method="get" class="d-inline">
                                    <input type="hidden" name="customerId" value="${customer.id}">
                                    <button type="submit" class="btn btn-sm btn-success">
                                        <i class="bi bi-cart-plus"></i> Create Order
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty customers}">
            <p class="text-center form-label">No customers available</p>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-vj9GpGo7y2IjBbHv6A0cOL9evmZZQjZD3mZ5g0pztYxzGhTtDBZAMAzZ7Tn9PrjF" crossorigin="anonymous"></script>
</body>
</html>
