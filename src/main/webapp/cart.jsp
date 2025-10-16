<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Shopping Cart - E-Commerce Store</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<style>
    /* Reset & base */
    *{ box-sizing: border-box; }
    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin:0; background:#f7f8fa; color:#2c3e50; line-height:1.6; display:flex; flex-direction:column; min-height:100vh;}
    a { text-decoration:none; color:#0071dc; }
    a:hover { text-decoration:underline; }

    /* Navbar */
    header.navbar {
        background: linear-gradient(135deg,#667eea 0%,#764ba2 100%);
        color: white; padding:0.5rem 1rem; display:flex; align-items:center; justify-content:space-between;
        position:sticky; top:0; z-index:1000; box-shadow:0 2px 8px rgba(0,0,0,0.15);
    }
    .navbar .logo{ font-size:1.8rem; font-weight:bold; display:flex; align-items:center; gap:0.5rem; }
    .navbar .logo i{ color:#f0f0f0; }
    .navbar nav{ display:flex; align-items:center; gap:1.4rem; }
    .navbar nav a{ color:white; font-weight:600; font-size:1rem; padding:0.5rem 0.75rem; border-radius:6px; transition:background-color 0.3s; }
    .navbar nav a:hover, .navbar nav a.active{ background:rgba(255,255,255,0.15); }
    .navbar .search-container{ flex-grow:1; margin:0 1rem; position:relative; }
    .navbar input[type=search]{ width:100%; padding:7px 12px 7px 36px; border-radius:6px; border:none; outline:none; font-size:1rem; }
    .navbar .search-icon{ position:absolute; left:12px; top:50%; transform:translateY(-50%); color:#999; }
    .navbar .cart-icon{ position:relative; }
    .navbar .cart-icon i{ font-size:1.5rem; }
    .navbar .cart-count{
        position:absolute; top:-6px; right:-6px; background:#ff4d4d; color:white;
        font-size:0.8rem; font-weight:bold; padding:2px 6px; border-radius:50%;
        min-width:18px; text-align:center; line-height:1;
    }

    /* Container */
    main.container {
        max-width:1024px; margin:2rem auto; padding:0 15px; flex-grow:1;
        background:white; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.1);
    }
    h1 {
        font-size:2.4rem; font-weight:700; margin-bottom:1.5rem; text-align:center;
    }

    /* Cart table */
    table.cart {
        width:100%; border-collapse:collapse; margin-bottom:20px; font-size:1rem;
    }
    table.cart th, table.cart td {
        padding:15px 10px; border-bottom:1px solid #e4e7eb; vertical-align:middle; text-align:center;
    }
    table.cart th {
        background:#fafbfc; color:#6b7c93; font-weight:600;
        text-transform:uppercase;
    }
    .product-cell {
        display:flex; align-items:center; gap:15px; text-align:left;
    }
    .product-image {
        width:100px; height:100px; border-radius:12px; object-fit:cover; box-shadow:0 3px 6px rgba(0,0,0,0.1);
    }
    .product-name {
        font-weight:600; color:#2e3a59;
    }
    .product-description {
        font-size:0.85rem; color:#666;
    }

    /* Quantity Controls */
    .quantity-controls {
        display:flex; align-items:center; justify-content:center; gap:10px;
    }
    .quantity-btn {
        padding:6px 12px; background:#f2f4f7; border:1px solid #d1d9e6;
        cursor:pointer; border-radius:6px; font-size:1rem; user-select:none;
        transition: background-color 0.25s ease;
    }
    .quantity-btn:hover {
        background:#dbe2f2;
    }
    .quantity-input {
        width:50px; text-align:center; padding:5px 10px; font-size:1rem;
        border:1px solid #d1d9e6; border-radius:6px;
    }

    /* Remove Button */
    .remove-btn {
        background:transparent; border:none; color:#ff5252; font-size:1.3rem; cursor:pointer;
        transition: color 0.3s ease;
    }
    .remove-btn:hover {
        color:#db2c2c;
    }

    /* Order Summary */
    .summary {
        border-top:1px solid #e4e7eb; padding-top:25px; display:flex;
        justify-content:space-between; align-items:center; flex-wrap:wrap;
        gap:20px;
    }
    .summary-left { flex-basis:60%; }
    .summary-right {
        flex-basis:35%; background:#f8fafc; border-radius:12px; padding:20px;
        box-shadow:0 4px 10px rgba(118,75,162,0.2);
    }
    .summary-right h2 {
        margin-bottom:20px; font-size:1.8rem; color:#2e3a59;
    }
    .summary-item {
        display:flex; justify-content:space-between; font-weight:600;
        font-size:1.2rem; margin-bottom:15px;
    }
    .summary-total {
        font-size:1.6rem; color:#667eea; margin-top:10px;
        border-top:1px solid #d1d9e6; padding-top:15px;
    }
    .btn-checkout {
        display:block; width:100%; background:linear-gradient(135deg,#667eea 0%,#764ba2 100%);
        color:white; border:none; padding:15px 0; font-size:1.2rem; font-weight:700;
        border-radius:12px; cursor:pointer; box-shadow:0 8px 20px rgba(118,75,162,0.4);
        transition: box-shadow 0.3s ease; margin-top:25px; text-decoration:none;
        text-align:center; display:flex; align-items:center; justify-content:center; gap:0.5rem;
    }
    .btn-checkout:hover {
        box-shadow:0 12px 30px rgba(118,75,162,0.7); text-decoration:none; color:white;
    }

    /* Promo code */
    .promo-code {
        margin-top:20px; display:flex; gap:10px; align-items:center;
    }
    .promo-code input[type="text"] {
        flex-grow:1; padding:8px 12px; font-size:1rem; border:1px solid #d1d9e6;
        border-radius:6px;
    }
    .promo-code button {
        padding:9px 20px; background:#667eea; border:none; color:white;
        font-weight:600; border-radius:6px; cursor:pointer;
        transition: background-color 0.3s ease;
    }
    .promo-code button:hover {
        background:#545fcf;
    }

    /* Continue Shopping */
    .continue-shopping {
        display:inline-block; margin-bottom:20px; font-weight:600; color:#667eea; cursor:pointer;
    }
    .continue-shopping i {
        margin-right: 6px;
    }

    /* Empty Cart */
    .empty-cart {
        text-align:center; padding:6rem 2rem; font-size:1.4rem; color:#888;
    }

    /* Update Cart Button */
    .update-cart-btn {
        background: #28a745; color: white; border: none; padding: 12px 24px;
        border-radius: 8px; font-weight: 600; cursor: pointer; margin-bottom: 20px;
        transition: background-color 0.3s ease;
    }
    .update-cart-btn:hover {
        background: #218838;
    }

    /* Footer */
    footer.footer {
        background:#2c3e50; color:#bdc3c7; padding: 30px 20px; margin-top:auto; font-size:0.9rem;
    }
    .footer .container {
        max-width:1024px; margin:auto; display:flex; flex-wrap:wrap; justify-content:space-between; gap:20px;
    }
    .footer-section {
        min-width:180px; flex:1;
    }
    .footer-section h3 {
        color:#ecf0f1; margin-bottom:15px; font-weight:700; font-size:1.2rem;
    }
    .footer-section ul {
        list-style:none; padding-left:0;
    }
    .footer-section ul li {
        margin-bottom:10px;
    }
    .footer-section ul li a {
        color:#bdc3c7;
    }
    .footer-section ul li a:hover {
        color:#f39c12;
    }
    .footer-bottom {
        text-align:center; margin-top:25px; color:#7f8c8d;
    }
    @media (max-width:768px) {
        table.cart th, table.cart td { padding:10px; }
        .product-image { width:75px; height:75px; }
        .quantity-input { width:40px; font-size:0.9rem; }
        .summary { flex-direction: column; }
        .summary-left, .summary-right { flex-basis: 100%; }
        header.navbar nav { display:none; }
    }
</style>
</head>
<body>
<header class="navbar">
    <div class="logo">
        <i class="fas fa-shopping-bag"></i> E-Commerce Store
    </div>
    <nav>
        <a href="home">Home</a>
        <a href="products">Products</a>
        <a href="cart" class="active">Cart</a>
        <c:choose>
            <c:when test="${not empty sessionScope.userName}">
                <a href="dashboard">Dashboard</a>
                <form action="logout" method="get" style="display:inline;">
                    <button type="submit" style="background:none; border:none; color:white; cursor:pointer; font-size:1rem;">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </form>
            </c:when>
            <c:otherwise>
                <a href="login.jsp">Login</a>
                <a href="signup.jsp">Sign Up</a>
            </c:otherwise>
        </c:choose>
    </nav>
</header>

<main class="container">
    <a href="products" class="continue-shopping"><i class="fas fa-arrow-left"></i> Continue Shopping</a>
    <h1>Your Shopping Cart</h1>

    <c:choose>
        <c:when test="${empty cart}">
            <div class="empty-cart">
                <i class="fas fa-shopping-cart fa-4x"></i><br/>
                Your cart is empty.<br />
                <a href="products">Browse products to add items to your cart.</a>
            </div>
        </c:when>
        <c:otherwise>
            <form action="cart" method="post" id="cartForm">
                <input type="hidden" name="action" value="update" />
                <table class="cart">
                    <thead>
                        <tr>
                          <th>Product</th>
                          <th>Price</th>
                          <th>Quantity</th>
                          <th>Subtotal</th>
                          <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cart}" varStatus="loop">
                            <tr>
                                <td class="product-cell">
                                    <img src="${item.product.imageUrl}" alt="${item.product.name}" class="product-image" onerror="this.src='https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400';" />
                                    <div>
                                        <div class="product-name">${item.product.name}</div>
                                        <div class="product-description">${item.product.description}</div>
                                    </div>
                                </td>
                                <td>$<fmt:formatNumber value="${item.product.price}" type="number" minFractionDigits="2" maxFractionDigits="2" /></td>
                                <td>
                                    <div class="quantity-controls">
                                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, -1)">-</button>
                                        <input type="number" name="quantity" class="quantity-input" min="1" value="${item.quantity}" />
                                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, 1)">+</button>
                                        <input type="hidden" name="productId" value="${item.product.id}" />
                                    </div>
                                </td>
                                <td>$<fmt:formatNumber value="${item.product.price * item.quantity}" type="number" minFractionDigits="2" maxFractionDigits="2" /></td>
                                <td>
                                    <form action="cart" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="remove" />
                                        <input type="hidden" name="productId" value="${item.product.id}" />
                                        <button type="submit" class="remove-btn" title="Remove item"><i class="fas fa-trash"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Update Cart Button -->
                <div style="text-align: left; margin-bottom: 20px;">
                    <button type="submit" class="update-cart-btn">
                        <i class="fas fa-sync-alt"></i> Update Cart
                    </button>
                </div>
            </form>

            <div class="summary">
                <div class="summary-left"></div>
                <div class="summary-right">
                    <h2>Order Summary</h2>
                    <div class="summary-item"><span>Total Items:</span><span><c:out value="${totalItems}"/></span></div>
                    <div class="summary-item"><span>Total Price:</span> 
                        <span>$<fmt:formatNumber value="${totalPrice}" type="number" minFractionDigits="2" maxFractionDigits="2" /></span>
                    </div>
                    <div class="promo-code">
                        <input type="text" name="promoCode" placeholder="Promo code" />
                        <button type="button" onclick="alert('Promo code functionality coming soon!')">Apply</button>
                    </div>
                    
                    <!-- CHECKOUT LINK ADDED HERE -->
                    <a href="checkout" class="btn-checkout">
                        <i class="fas fa-credit-card"></i> Proceed to Checkout
                    </a>
                </div>
            </div>

            <form action="cart" method="post" style="margin-top: 20px; text-align: right;">
                <input type="hidden" name="action" value="clear" />
                <button type="submit" class="remove-btn" style="background: #dc3545; color: white; padding: 10px 20px; border-radius: 6px;">
                    <i class="fas fa-trash-alt"></i> Clear Cart
                </button>
            </form>
        </c:otherwise>
    </c:choose>
</main>

<footer class="footer">
    <div class="container">
        <div class="footer-section">
            <h3>Customer Service</h3>
            <ul>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="#">Returns & Refunds</a></li>
                <li><a href="#">Shipping Info</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>About Us</h3>
            <ul>
                <li><a href="#">Our Story</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Affiliate Program</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Connect</h3>
            <ul>
                <li><a href="#"><i class="fab fa-facebook-square"></i> Facebook</a></li>
                <li><a href="#"><i class="fab fa-twitter-square"></i> Twitter</a></li>
                <li><a href="#"><i class="fab fa-instagram-square"></i> Instagram</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">&copy; 2025 E-Commerce Store. All rights reserved.</div>
</footer>

<script>
function changeQuantity(button, delta) {
    const input = button.parentElement.querySelector('input[name="quantity"]');
    let currentVal = parseInt(input.value);
    if (isNaN(currentVal)) currentVal = 1;
    let newVal = currentVal + delta;
    if (newVal < 1) newVal = 1;
    input.value = newVal;
}
</script>
</body>
</html>
