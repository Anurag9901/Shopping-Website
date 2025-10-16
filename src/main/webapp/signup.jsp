<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-gradient d-flex justify-content-center align-items-center vh-100" 
      style="background: linear-gradient(135deg, #ff512f, #dd2476, #2575fc);">
    <div class="card p-4 shadow-lg" style="width: 400px;">
        <h3 class="text-center mb-3">Create Account</h3>
        <form action="signup" method="post">
            <div class="mb-3">
                <input type="text" name="name" placeholder="Full Name" class="form-control" required>
            </div>
            <div class="mb-3">
                <input type="email" name="email" placeholder="Email" class="form-control" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" placeholder="Password" class="form-control" required>
            </div>
            <button class="btn btn-success w-100">Sign Up</button>
        </form>
        <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login</a></p>
    </div>
</body>
</html>
