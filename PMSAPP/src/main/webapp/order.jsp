<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/orders.jpeg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #333;
        }
        .card-custom {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        .form-title {
            color: #007bff; 
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
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-cart-plus"></i> Create Order
            </h2>
            <c:if test="${not empty param.customerId}">
                <p>Creating an order for Customer ID: <strong>${param.customerId}</strong></p>

                
                <form action="/CreateOrder" method="post">
                    <input type="hidden" name="customerId" value="${param.customerId}">
                    
                    <div class="mb-3">
                        <label for="productSelect" class="form-label">Product Name</label>
                        <select id="productSelect" class="form-select" name="productId" required>
                            <option value="" disabled selected>Select a product</option>
                            <option value="1" data-price="1500" data-name="Jeans">Jeans</option>
                            <option value="2" data-price="350" data-name="Tops">Tops</option>
                            <option value="3" data-price="2000" data-name="Electronics">Electronics</option>
                            <option value="4" data-price="750" data-name="Cosmetics">Cosmetics</option>
                            <option value="5" data-price="100000" data-name="Smartphones">Smartphones</option>
                            <option value="6" data-price="50000" data-name="Laptops">Laptops</option>
                            <option value="7" data-price="800" data-name="Shoes">Shoes</option>
                            <option value="8" data-price="2500" data-name="Watches">Watches</option>
                            <option value="9" data-price="15000" data-name="Furniture">Furniture</option>
                            <option value="10" data-price="150" data-name="Books">Books</option>
                            <option value="11" data-price="500" data-name="Toys">Toys</option>
                            <option value="12" data-price="3000" data-name="Jewelry">Jewelry</option>
                            <option value="13" data-price="1300" data-name="Bags & Accessories">Bags & Accessories</option>
                            <option value="14" data-price="1000" data-name="Beauty Products">Beauty Products</option>
                            <option value="15" data-price="100" data-name="Gardening">Gardening</option>
                            <option value="16" data-price="60" data-name="Stationery">Stationery</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name (Selected)</label>
                        <input type="text" class="form-control" id="productName" name="productName" readonly>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="text" class="form-control" id="price" name="price" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter Quantity" required>
                    </div>

                    <div class="mb-3">
                        <label for="totalAmount" class="form-label">Total Amount</label>
                        <input type="text" class="form-control" id="totalAmount" name="totalAmount" readonly>
                    </div>

                    <div class="mb-3">
                        <label for="orderDate" class="form-label">Order Date</label>
                        <input type="date" class="form-control" id="orderDate" name="orderDate" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-cart-check"></i> Place Order
                        </button>
                    </div>
                </form>
            </c:if>
            <c:if test="${empty param.customerId}">
                <p class="text-danger text-center">Customer ID is missing!</p>
            </c:if>
        </div>
    </div>

   
    <script>
        document.getElementById('productSelect').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            const price = selectedOption.getAttribute('data-price');
            const name = selectedOption.getAttribute('data-name');
            document.getElementById('price').value = price ? price : '';
            document.getElementById('productName').value = name ? name : '';
            calculateTotalAmount();
        });

        document.getElementById('quantity').addEventListener('input', function() {
            calculateTotalAmount();
        });

        function calculateTotalAmount() {
            const price = parseFloat(document.getElementById('price').value) || 0;
            const quantity = parseInt(document.getElementById('quantity').value) || 0;
            const totalAmount = price * quantity;
            document.getElementById('totalAmount').value = totalAmount.toFixed(2);
        }
    </script>
</body>
</html> 