<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - E-Commerce Store</title>
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .confirmation-container {
            max-width: 600px;
            background: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            text-align: center;
        }

        .success-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            animation: scaleIn 0.5s ease-out;
        }

        .success-icon i {
            font-size: 3rem;
            color: white;
        }

        .confirmation-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 1rem;
        }

        .confirmation-message {
            font-size: 1.2rem;
            color: #718096;
            margin-bottom: 2rem;
        }

        .order-details {
            background: #f7fafc;
            padding: 2rem;
            border-radius: 12px;
            margin: 2rem 0;
            text-align: left;
        }

        .order-detail-row {
            display: flex;
            justify-content: space-between;
            padding: 0.75rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .order-detail-row:last-child {
            border-bottom: none;
            font-weight: bold;
            color: #2d3748;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
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

        @keyframes scaleIn {
            0% {
                transform: scale(0);
            }
            100% {
                transform: scale(1);
            }
        }

        .order-tracking {
            background: #e6fffa;
            border: 2px solid #38b2ac;
            border-radius: 12px;
            padding: 1.5rem;
            margin: 2rem 0;
            color: #234e52;
        }

        .tracking-title {
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>

        <h1 class="confirmation-title">Order Confirmed!</h1>
        <p class="confirmation-message">
            Thank you for your purchase! Your order has been successfully placed and is being processed.
        </p>

        <div class="order-details">
            <div class="order-detail-row">
                <span>Order Number:</span>
                <span><strong>${sessionScope.orderNumber}</strong></span>
            </div>
            <div class="order-detail-row">
                <span>Customer:</span>
                <span>${sessionScope.userName}</span>
            </div>
            <div class="order-detail-row">
                <span>Items:</span>
                <span>${sessionScope.orderItems} item(s)</span>
            </div>
            <div class="order-detail-row">
                <span>Total Amount:</span>
                <span>$<fmt:formatNumber value="${sessionScope.orderTotal}" type="number" minFractionDigits="2" maxFractionDigits="2"/></span>
            </div>
        </div>

        <div class="order-tracking">
            <div class="tracking-title">
                <i class="fas fa-truck"></i> Order Tracking
            </div>
            <p>Your order will be shipped within 2-3 business days. You will receive a tracking email once your order is dispatched.</p>
        </div>

        <div class="action-buttons">
            <a href="products" class="btn btn-primary">
                <i class="fas fa-shopping-bag"></i>
                Continue Shopping
            </a>
            <a href="dashboard" class="btn btn-outline">
                <i class="fas fa-user"></i>
                My Account
            </a>
        </div>

        <div style="margin-top: 2rem; color: #718096; font-size: 0.9rem;">
            <p>A confirmation email has been sent to your registered email address.</p>
            <p>Need help? <a href="#" style="color: #667eea;">Contact our support team</a></p>
        </div>
    </div>

    <script>
        // Clear order data from session after displaying
        <% 
            session.removeAttribute("orderNumber");
            session.removeAttribute("orderTotal");
            session.removeAttribute("orderItems");
        %>
    </script>
</body>
</html>
