<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - E-Commerce Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Your existing CSS styles remain the same -->
    <style>
        /* All your existing styles remain unchanged */
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
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-links a:hover {
            opacity: 0.8;
        }

        .nav-links a.active {
            opacity: 0.9;
            font-weight: 600;
        }

        .logout-btn {
            background: transparent;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: opacity 0.3s;
        }

        .logout-btn:hover {
            opacity: 0.8;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 20px;
        }

        /* Page Header */
        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .page-subtitle {
            font-size: 1.1rem;
            color: #718096;
        }

        /* Search and Filter Bar */
        .filter-bar {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
            align-items: center;
            flex-wrap: wrap;
        }

        .search-box {
            flex: 1;
            min-width: 250px;
        }

        .search-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .search-input:focus {
            outline: none;
            border-color: #667eea;
        }

        .filter-select {
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            cursor: pointer;
            font-size: 1rem;
        }

        .sort-by {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Products Grid */
        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .products-count {
            color: #718096;
            font-size: 1rem;
        }

        .view-options {
            display: flex;
            gap: 0.5rem;
        }

        .view-btn {
            padding: 8px 12px;
            border: 2px solid #e2e8f0;
            background: white;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .view-btn.active {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        /* Product Card */
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

        /* Login Modal */
        .login-modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            backdrop-filter: blur(4px);
        }

        .login-modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 2rem;
            border-radius: 20px;
            width: 90%;
            max-width: 450px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
            position: relative;
            animation: modalSlideIn 0.3s ease-out;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .close-modal {
            position: absolute;
            top: 15px;
            right: 20px;
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }

        .close-modal:hover {
            color: #333;
        }

        .modal-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            color: white;
            font-size: 2rem;
        }

        .modal-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 1rem;
        }

        .modal-message {
            color: #718096;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .modal-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-outline {
            background: transparent;
            color: #667eea;
            border: 2px solid #667eea;
        }

        .btn-outline:hover {
            background: #667eea;
            color: white;
        }

        /* Messages */
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
        }

        .empty-icon {
            font-size: 4rem;
            color: #cbd5e0;
            margin-bottom: 1rem;
        }

        .empty-title {
            font-size: 1.5rem;
            color: #4a5568;
            margin-bottom: 0.5rem;
        }

        .empty-message {
            color: #718096;
        }

        /* User Status Indicator */
        .user-status {
            background: rgba(255,255,255,0.1);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }

            .nav-links {
                gap: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .page-title {
                font-size: 2rem;
            }

            .filter-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .products-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1rem;
            }

            .modal-buttons {
                flex-direction: column;
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
                    <li><a href="products" class="active"><i class="fas fa-box"></i> Products</a></li>
                    <li><a href="cart"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                    <c:choose>
                        <c:when test="${not empty sessionScope.userName}">
                            <li><a href="dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                            <li>
                                <div class="user-status">
                                    <i class="fas fa-user"></i>
                                    Welcome, ${sessionScope.userName}!
                                </div>
                            </li>
                            <li>
                                <form action="logout" method="get" style="display:inline;">
                                    <button type="submit" class="logout-btn">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </button>
                                </form>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                            <li><a href="signup.jsp"><i class="fas fa-user-plus"></i> Sign Up</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-title">Our Products</h1>
            <p class="page-subtitle">Discover amazing products at unbeatable prices</p>
        </div>

        <!-- Success/Error Messages -->
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

        <!-- Filter Bar -->
        <div class="filter-bar">
            <div class="search-box">
                <input type="text" class="search-input" placeholder="Search products..." id="searchInput">
            </div>
            <select class="filter-select" id="priceFilter">
                <option value="">All Prices</option>
                <option value="0-50">Under ₹50</option>
                <option value="50-100">₹50 - ₹100</option>
                <option value="100-200">₹100 - ₹200</option>
                <option value="200+">Over ₹200</option>
            </select>
            <div class="sort-by">
                <label>Sort by:</label>
                <select class="filter-select" id="sortBy">
                    <option value="name">Name</option>
                    <option value="price-low">Price: Low to High</option>
                    <option value="price-high">Price: High to Low</option>
                    <option value="newest">Newest</option>
                </select>
            </div>
        </div>

        <!-- Products Header -->
        <div class="products-header">
            <div class="products-count">
                Showing ${totalProducts} products
            </div>
            <div class="view-options">
                <button class="view-btn active" data-view="grid">
                    <i class="fas fa-th"></i>
                </button>
                <button class="view-btn" data-view="list">
                    <i class="fas fa-list"></i>
                </button>
            </div>
        </div>

        <!-- Products Grid -->
        <c:choose>
            <c:when test="${empty products}">
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <h2 class="empty-title">No Products Found</h2>
                    <p class="empty-message">We couldn't find any products. Please check back later!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="products-grid" id="productsGrid">
                    <c:forEach var="product" items="${products}">
                        <div class="product-card" data-price="${product.price}" data-name="${product.name}">
                            <div class="product-image-container">
                                <img src="${product.imageUrl}" alt="${product.name}" class="product-image" 
                                     onerror="this.src='https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400'">
                                <c:if test="${product.price < 50}">
                                    <div class="product-badge">Best Deal</div>
                                </c:if>
                                <button class="wishlist-btn" onclick="toggleWishlist(${product.id})">
                                    <i class="far fa-heart"></i>
                                </button>
                            </div>
                            <div class="product-info">
                                <h3 class="product-title">${product.name}</h3>
                                <p class="product-description">${product.description}</p>
                                <div class="product-price">
                                    ₹<fmt:formatNumber value="${product.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                </div>
                                <div class="product-actions">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.userName}">
                                            <form action="cart" method="post" style="flex: 1;">
                                                <input type="hidden" name="action" value="add">
                                                <input type="hidden" name="productId" value="${product.id}">
                                                <button type="submit" class="add-to-cart-btn">
                                                    <i class="fas fa-shopping-cart"></i>
                                                    Add to Cart
                                                </button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="add-to-cart-btn" onclick="showLoginModal(${product.id}, '${product.name}')">
                                                <i class="fas fa-shopping-cart"></i>
                                                Add to Cart
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
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

    <!-- Login Required Modal -->
    <div id="loginModal" class="login-modal">
        <div class="login-modal-content">
            <span class="close-modal" onclick="closeLoginModal()">&times;</span>
            <div class="modal-icon">
                <i class="fas fa-lock"></i>
            </div>
            <h2 class="modal-title">Login Required</h2>
            <p class="modal-message">
                Please login to add "<span id="productName"></span>" to your cart and make purchases.
            </p>
            <div class="modal-buttons">
                <a href="login.jsp" class="btn btn-primary">
                    <i class="fas fa-sign-in-alt"></i>
                    Login Now
                </a>
                <a href="signup.jsp" class="btn btn-outline">
                    <i class="fas fa-user-plus"></i>
                    Create Account
                </a>
            </div>
            <p style="margin-top: 1.5rem; font-size: 0.9rem; color: #718096;">
                <i class="fas fa-info-circle"></i>
                Don't worry! You can browse all products without an account.
            </p>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        let currentProductId = null;

        // Show login modal with product context
        function showLoginModal(productId, productName) {
            currentProductId = productId;
            document.getElementById('productName').textContent = productName;
            document.getElementById('loginModal').style.display = 'block';
            document.body.style.overflow = 'hidden';
        }

        // Close login modal
        function closeLoginModal() {
            document.getElementById('loginModal').style.display = 'none';
            document.body.style.overflow = 'auto';
            currentProductId = null;
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('loginModal');
            if (event.target == modal) {
                closeLoginModal();
            }
        }

        // Escape key to close modal
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeLoginModal();
            }
        });

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const products = document.querySelectorAll('.product-card');
            
            products.forEach(product => {
                const title = product.querySelector('.product-title').textContent.toLowerCase();
                const description = product.querySelector('.product-description').textContent.toLowerCase();
                
                if (title.includes(searchTerm) || description.includes(searchTerm)) {
                    product.style.display = 'flex';
                } else {
                    product.style.display = 'none';
                }
            });
            
            updateProductCount();
        });

        // Price filter
        document.getElementById('priceFilter').addEventListener('change', function(e) {
            const filterValue = e.target.value;
            const products = document.querySelectorAll('.product-card');
            
            products.forEach(product => {
                const price = parseFloat(product.dataset.price);
                let show = true;
                
                if (filterValue === '0-50' && price >= 50) show = false;
                else if (filterValue === '50-100' && (price < 50 || price >= 100)) show = false;
                else if (filterValue === '100-200' && (price < 100 || price >= 200)) show = false;
                else if (filterValue === '200+' && price < 200) show = false;
                
                product.style.display = show ? 'flex' : 'none';
            });
            
            updateProductCount();
        });

        // Sort functionality
        document.getElementById('sortBy').addEventListener('change', function(e) {
            const sortValue = e.target.value;
            const grid = document.getElementById('productsGrid');
            const products = Array.from(document.querySelectorAll('.product-card'));
            
            products.sort((a, b) => {
                switch(sortValue) {
                    case 'name':
                        return a.dataset.name.localeCompare(b.dataset.name);
                    case 'price-low':
                        return parseFloat(a.dataset.price) - parseFloat(b.dataset.price);
                    case 'price-high':
                        return parseFloat(b.dataset.price) - parseFloat(a.dataset.price);
                    default:
                        return 0;
                }
            });
            
            products.forEach(product => grid.appendChild(product));
        });

        // View toggle
        document.querySelectorAll('.view-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelector('.view-btn.active').classList.remove('active');
                this.classList.add('active');
                
                const view = this.dataset.view;
                const grid = document.getElementById('productsGrid');
                
                if (view === 'list') {
                    grid.style.gridTemplateColumns = '1fr';
                } else {
                    grid.style.gridTemplateColumns = 'repeat(auto-fill, minmax(280px, 1fr))';
                }
            });
        });

        // Wishlist toggle
        function toggleWishlist(productId) {
            const btn = event.target.closest('.wishlist-btn');
            const icon = btn.querySelector('i');
            
            if (icon.classList.contains('far')) {
                icon.classList.remove('far');
                icon.classList.add('fas');
                btn.style.background = '#f56565';
                btn.style.color = 'white';
                
                showNotification('Added to wishlist!', 'success');
            } else {
                icon.classList.remove('fas');
                icon.classList.add('far');
                btn.style.background = 'white';
                btn.style.color = '#4a5568';
                
                showNotification('Removed from wishlist!', 'info');
            }
        }

        // Quick view
        function quickView(productId) {
            showNotification('Quick view feature coming soon!', 'info');
        }

        // Update product count
        function updateProductCount() {
            const visibleProducts = document.querySelectorAll('.product-card[style*="flex"], .product-card:not([style])').length;
            document.querySelector('.products-count').textContent = 'Showing ' + visibleProducts + ' products';
        }

        // Notification system
        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.className = 'notification notification-' + type;
            
            const iconClass = type === 'success' ? 'check-circle' : 'info-circle';
            notification.innerHTML = '<i class="fas fa-' + iconClass + '"></i> ' + message;
            
            const bgColor = type === 'success' ? '#48bb78' : '#667eea';
            notification.style.cssText = 
                'position: fixed; top: 20px; right: 20px; background: ' + bgColor + '; ' +
                'color: white; padding: 1rem 1.5rem; border-radius: 8px; ' +
                'box-shadow: 0 4px 12px rgba(0,0,0,0.3); z-index: 3000; ' +
                'display: flex; align-items: center; gap: 0.5rem; ' +
                'animation: slideInRight 0.3s ease-out;';
            
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.style.animation = 'slideOutRight 0.3s ease-in forwards';
                setTimeout(() => {
                    if (document.body.contains(notification)) {
                        document.body.removeChild(notification);
                    }
                }, 300);
            }, 3000);
        }

        // Add animation styles
        const style = document.createElement('style');
        style.textContent = 
            '@keyframes slideInRight { from { transform: translateX(100%); opacity: 0; } to { transform: translateX(0); opacity: 1; } } ' +
            '@keyframes slideOutRight { from { transform: translateX(0); opacity: 1; } to { transform: translateX(100%); opacity: 0; } }';
        document.head.appendChild(style);

        // Add smooth scrolling and animations on load
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.product-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 50);
            });
        });
    </script>
</body>
</html>
