<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>View Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-image: url("images/orders.jpeg");
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

        .order-list {
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

        .btn-warning {
            padding: 6px 12px;
            border-radius: 5px;
            transition: background-color 0.3s;
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

        .form-inline select {
            margin-right: 10px;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            display: none;
        }
    </style>
   <script>
    // Validate form submission to ensure at least one field is filled
    function validateForm() {
        const customerId = document.getElementById("customerId").value.trim();
        const customerSelect = document.getElementById("customerSelect").value.trim();
        const errorMessage = document.getElementById("error-message");

        if (!customerId && !customerSelect) {
            errorMessage.style.display = "block";
            return false;
        }
        return true;
    }
</script>
</head>
<body>

<div class="container text-center mt-3">
    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-warning header-btn">
        <i class="bi bi-house-door"></i> Home
    </a>
</div>

<div class="container">
    <!-- Search Section -->
    <div class="container text-center mt-3">
        <form action="/SearchOrders" method="get" class="form-inline mb-3" onsubmit="return validateForm()">
    <!-- Option to enter Customer ID -->
    <label for="customerId" class="form-label">Enter Customer ID:</label>
    <input type="text" id="customerId" name="customerId" class="form-control" placeholder="Enter Customer ID">

    <!-- Option to select Customer ID from the list -->
    <label for="customerSelect" class="form-label ml-2">Select Customer:</label>
    <select id="customerSelect" name="customerIdSelect" class="form-control">
        <option value="" disabled selected>Select Customer</option>
        <c:forEach var="customer" items="${customers}">
            <option value="${customer.id}">${customer.name}</option>
        </c:forEach>
        <option value="all">All Customers</option>
    </select>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary ml-2">Search</button>
</form>
        
    </div>

    <!-- Orders Section -->
    <div class="card-custom">
        <h2 class="text-center form-title">
            <i class="bi bi-cart"></i> View Orders
        </h2>

        <!-- Order Table Section -->
        <div class="order-list">
            <c:if test="${not empty orders}">
                <h3 class="text-center-custom">
                    Orders for 
                    <c:choose>
                        <c:when test="${param.customerId != null}">
                            Customer ID: ${param.customerId}
                        </c:when>
                        <c:otherwise>
                            Customer Name: ${param.customerIdSelect}
                        </c:otherwise>
                    </c:choose>
                </h3>
                <form action="/deleteOrder" method="post" onsubmit="return validateForm()">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Select</th>
                                <th>Order ID</th>
                                <th>Customer ID</th>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Amount</th>
                                <th>Order Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td><input type="checkbox" name="selectedOrders" value="${order.orderId}"></td>
                                    <td>${order.orderId}</td>
                                    <td>${order.customerId}</td>
                                    <td>${order.productId}</td>
                                    <td>${order.productName}</td>
                                    <td>${order.price}</td>
                                    <td>${order.quantity}</td>
                                    <td>${order.totalAmount}</td>
                                    <td>${order.orderDate}</td>
                                    <td>
                                        <!-- Edit Button -->
                                        <a href="/editOrder?id=${order.orderId}" class="btn btn-warning btn-sm">
                                            <i class="bi bi-pencil"></i> Edit
                                        </a>
                                        <!-- Delete Button -->
                                        <form action="/deleteOrder" method="post" style="display:inline;">
                                            <input type="hidden" name="orderId" value="${order.orderId}">
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="bi bi-trash"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </c:if>
            <c:if test="${empty orders}">
                <h3 class="text-center-custom text-danger">
                    No orders available for the given Customer ID or selection.
                </h3>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ggOyR0iXCBXz7wC5g6aK2jrQFfDDKSYtr18l5bDnbO67tDJk4z2SyXjvDlZD7nk" crossorigin="anonymous"></script>

</body>
</html>
