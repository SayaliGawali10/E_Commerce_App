<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
        color: #ffffff;
        font-family: Arial, sans-serif;
    }
    .card-custom {
        background-color: rgba(255, 255, 255, 0.85);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-top: 50px;
    }
    .form-label {
        color: #007bff; 
        font-weight: bold;
    }
    .form-title {
        color: #ff5733; 
        font-size: 2rem;
        font-weight: bold;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .search-box {
        margin-top: 20px;
    }
    .search-label {
        color: #007bff;
        font-weight: bold;
    }
    .search-input {
        width: 300px;
        margin-right: 10px;
    }
    .customer-list {
        margin-top: 30px;
    }
    table {
        width: 100%;
    }
    th, td {
        text-align: center;
    }
</style>
</head>
<body>

<div class="container text-end mt-3">
    <a href="javascript:void(0);" onclick="logoutUser()">
        <button class="btn btn-outline-primary">
            Logout
        </button>
    </a>
</div>

<script>
    function logoutUser() {
        sessionStorage.clear();
        localStorage.clear();
        window.location.href = 'login.jsp';
    }
</script>

<div class="container">
    
   
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

        <div class="customer-list">
            <c:if test="${not empty searchedCustomer}">
                <h3 class="text-center">Search Result</h3>
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
        </div>
    </div>

  
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
    

    
    <div class="card-custom">
        <h2 class="text-center form-title">
            <i class="bi bi-list"></i> All Customers
        </h2>
        <c:if test="${not empty customers}">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Select</th>
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
                            <td>
                                <input type="radio" name="selectedCustomerId" value="${customer.id}" required>
                            </td>
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

</body>
</html>