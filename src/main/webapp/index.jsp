<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Store - Home</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            line-height: 1.6;
            color: #1a1a1a;
            background-color: #ffffff;
        }

        /* Header */
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid #f0f0f0;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 70px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #667eea;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .search-container {
            flex: 1;
            max-width: 500px;
            margin: 0 40px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 12px 50px 12px 20px;
            border: 2px solid #f0f0f0;
            border-radius: 50px;
            font-size: 14px;
            outline: none;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .search-btn {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            background: #667eea;
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            background: #5a6fd8;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .nav-link {
            text-decoration: none;
            color: #666;
            font-weight: 500;
            font-size: 14px;
            transition: color 0.3s ease;
            position: relative;
        }

        .nav-link:hover {
            color: #667eea;
        }

        .cart-icon {
            position: relative;
        }

        .cart-count {
            position: absolute;
            -top: -8px;
            right: -8px;
            background: #ff4757;
            color: white;
            font-size: 12px;
            font-weight: 600;
            padding: 2px 6px;
            border-radius: 10px;
            min-width: 18px;
            text-align: center;
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
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

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 120px 0 80px;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" fill="rgba(255,255,255,0.1)"><polygon points="1000,100 1000,0 0,100"/></svg>');
            background-size: cover;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 2;
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.3rem;
            margin-bottom: 40px;
            opacity: 0.9;
            font-weight: 300;
        }

        .hero-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-hero {
            padding: 15px 35px;
            font-size: 16px;
            border-radius: 30px;
        }

        .btn-white {
            background: white;
            color: #667eea;
        }

        .btn-white:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* Features Section */
        .features {
            padding: 80px 0;
            background: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-title h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1a1a1a;
            margin-bottom: 15px;
        }

        .section-title p {
            font-size: 1.1rem;
            color: #666;
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
        }

        .feature-card {
            background: white;
            padding: 40px 30px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 2rem;
            color: white;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: #1a1a1a;
        }

        .feature-card p {
            color: #666;
            line-height: 1.6;
        }

        /* Categories Section */
        .categories {
            padding: 80px 0;
            background: white;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
        }

        .category-card {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 20px;
            padding: 40px 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            color: inherit;
        }

        .category-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #667eea;
        }

        .category-card h3 {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .category-card p {
            color: #666;
            font-size: 0.9rem;
        }

        /* CTA Section */
        .cta {
            background: linear-gradient(135deg, #1a1a1a 0%, #2d3748 100%);
            color: white;
            padding: 80px 0;
            text-align: center;
        }

        .cta h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .cta p {
            font-size: 1.2rem;
            margin-bottom: 40px;
            opacity: 0.9;
        }

        /* Newsletter */
        .newsletter {
            padding: 80px 0;
            background: #f8f9fa;
            text-align: center;
        }

        .newsletter-form {
            max-width: 500px;
            margin: 0 auto;
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .newsletter-input {
            flex: 1;
            padding: 15px 20px;
            border: 2px solid #e9ecef;
            border-radius: 50px;
            font-size: 16px;
            outline: none;
        }

        .newsletter-input:focus {
            border-color: #667eea;
        }

        /* Footer */
        .footer {
            background: #1a1a1a;
            color: #ccc;
            padding: 60px 0 30px;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-section h3 {
            color: white;
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
            color: #667eea;
        }

        .footer-bottom {
            border-top: 1px solid #333;
            padding-top: 30px;
            text-align: center;
            color: #999;
        }

        .social-links {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        .social-link {
            width: 45px;
            height: 45px;
            background: #333;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .social-link:hover {
            background: #667eea;
            transform: translateY(-3px);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-container {
                padding: 0 15px;
            }

            .search-container {
                display: none;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.1rem;
            }

            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }

            .features-grid,
            .categories-grid {
                grid-template-columns: 1fr;
            }

            .newsletter-form {
                flex-direction: column;
            }
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.8s ease forwards;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="nav-container">
            <a href="home" class="logo">
                <i class="fas fa-shopping-bag"></i>
                E-Commerce
            </a>

            <div class="search-container">
                <form action="products" method="get">
                    <input type="text" name="search" class="search-input" placeholder="Search products...">
                    <button type="submit" class="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>

            <nav class="nav-links">
                <a href="products" class="nav-link">Products</a>
                <a href="cart" class="nav-link cart-icon">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="cart-count">0</span>
                </a>

                <div class="user-menu">
                    <%
                        HttpSession sessionObj = request.getSession(false);
                        if (sessionObj != null && sessionObj.getAttribute("userName") != null) {
                    %>
                        <a href="dashboard" class="nav-link">
                            <i class="fas fa-user"></i>
                            <%= sessionObj.getAttribute("userName") %>
                        </a>
                        <a href="logout" class="btn btn-outline">Logout</a>
                    <%
                        } else {
                    %>
                        <a href="login.jsp" class="nav-link">Login</a>
                        <a href="signup.jsp" class="btn btn-primary">Sign Up</a>
                    <%
                        }
                    %>
                </div>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content fade-in-up">
            <h1>Discover Amazing Products</h1>
            <p>Shop the latest trends with unbeatable prices and fast delivery</p>
            <div class="hero-buttons">
                <a href="products" class="btn btn-white btn-hero">
                    <i class="fas fa-shopping-bag"></i>
                    Shop Now
                </a>
                <a href="#categories" class="btn btn-outline btn-hero" style="color: white; border-color: white;">
                    <i class="fas fa-compass"></i>
                    Explore Categories
                </a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <div class="section-title">
                <h2>Why Choose Us</h2>
                <p>We provide the best shopping experience with quality products and excellent service</p>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shipping-fast"></i>
                    </div>
                    <h3>Fast Delivery</h3>
                    <p>Get your orders delivered quickly with our express shipping options</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3>Secure Payment</h3>
                    <p>Shop with confidence using our secure payment gateway and data protection</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <h3>24/7 Support</h3>
                    <p>Our customer support team is available round the clock to help you</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-undo"></i>
                    </div>
                    <h3>Easy Returns</h3>
                    <p>Not satisfied? Return your products hassle-free within 30 days</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories" id="categories">
        <div class="container">
            <div class="section-title">
                <h2>Shop by Category</h2>
                <p>Explore our wide range of product categories</p>
            </div>
            <div class="categories-grid">
                <a href="products?category=electronics" class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-laptop"></i>
                    </div>
                    <h3>Electronics</h3>
                    <p>Latest gadgets & devices</p>
                </a>
                <a href="products?category=clothing" class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-tshirt"></i>
                    </div>
                    <h3>Fashion</h3>
                    <p>Trendy clothes & accessories</p>
                </a>
                <a href="products?category=home" class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <h3>Home & Living</h3>
                    <p>Furniture & home decor</p>
                </a>
                <a href="products?category=sports" class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-dumbbell"></i>
                    </div>
                    <h3>Sports</h3>
                    <p>Fitness & outdoor gear</p>
                </a>
                <a href="products?category=books" class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <h3>Books</h3>
                    <p>Educational & entertainment</p>
                </a>
                <a href="products?category=beauty" class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-spa"></i>
                    </div>
                    <h3>Beauty</h3>
                    <p>Skincare & cosmetics</p>
                </a>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="container">
            <h2>Ready to Start Shopping?</h2>
            <p>Join thousands of satisfied customers and discover amazing products today</p>
            <a href="products" class="btn btn-primary btn-hero">
                <i class="fas fa-arrow-right"></i>
                Browse All Products
            </a>
        </div>
    </section>

    <!-- Newsletter Section -->
    <section class="newsletter">
        <div class="container">
            <div class="section-title">
                <h2>Stay Updated</h2>
                <p>Subscribe to our newsletter for exclusive deals and latest updates</p>
            </div>
            <form class="newsletter-form" onsubmit="alert('Newsletter subscription coming soon!'); return false;">
                <input type="email" class="newsletter-input" placeholder="Enter your email address" required>
                <button type="submit" class="btn btn-primary">Subscribe</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>E-Commerce Store</h3>
                    <p>Your trusted online shopping destination for quality products at great prices.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="products">All Products</a></li>
                        <li><a href="#categories">Categories</a></li>
                        <li><a href="#">Best Sellers</a></li>
                        <li><a href="#">New Arrivals</a></li>
                        <li><a href="#">Sale Items</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Customer Service</h3>
                    <ul>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Shipping Info</a></li>
                        <li><a href="#">Returns</a></li>
                        <li><a href="#">Size Guide</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Account</h3>
                    <ul>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="signup.jsp">Create Account</a></li>
                        <li><a href="dashboard">My Account</a></li>
                        <li><a href="cart">Shopping Cart</a></li>
                        <li><a href="#">Wishlist</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <%= java.time.Year.now() %> E-Commerce Store. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Header scroll effect
        window.addEventListener('scroll', function() {
            const header = document.querySelector('.header');
            if (window.scrollY > 100) {
                header.style.background = 'rgba(255, 255, 255, 0.98)';
                header.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.1)';
            } else {
                header.style.background = 'rgba(255, 255, 255, 0.95)';
                header.style.boxShadow = 'none';
            }
        });

        // Animation on scroll
        const observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('fade-in-up');
                }
            });
        }, observerOptions);

        document.querySelectorAll('.feature-card, .category-card').forEach(el => {
            observer.observe(el);
        });
    </script>
</body>
</html>
