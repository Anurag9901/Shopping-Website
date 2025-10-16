<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - E-Commerce Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f8fafc;
            color: #1a202c;
            line-height: 1.6;
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            transition: opacity 0.3s;
        }

        .nav-links a:hover, .nav-links a.active {
            opacity: 0.8;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 20px;
        }

        /* Welcome Section */
        .welcome-section {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 2rem;
            border-radius: 16px;
            margin-bottom: 2rem;
            text-align: center;
        }

        .welcome-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .welcome-subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .stat-card {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            text-align: center;
            transition: all 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 1rem;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .stat-icon.products {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .stat-icon.categories {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .stat-icon.orders {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .stat-icon.users {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #718096;
            font-size: 1.1rem;
        }

        /* Section Headers */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 2rem;
            font-weight: bold;
            color: #2d3748;
        }

        .view-all-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .view-all-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        /* Categories Section */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 3rem;
        }

        .category-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
        }

        .category-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .category-name {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .category-description {
            color: #718096;
            font-size: 0.9rem;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        /* Product Card - Same as products page */
        .product-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            height: 420px;
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1), 0 10px 10px -5px rgba(0,0,0,0.04);
        }

        .product-image-container {
            position: relative;
            height: 240px;
            overflow: hidden;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .product-card:hover .product-image {
            transform: scale(1.05);
        }

        .product-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: #f56565;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: bold;
        }

        .wishlist-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 36px;
            height: 36px;
            background: white;
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .wishlist-btn:hover {
            background: #f56565;
            color: white;
        }

        .product-info {
            padding: 1.5rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }

        .product-description {
            color: #718096;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            flex-grow: 1;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-price {
            font-size: 1.3rem;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 1rem;
        }

        .product-actions {
            display: flex;
            gap: 0.5rem;
        }

        .add-to-cart-btn {
            flex: 1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 16px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .add-to-cart-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .quick-view-btn {
            background: #f7fafc;
            color: #4a5568;
            border: 2px solid #e2e8f0;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .quick-view-btn:hover {
            background: #edf2f7;
            border-color: #cbd5e0;
        }

        /* Error & Success Messages */
        .error-message {
            background: #fed7d7;
            color: #c53030;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            text-align: center;
        }

        .success-message {
            background: #c6f6d5;
            color: #22543d;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            text-align: center;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #718096;
        }

        .empty-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #cbd5e0;
        }

        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 3rem;
        }

        .action-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }

        .action-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-decoration: none;
            color: inherit;
        }

        .action-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #667eea;
        }

        .action-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .action-description {
            font-size: 0.9rem;
            color: #718096;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }

            .welcome-title {
                font-size: 2rem;
            }

            .stats-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }

            .section-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="logo">
                <i class="fas fa-shopping-bag"></i>
                E-Commerce Store
            </div>
            <nav>
                <ul class="nav-links">
                    <li><a href="home"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="products"><i class="fas fa-box"></i> Products</a></li>
                    <li><a href="cart"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                    <li><a href="dashboard" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="login" style="color: white; margin-left: 1rem;">Logout</a>
                    
                </ul>
            </nav>
            <div class="user-info">
                <div class="user-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <span>Welcome, ${user}!</span>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1 class="welcome-title">Welcome back, ${user}!</h1>
            <p class="welcome-subtitle">Here's what's happening in your store today</p>
        </div>

        <!-- Error/Success Messages -->
        <c:if test="${not empty error}">
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                ${error}
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.successMessage}">
            <div class="success-message">
                <i class="fas fa-check-circle"></i>
                ${sessionScope.successMessage}
            </div>
            <c:remove var="successMessage" scope="session"/>
        </c:if>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon products">
                    <i class="fas fa-box"></i>
                </div>
                <div class="stat-number">${totalProducts}</div>
                <div class="stat-label">Total Products</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon categories">
                    <i class="fas fa-tags"></i>
                </div>
                <div class="stat-number">${totalCategories}</div>
                <div class="stat-label">Categories</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon orders">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="stat-number">0</div>
                <div class="stat-label">Orders Today</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon users">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-number">1</div>
                <div class="stat-label">Active Users</div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="section-header">
            <h2 class="section-title">Quick Actions</h2>
        </div>

        <div class="quick-actions">
            <a href="products" class="action-card">
                <div class="action-icon">
                    <i class="fas fa-eye"></i>
                </div>
                <div class="action-title">View All Products</div>
                <div class="action-description">Browse the complete product catalog</div>
            </a>
            <a href="cart" class="action-card">
                <div class="action-icon">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="action-title">View Cart</div>
                <div class="action-description">Check your current cart items</div>
            </a>
            <a href="#" class="action-card" onclick="alert('Feature coming soon!')">
                <div class="action-icon">
                    <i class="fas fa-plus"></i>
                </div>
                <div class="action-title">Add Product</div>
                <div class="action-description">Add new products to inventory</div>
            </a>
            <a href="#" class="action-card" onclick="alert('Feature coming soon!')">
                <div class="action-icon">
                    <i class="fas fa-chart-bar"></i>
                </div>
                <div class="action-title">View Reports</div>
                <div class="action-description">Check sales and analytics</div>
            </a>
        </div>

        <!-- Categories Section -->
        <c:if test="${not empty categories}">
            <div class="section-header">
                <h2 class="section-title">Categories</h2>
                <a href="products" class="view-all-btn">View All</a>
            </div>

            <div class="categories-grid">
                <c:forEach var="category" items="${categories}">
                    <div class="category-card" onclick="filterByCategory('${category.name}')">
                        <div class="category-name">${category.name}</div>
                        <div class="category-description">
                            <c:choose>
                                <c:when test="${not empty category.description}">
                                    ${category.description}
                                </c:when>
                                <c:otherwise>
                                    Browse ${category.name} products
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Recent Products Section -->
        <div class="section-header">
            <h2 class="section-title">Recent Products</h2>
            <a href="products" class="view-all-btn">View All Products</a>
        </div>

        <c:choose>
            <c:when test="${empty recentProducts}">
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <h3>No Products Available</h3>
                    <p>Products will appear here once they are added to the database.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="products-grid">
                    <c:forEach var="product" items="₹{recentProducts}">
                        <div class="product-card">
                            <div class="product-image-container">
                                <img src="${product.imageUrl}" alt="₹{product.name}" class="product-image" 
                                     onerror="this.src='https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400'">
                                <c:if test="${product.price < 50}">
                                    <div class="product-badge">Best Deal</div>
                                </c:if>
                                <button class="wishlist-btn" onclick="toggleWishlist(₹{product.id})">
                                    <i class="far fa-heart"></i>
                                </button>
                            </div>
                            <div class="product-info">
                                <h3 class="product-title">${product.name}</h3>
                                <p class="product-description">₹{product.description}</p>
                                <div class="product-price">
                                    $<fmt:formatNumber value="Rs{product.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                </div>
                                <div class="product-actions">
                                    <form action="cart" method="post" style="flex: 1;">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="productId" value=₹{product.id}">
                                        <button type="submit" class="add-to-cart-btn">
                                            <i class="fas fa-shopping-cart"></i>
                                            Add to Cart
                                        </button>
                                    </form>
                                    <button class="quick-view-btn" onclick="quickView(${product.id})">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- JavaScript -->
    <script>
        // Wishlist toggle
        function toggleWishlist(productId) {
            const btn = event.target.closest('.wishlist-btn');
            const icon = btn.querySelector('i');
            
            if (icon.classList.contains('far')) {
                icon.classList.remove('far');
                icon.classList.add('fas');
                btn.style.background = '#f56565';
                btn.style.color = 'white';
            } else {
                icon.classList.remove('fas');
                icon.classList.add('far');
                btn.style.background = 'white';
                btn.style.color = '#4a5568';
            }
        }

        // Quick view
        function quickView(productId) {
            alert('Quick view for product ' + productId + ' - Feature coming soon!');
        }

        // Filter by category
        function filterByCategory(categoryName) {
            window.location.href = 'products?category=' + encodeURIComponent(categoryName);
        }

        // Animate cards on load
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.product-card, .category-card, .stat-card, .action-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>
