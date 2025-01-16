<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body {
            background: url('images/admin.jpeg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Roboto', sans-serif;
            color: #fff;
            padding-top: 60px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .navbar {
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 10px 20px;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .navbar-brand img {
            max-width: 120px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .navbar-brand img:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
        }

        .navbar-brand span {
            color: #20232a;
            font-weight: bold;
            font-size: 1.5rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .btn-signout {
            background-color: #ff4c4c;
            color: #fff;
            border: none;
            font-weight: bold;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-signout:hover {
            background-color: #ff3030;
        }

        .dashboard {
            text-align: center;
            margin-top: 20px;
            width: 100%;
            max-width: 1200px;
        }

        .scrolling-text {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 30px;
            color: #fff;
            background: rgba(0, 0, 0, 0.6);
            padding: 10px 20px;
            border-radius: 10px;
            animation: scroll-text 15s linear infinite;
        }

        @keyframes scroll-text {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }

        .card {
            transition: transform 0.3s, box-shadow 0.3s;
            background: rgba(255, 255, 255, 0.9);
            color: #000;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .card img {
            height: 200px;
            object-fit: cover;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .btn-primary {
            background-color: #34a853;
            border: none;
            font-weight: bold;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2c8b47;
        }

        footer {
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        @media (max-width: 768px) {
            .scrolling-text {
                font-size: 1.5rem;
            }

            .card {
                margin-bottom: 15px;
            }

            .navbar-brand img {
                max-width: 80px;
            }

            .navbar-brand span {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid d-flex justify-content-between">
            <a class="navbar-brand" href="#">
                <img src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" alt="Amazon Logo">
            </a>
            <button class="btn btn-signout" onclick="logoutUser()" aria-label="Logout">
                <i class="fas fa-sign-out-alt"></i> Logout
            </button>
        </div>
    </nav>

    <div class="dashboard">
        <div class="scrolling-text">Welcome to Admin Dashboard!</div>
        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-md-4">
                <div class="card">
                    <img src="images/products.jpeg" class="card-img-top" alt="Products management">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-box"></i> Products</h5>
                        <p class="card-text">Efficiently manage your products.</p>
                        <button class="btn btn-primary" data-url="/products.jsp" aria-label="Manage products">
                            <i class="fas fa-tools"></i> Manage Products
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4">
                <div class="card">
                    <img src="images/customers.jpeg" class="card-img-top" alt="Customer management">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-user"></i> Customers</h5>
                        <p class="card-text">Keep track of customer data.</p>
                        <button class="btn btn-primary" data-url="/customers.jsp" aria-label="Manage customers">
                            <i class="fas fa-user-cog"></i> Manage Customers
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-4">
                <div class="card">
                    <img src="images/orders.jpeg" class="card-img-top" alt="Customer orders">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-shopping-cart"></i> Customer Orders</h5>
                        <p class="card-text">Manage and view customer orders.</p>
                        <button class="btn btn-primary" data-url="/viewOrders.jsp" aria-label="Manage customer orders">
                            <i class="fas fa-cogs"></i> Manage Orders
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function logoutUser() {
            sessionStorage.clear();
            localStorage.clear();
            window.location.href = 'login.jsp';
        }

        document.querySelectorAll('.btn-primary').forEach(button => {
            button.addEventListener('click', event => {
                const url = event.target.getAttribute('data-url');
                if (url) {
                    window.location.href = url;
                }
            });
        });
    </script>
</body>
</html>
