<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-image: url('images/customers.jpeg'); /* Replace with your own image */
            background-size: cover;
            background-position: center;
            color: white;
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 40px;
        }

        .card {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 12px;
            color: white;
            margin-bottom: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .form-title {
            font-size: 2rem;
            color: #f8a600;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #f8a600;
            border: none;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #d17e00;
        }

        table {
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.9);
            color: black;
        }

        th {
            background-color: #f8a600;
            color: white;
        }

        footer {
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px;
            text-align: center;
            margin-top: 30px;
        }

        footer a {
            color: #f8a600;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Customer Management -->
    <div class="container">
        <!-- Display Logged-in Customer Details -->
        <div class="card">
            <h2 class="form-title"><i class="bi bi-person-circle"></i> Customer Details</h2>
            <c:if test="${not empty loggedInCustomer}">
                <form action="${pageContext.request.contextPath}/editCustomer" method="post">
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" id="customerName" name="name" value="${loggedInCustomer.name}" required>
                    </div>
                    <div class="mb-3">
                        <label for="customerEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="customerEmail" name="email" value="${loggedInCustomer.email}" required>
                    </div>
                    <div class="mb-3">
                        <label for="customerPhone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="customerPhone" name="phone" value="${loggedInCustomer.phone}" required>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">Update Details</button>
                    </div>
                </form>
                <!-- Delete Customer -->
                <form action="${pageContext.request.contextPath}/removeCustomer" method="post" style="text-align: center;">
                    <input type="hidden" name="id" value="${loggedInCustomer.id}">
                    <button type="submit" class="btn btn-danger btn-sm">Delete Account</button>
                </form>
            </c:if>
            <c:if test="${empty loggedInCustomer}">
                <p class="text-center">No customer details found.</p>
            </c:if>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Customer Management | <a href="#">Privacy Policy</a></p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
