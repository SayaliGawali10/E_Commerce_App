<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Customer</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
    body {
        background-image: url("images/customers.jpeg");
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed; 
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
        color: #28a745; 
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


<div class="container">
    <div class="card-custom">
        <h2 class="text-center form-title">
            <i class="bi bi-pencil-square"></i> Edit Customer Details
        </h2>
        <form action="/UpdateCustomer" method="post">
            <input type="hidden" name="id" value="${customer.id}">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${customer.name}" placeholder="Enter Full Name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" value="${customer.email}" placeholder="Enter Email Address" required>
            </div>
            <div class="mb-3">
                <label for="mobileNo" class="form-label">Mobile Number</label>
                <input type="text" class="form-control" id="mobileNo" name="mobileNo" value="${customer.mobileNo}" placeholder="Enter Mobile Number" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" id="address" name="address" placeholder="Enter Address" required>${customer.address}</textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Save Changes
                </button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
