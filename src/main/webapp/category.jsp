<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${categoryName} - ECommerceApp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f9f9f9; }
        .navbar { background: #232f3e; }
        .navbar-brand, .nav-link { color: #fff !important; }
        .category-header { padding: 40px 20px; background: #e9ecef; text-align: center; }
        .category-header h2 { font-weight: 600; }
        .product-card { border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        .product-card img { border-radius: 12px 12px 0 0; height: 200px; object-fit: cover; }
        .product-price { font-size: 1rem; }
        .product-price del { color: #999; margin-left: 5px; }
        .footer { background: #232f3e; color: #ddd; padding: 15px; text-align: center; margin-top: 50px; }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="dashboard">ECommerceApp</a>
            <div class="ms-auto">
                <a class="nav-link d-inline-block" href="dashboard">Home</a>
                <a class="nav-link d-inline-block" href="products">Products</a>
                <a class="nav-link d-inline-block" href="cart.jsp">Cart</a>
                <a class="nav-link d-inline-block" href="orders.jsp">Orders</a>
                <a class="nav-link d-inline-block" href="profile.jsp">Profile</a>
                <a class="nav-link btn btn-danger btn-sm d-inline-block" href="logout">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Category Header -->
    <div class="category-header">
        <h2>${categoryName}</h2>
        <p>Explore our wide collection of ${categoryName} products</p>
    </div>

    <!-- Products Grid -->
    <div class="container my-5">
        <div class="row">
            <c:forEach var="p" items="${products}">
                <div class="col-md-3 mb-4">
                    <div class="card product-card h-100">
                        <img src="${p.imageUrl}" class="card-img-top" alt="${p.name}">
                        <div class="card-body">
                            <h6 class="card-title">${p.name}</h6>
                            <p class="product-price">
                                ₹${p.price - (p.price * p.discount / 100)}
                                <del>₹${p.price}</del>
                                <span class="badge bg-success">${p.discount}% OFF</span>
                            </p>
                            <a href="cart?add=${p.id}" class="btn btn-primary btn-sm w-100">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; <%= java.time.Year.now() %> ECommerceApp. All rights reserved.</p>
    </footer>
</body>
</html>
