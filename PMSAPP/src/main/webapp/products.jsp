<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-image: url('images/products.jpeg');
            background-size: cover;
            background-position: center;
            color: white;
            font-family: Arial, sans-serif;
        }

        .card-custom {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 12px;
            margin-top: 40px;
        }

        .form-title {
            color: #f8a600; 
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #cc7a00;
        }

        .search-box {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .search-box input {
            width: 300px;
            margin-right: 10px;
            padding: 10px;
        }

        .search-box button {
            background-color: #007bff;
            color: white;
        }

        .product-list {
            margin-top: 30px;
        }

        table {
            width: 100%;
            margin-top: 30px;
        }

        th, td {
            text-align: center;
        }

        .table-bordered td, .table-bordered th {
            border: 1px solid #f8a600;
        }

        .actions a, .actions button {
            margin: 5px;
        }

        .product-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        footer {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
            margin-top: 40px;
        }

        footer a {
            color: #f8a600;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        .no-products {
            color: #ff4d4d; 
            font-size: 1.5rem;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container text-center mt-3">
        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-warning">
            <i class="bi bi-house-door"></i> Home
        </a>
    </div>

    <div class="container product-container">

        <div class="card-custom">
            <h2 class="form-title"><i class="bi bi-plus-circle"></i> Add Product</h2>
            <form action="${pageContext.request.contextPath}/addProduct" method="post">
                
                <div class="mb-3">
                    <label for="productId" class="form-label">Product ID</label>
                    <input type="text" class="form-control" id="productId" name="id" placeholder="Enter Product ID" required>
                </div>
                
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="name" placeholder="Enter Product Name" required>
                </div>
                
                <div class="mb-3">
                    <label for="productDescription" class="form-label">Description</label>
                    <input type="text" class="form-control" id="productDescription" name="description" placeholder="Enter Product Description" required>
                </div>
                
                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price</label>
                    <input type="number" class="form-control" id="productPrice" name="price" placeholder="Enter Product Price" required>
                </div>
                
                <div class="mb-3">
                    <label for="productQuantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="productQuantity" name="quantity" placeholder="Enter Product Quantity" required>
                </div>

                <div class="mb-3">
                    <label for="productCategories" class="form-label">Categories</label>
                    <select class="form-control" id="productCategories" name="categories" required>
                        <option value="All">Enter Product Categories</option>
                        <option value="Jeans">Jeans</option>
                        <option value="Tops">Tops</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Cosmetics">Cosmetics</option>
                        <option value="Smartphones">Smartphones</option>
                        <option value="Laptops">Laptops</option>
                        <option value="Shoes">Shoes</option>
                        <option value="Watches">Watches</option>
                        <option value="Furniture">Furniture</option>
                        <option value="Books">Books</option>
                        <option value="Toys">Toys</option>
                        <option value="Jewelry">Jewelry</option>
                        <option value="Bags & Accessories">Bags & Accessories</option>
                        <option value="Beauty Products">Beauty Products</option>
                        <option value="Gardening">Gardening</option>
                        <option value="Stationery">Stationery</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="imageUrl" class="form-label">Product Image URL</label>
                    <input type="text" class="form-control" id="imageUrl" name="imageUrl" placeholder="Enter Image URL" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Add Product</button>
                </div>
                
            </form>
        </div>

        <div class="card-custom">
            <h2 class="form-title"><i class="bi bi-search"></i> Search Product</h2>
            <form action="${pageContext.request.contextPath}/searchProduct" method="get" class="search-box">
                <div class="mb-3">
                    <label for="searchCategories" class="form-label">Select a Categories</label>
                    <select id="searchCategories" name="categories" class="form-control" required>
                        <option value="">--Select Categories--</option>
                        <option value="All">All</option>
                        <option value="Jeans">Jeans</option>
                        <option value="Tops">Tops</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Cosmetics">Cosmetics</option>
                        <option value="Smartphones">Smartphones</option>
                        <option value="Laptops">Laptops</option>
                        <option value="Shoes">Shoes</option>
                        <option value="Watches">Watches</option>
                        <option value="Furniture">Furniture</option>
                        <option value="Books">Books</option>
                        <option value="Toys">Toys</option>
                        <option value="Jewelry">Jewelry</option>
                        <option value="Bags & Accessories">Bags & Accessories</option>
                        <option value="Beauty Products">Beauty Products</option>
                        <option value="Gardening">Gardening</option>
                        <option value="Stationery">Stationery</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Search</button>
            </form>
        </div>

        <div class="product-list">
            <h2 class="form-title"><i class="bi bi-list"></i> Product List</h2>
            <c:if test="${not empty products}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th>Image</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.name}</td>
                                <td>${product.description}</td>
                                <td>${product.price}</td>
                                <td>${product.quantity}</td>
                                <td>${product.categories}</td>
                                <td>
                                    <c:if test="${not empty product.imageUrl}">
                                        <img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="Product Image" style="max-width: 100px; max-height: 100px;">
                                    </c:if>
                                    <c:if test="${empty product.imageUrl}">
                                        <img src="${pageContext.request.contextPath}/images/placeholder.png" alt="No Image Available" style="max-width: 100px; max-height: 100px;">
                                    </c:if>
                                </td>
                                <td class="actions">
                                    <a href="${pageContext.request.contextPath}/deleteProduct?id=${product.id}" class="btn btn-danger">
                                        <i class="bi bi-trash"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty products}">
                <p class="no-products"><b>No Products Found!</b></p>
            </c:if>
        </div>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>

</body>

</html>
