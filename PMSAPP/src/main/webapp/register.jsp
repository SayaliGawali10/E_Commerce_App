<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - My E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(135deg, #2D9DA7 40%, #EC5F20 60%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
        }

        .form-container {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-container .title {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
            color: #333;
        }

        .form-container .form-control {
            height: 50px;
            padding: 10px 20px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
        }

        .form-container .form-control:focus {
            border-color: #EC5F20;
            box-shadow: 0 0 5px rgba(236, 95, 32, 0.5);
        }

        .register-btn {
            background-color: #EC5F20;
            color: #fff;
            font-size: 16px;
            padding: 12px;
            border-radius: 5px;
            width: 100%;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .register-btn:hover {
            background-color: #e54b1e;
        }

        .register-btn:focus {
            outline: none;
        }

        .login-redirect {
            text-align: center;
            margin-top: 20px;
        }

        .login-redirect a {
            color: #777;
            font-size: 14px;
            text-decoration: none;
        }

        .login-redirect a:hover {
            color: #333;
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .form-container {
                width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h3 class="title">Create an Account</h3>
        <form action="/reg" method="POST">
            <div class="mb-3">
                <input type="text" class="form-control" name="uname" placeholder="Enter your Username" required />
            </div>
            <div class="mb-3">
                <input type="email" class="form-control" name="email" placeholder="Enter your Email" required />
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Enter your Password" required />
            </div>
            <button type="submit" class="register-btn">Register</button>
        </form>
        </div>

</body>
</html>
