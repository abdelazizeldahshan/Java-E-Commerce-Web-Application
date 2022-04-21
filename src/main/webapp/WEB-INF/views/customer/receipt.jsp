<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Furnitica - Minimalist Furniture HTML Template</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <%@ include file="../includes/customer-head.jsp" %>
    <style>

        .nivoSlider{
            height: 600px !important;
        }
        .img-responsive{
            display: block !important;
            position: relative !important;
            width: 100% !important;
            height: 100% !important;
            animation-delay: .1ms;
            animation-duration: .1ms;
        }

        @media screen and (max-width: 991px) {
            .nivoSlider {
                z-index: 2;
                height: 300px !important;
            }
        }

        body {
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            text-align: center;
            color: #777;
        }

        body h1 {
            font-weight: 300;
            margin-bottom: 0px;
            padding-bottom: 0px;
            color: #000;
        }

        body h3 {
            font-weight: 300;
            margin-top: 10px;
            margin-bottom: 20px;
            font-style: italic;
            color: #555;
        }

        body a {
            color: #06f;
        }

        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }

        .invoice-box table {
            width: 100%;
            line-height: inherit;
            text-align: left;
            border-collapse: collapse;
        }

        .invoice-box table td {
            padding: 5px;
            vertical-align: top;
        }

        .invoice-box table tr td:nth-child(2) {
            text-align: right;
        }

        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.top table td.title {
            font-size: 45px;
            line-height: 45px;
            color: #333;
        }

        .invoice-box table tr.information table td {
            padding-bottom: 40px;
        }

        .invoice-box table tr.heading td {
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }

        .invoice-box table tr.details td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.item td {
            border-bottom: 1px solid #eee;
        }

        .invoice-box table tr.item.last td {
            border-bottom: none;
        }

        .invoice-box table tr.total td:nth-child(2) {
            border-top: 2px solid #eee;
            font-weight: bold;
        }

        @media only screen and (max-width: 600px) {
            .invoice-box table tr.top table td {
                width: 100%;
                display: block;
                text-align: center;
            }

            .invoice-box table tr.information table td {
                width: 100%;
                display: block;
                text-align: center;
            }
        }


    </style>
</head>

<body id="home" >

<%@ include file="../includes/customer-header.jsp" %>
<div style="padding: 100px"></div>
<div class="invoice-box">
    <table>
        <tr class="top">
            <td colspan="2">
                <table>
                    <tr>
                        <td class="title">
                            <img src="./images/logo.png" alt="Company logo" style="width: 100%; max-width: 300px" />
                        </td>

                        <td>
                            Invoice #: ${order.getId()}<br/>
                            Created:  ${order.getCreatedAt()}<br/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="information">
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            ${order.getCustomer().getAddress().getArea()}.<br/> Building Number , ${order.getCustomer().getAddress().getBuildingNum()} , ${order.getCustomer().getAddress().getStreet()}<br/> Floor number ,${order.getCustomer().getAddress().getFloorNum()}
                        </td>

                        <td>
                            ${order.getCustomer().getUsername()}.<br />
                                ${order.getCustomer().getEmail()}
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="heading">
            <td>Payment Method</td>
            <td></td>
            <td></td>
            <td>Stripe</td>
        </tr>

        <tr class="details">
            <td>Credit card</td>
        </tr>

        <tr class="heading">
            <td>Prdoducts</td>
            <td>Quntity</td>
            <td>Price</td>
            <td>total price</td>
        </tr>
        <c:forEach var="products" items="${order.getOrderProducts()}">
        <tr class="item">
            <td>${products.getProduct().getProductName()}</td>
            <td>${products.getQuantity()}</td>
            <td>${products.getProduct().getPrice()}</td>
            <td>${products.getTotal()}</td>
        </tr>
        </c:forEach>
        <tr class="total">
            <td>Total amount :${order.getTotalPrice()}</td>
        </tr>
    </table>
</div>
<%@ include file="../includes/customer-mobile-menu.jsp" %>
<%@ include file="../includes/customer-footer.jsp" %>
<%@ include file="../includes/customer-script.jsp" %>

</body>


<!-- index06:45-->
</html>