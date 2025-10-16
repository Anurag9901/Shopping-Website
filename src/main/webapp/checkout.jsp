<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - E-Commerce Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: #f8fafc;
            color: #1a202c;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 20px;
        }

        .checkout-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .checkout-header h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .breadcrumb {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
            color: #718096;
        }

        .breadcrumb-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .breadcrumb-item.active {
            color: #667eea;
            font-weight: 600;
        }

        .checkout-content {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 3rem;
        }

        .checkout-form {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .form-section {
            margin-bottom: 2rem;
        }

        .form-section h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 1rem;
            border-bottom: 2px solid #667eea;
            padding-bottom: 0.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #4a5568;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .order-summary {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            height: fit-content;
        }

        .order-summary h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .order-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .item-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }

        .item-quantity {
            color: #718096;
            font-size: 0.8rem;
        }

        .item-price {
            font-weight: 600;
            color: #2d3748;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 0.75rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .summary-total {
            display: flex;
            justify-content: space-between;
            padding: 1rem 0;
            font-size: 1.2rem;
            font-weight: bold;
            color: #2d3748;
            border-top: 2px solid #667eea;
        }

        .btn-checkout {
            width: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 16px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 1.5rem;
        }

        .btn-checkout:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .back-link {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            margin-bottom: 2rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .checkout-content {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="cart" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Cart
        </a>

        <div class="checkout-header">
            <h1>Checkout</h1>
            <div class="breadcrumb">
                <div class="breadcrumb-item">
                    <i class="fas fa-shopping-cart"></i>
                    Cart
                </div>
                <i class="fas fa-chevron-right"></i>
                <div class="breadcrumb-item active">
                    <i class="fas fa-credit-card"></i>
                    Checkout
                </div>
                <i class="fas fa-chevron-right"></i>
                <div class="breadcrumb-item">
                    <i class="fas fa-check-circle"></i>
                    Confirmation
                </div>
            </div>
        </div>

        <div class="checkout-content">
            <form class="checkout-form" action="checkout" method="post">
                <div class="form-section">
                    <h3><i class="fas fa-shipping-fast"></i> Shipping Information</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label>First Name *</label>
                            <input type="text" name="firstName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Last Name *</label>
                            <input type="text" name="lastName" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email Address *</label>
                        <input type="email" name="email" class="form-control" value="${sessionScope.userName}" required>
                    </div>
                    <div class="form-group">
                        <label>Phone Number *</label>
                        <input type="tel" name="phone" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address *</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>City *</label>
                            <input type="text" name="city" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>ZIP Code *</label>
                            <input type="text" name="zipCode" class="form-control" required>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3><i class="fas fa-credit-card"></i> Payment Information</h3>
                    <div class="form-group">
                        <label>Card Number *</label>
                        <input type="text" name="cardNumber" class="form-control" placeholder="1234 5678 9012 3456" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Expiry Date *</label>
                            <input type="text" name="expiryDate" class="form-control" placeholder="MM/YY" required>
                        </div>
                        <div class="form-group">
                            <label>CVV *</label>
                            <input type="text" name="cvv" class="form-control" placeholder="123" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Cardholder Name *</label>
                        <input type="text" name="cardholderName" class="form-control" required>
                    </div>
                </div>

                <button type="submit" class="btn-checkout">
                    <i class="fas fa-lock"></i> Place Order Securely
                </button>
            </form>

            <div class="order-summary">
                <h3>Order Summary</h3>
                
                <c:forEach var="item" items="${cart}">
                    <div class="order-item">
                        <img src="${item.product.imageUrl}" alt="${item.product.name}" class="item-image"
                             onerror="this.src='https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400'">
                        <div class="item-details">
                            <div class="item-name">${item.product.name}</div>
                            <div class="item-quantity">Qty: ${item.quantity}</div>
                        </div>
                        <div class="item-price">
                            $<fmt:formatNumber value="${item.product.price * item.quantity}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                        </div>
                    </div>
                </c:forEach>

                <div class="summary-row">
                    <span>Subtotal (${totalItems} items)</span>
                    <span>$<fmt:formatNumber value="${totalPrice}" type="number" minFractionDigits="2" maxFractionDigits="2"/></span>
                </div>
                
                <div class="summary-row">
                    <span>Shipping</span>
                    <span>
                        <c:choose>
                            <c:when test="${shipping == 0}">
                                <span style="color: #48bb78;">Free</span>
                            </c:when>
                            <c:otherwise>
                                $<fmt:formatNumber value="${shipping}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
                
                <div class="summary-row">
                    <span>Tax</span>
                    <span>$<fmt:formatNumber value="${tax}" type="number" minFractionDigits="2" maxFractionDigits="2"/></span>
                </div>

                <div class="summary-total">
                    <span>Total</span>
                    <span>$<fmt:formatNumber value="${finalTotal}" type="number" minFractionDigits="2" maxFractionDigits="2"/></span>
                </div>

                <div style="font-size: 0.9rem; color: #718096; text-align: center; margin-top: 1rem;">
                    <i class="fas fa-shield-alt"></i>
                    Your payment information is secure and encrypted
                </div>
            </div>
        </div>
    </div>

    <script>
        // Format card number input
        document.querySelector('input[name="cardNumber"]').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\s/g, '').replace(/[^0-9]/gi, '');
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
            e.target.value = formattedValue;
        });

        // Format expiry date
        document.querySelector('input[name="expiryDate"]').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            e.target.value = value;
        });

        // CVV validation
        document.querySelector('input[name="cvv"]').addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/\D/g, '').substring(0, 3);
        });
    </script>
</body>
</html>
