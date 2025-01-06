<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome CDN -->
    <style>
        body {
            background: url('images/dashboard.jpeg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            color: #fff;
            padding-top: 50px;
            height: 100vh;
        }

        /* Navbar styling */
        .navbar {
            background-color: rgba(45, 157, 167, 0.9);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar-brand {
            color: #fff;
            font-weight: bold;
        }

        .navbar-brand:hover {
            color: #ddd;
        }

        .nav-link {
            color: #fff;
        }

        .nav-link:hover {
            color: #ddd;
        }

        .navbar .btn {
            margin-left: 15px;
        }

        .dashboard {
            padding: 60px 20px;
            text-align: center;
        }

        .dashboard marquee {
            font-size: 2rem;
            font-weight: bold;
            color: #FFD700;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 10px;
        }

        .card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.9);
            color: #000;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-bottom: 3px solid #2D9DA7;
        }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .card-text {
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .btn-signout {
            background-color: #e54b1e;
            color: #fff;
        }

        .btn-signout:hover {
            background-color: #d43a15;
        }

        .amazon-logo {
            width: 120px;
        }

       
        .col-md-4 {
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
        }

        .card {
            width: 90%;
            max-width: 350px;
        }

        .card-body .btn {
            padding: 10px 20px;
            font-size: 1.1rem;
        }
    </style>
    <script>
        function logoutUser() {
            sessionStorage.clear();  
            localStorage.clear();   
            window.location.href = 'login.jsp';  
        }
    </script>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" alt="Amazon Logo" class="amazon-logo">
            </a>
            <div class="d-flex">
                
                <button class="btn btn-signout" onclick="logoutUser()">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </div>
    </nav>

    
    <div class="container dashboard">
        <marquee behavior="scroll" direction="left">Welcome to the Future of Online Shopping!</marquee>
        <div class="row">
            
            <div class="col-md-4">
                <div class="card">
                    <img src="images/orders.jpeg" class="card-img-top" alt="Orders">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-box-open"></i> My Orders</h5>
                        <p class="card-text">View and manage customer orders.</p>
                        <button class="btn btn-primary" onclick="location.href='/orders.jsp'">
                            <i class="fas fa-arrow-right"></i> Go to Orders
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card">
                    <img src="images/products.jpeg" class="card-img-top" alt="Products">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-cogs"></i> Products</h5>
                        <p class="card-text">Add, view or remove products.</p>
                        <button class="btn btn-primary" onclick="location.href='/products.jsp'">
                            <i class="fas fa-tools"></i> Manage Products
                        </button>
                    </div>
                </div>
            </div>
           
            <div class="col-md-4">
                <div class="card">
                    <img src="images/customers.jpeg" class="card-img-top" alt="Customers">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-users"></i> Customers</h5>
                        <p class="card-text">Manage customer accounts and details.</p>
                        <button class="btn btn-primary" onclick="location.href='/customers.jsp'">
                            <i class="fas fa-user-cog"></i> Manage Customers
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
