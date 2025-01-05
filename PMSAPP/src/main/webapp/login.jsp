<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - My E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #2D9DA7, #EC5F20);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h3 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
            color: #333;
        }
        .form-control {
            height: 50px;
            padding: 10px 20px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn-primary {
            background-color: #EC5F20;
            color: #fff;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 5px;
            width: 100%;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #e54b1e;
        }
        .alert-danger {
            margin-top: 20px;
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="text-center">Login</h3>

        <!-- Display error message if it exists -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <p>${error}</p>
            </div>
        </c:if>

        <form action="/login" method="POST">
            <div class="mb-3">
                <label for="uname" class="form-label">Username</label>
                <input type="text" class="form-control" id="uname" name="uname" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <p class="text-center mt-3">Don't have an account? <a href="/register">Register here</a></p>
    </div>
</body>
</html>
