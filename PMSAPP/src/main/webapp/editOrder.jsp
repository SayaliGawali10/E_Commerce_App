<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-image: url('images/orders.jpeg'); /* Replace with your image URL */
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9);
            margin-top: 30px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px; /* Minimized size */
            margin-left: auto;
            margin-right: auto;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h2 class="text-center text-primary mb-4">Edit Order</h2>
        <form action="${pageContext.request.contextPath}/UpdateOrder" method="post">
            <input type="hidden" name="orderId" value="${orders.orderId}">
            
            <!-- Customer ID -->
            <div class="mb-3">
                <label for="customerId" class="form-label">Customer ID</label>
                <input type="text" class="form-control" id="customerId" name="customerId" value="${orders.customerId}" readonly>
            </div>

            <!-- Product ID -->
            <div class="mb-3">
                <label for="productId" class="form-label">Product ID</label>
                <input type="text" class="form-control" id="productId" name="productId" value="${orders.productId}" readonly>
            </div>

            <!-- Product Name -->
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName" name="productName" value="${orders.productName}" readonly>
            </div>

            <!-- Price (readonly) -->
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="${orders.price}" step="0.01" readonly>
            </div>

            <!-- Quantity -->
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="${orders.quantity}" min="1" required>
            </div>

            <!-- Total Amount (readonly) -->
            <div class="mb-3">
                <label for="totalAmount" class="form-label">Total Amount</label>
                <input type="number" class="form-control" id="totalAmount" name="totalAmount" value="${orders.totalAmount}" readonly>
            </div>

          <div class="mb-3">
    <label for="orderDate" class="form-label">Order Date</label>
    <input type="date" class="form-control" id="orderDate" name="orderDate" value="${orders.orderDate}">
</div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Update Order
                </button>
                <a href="${pageContext.request.contextPath}/orders" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // JavaScript to dynamically update the total amount based on quantity change
    const quantityInput = document.getElementById('quantity');
    const priceInput = document.getElementById('price');
    const totalAmountInput = document.getElementById('totalAmount');

    quantityInput.addEventListener('input', () => {
        const quantity = parseFloat(quantityInput.value) || 0;
        const price = parseFloat(priceInput.value) || 0;
        totalAmountInput.value = (quantity * price).toFixed(2);
    });
</script>
</body>
</html>
