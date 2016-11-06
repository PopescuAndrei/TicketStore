<%-- 
    Document   : shoppingCart
    Created on : May 24, 2015, 8:21:16 PM
    Author     : Andrei
--%>

<%@page import="com.wad.ticketstore.dao.EventsDAO"%>
<%@page import="com.wad.ticketstore.dao.TicketsDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.wad.ticketstore.domain.Ticket"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/errorcss.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <title>Ticket Ninja</title>
    </head>
    <%HashMap<Ticket, Integer> shoppingCart = (HashMap<Ticket, Integer>) session.getAttribute("shoppingCart"); %>"
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">

        <div class="container-fluid">
            <div class="navbar-header logo">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button><a class="navbar-brand" href="index.jsp"><span>
                        <img src="img/logo.png" style="max-width:50px; margin-top: -7px;">Ticket Ninja</span>
                </a>
            </div>   
            <div class="collapse navbar-collapse" id="nav-collapse">
                <ul class="nav navbar-nav">
                    <li class="btn btn-toolbar" role="presentation"><a href="browse.jsp"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>Browse</a></li>
                    <li class="btn btn-toolbar" role="presentation"><a href="music.jsp"><span class="glyphicon glyphicon-music" aria-hidden="true"></span>Music</a></li>
                    <li class="btn btn-toolbar" role="presentation"><a href="sports.jsp"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>Sports</a></li>
                    <li class="btn btn-toolbar" role="presentation"><a href="lifestyle.jsp"><span class="glyphicon glyphicon-queen" aria-hidden="true"></span>Lifestyle</a></li>
                </ul>
                <!-- Individual Navbar elements -->
                <ul class="nav navbar-nav navbar-right">
                    <%if ((!session.isNew()) && session.getAttribute("username") != null) {
                    %>
                    <li class="dropdown btn btn-toolbar" role="presentation">
                        <a href="#" class="btn btn-toolbar" data-toggle="dropdown" role="presentation" aria-expanded="false"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true">Menu<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="myaccount.jsp">My Account</a></li>
                            <li><a href="shoppingCart.jsp">Shopping Cart</a></li>
                            <li><a href="logout">Sign out</a></li>
                        </ul>
                    </li>

                    <%} else {%>
                    <li class="btn btn-toolbar" role="presentation" data-toggle="modal" data-target="#registerModal"><a href="#"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Sign up</a></li>
                    <li class="btn btn-toolbar" role="presentation" data-toggle="modal" data-target="#loginModal"><a href="#"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Login</a></li>
                        <%}%>
                </ul>
            </div> 
        </div> <!-- Container fluid-->
    </nav>
        <hr><hr><hr>
        <div class="container">
            <div class="panel panel-default">

                <div class="panel-heading">Shopping Cart</div>

                <form name = "orderForm" if="orderForm" role="form" method="post" action="/order">
                    <table class="table">
                        <thead>
                        <td colspan="3"> Product</td>
                        <td>Price</td>
                        <td>Category</td>
                        <td>Subtotal</td>
                        </thead>
                        <tbody>
                            <%if (!shoppingCart.isEmpty()) {
                                for (Map.Entry<Ticket, Integer> entry : shoppingCart.entrySet()) {%>
                        <td colspan="3"><%=new EventsDAO().findEventById(Integer.toString(entry.getValue())).getEventName()%></td>
                        <td><%=entry.getKey().getPrice()%></td>
                        <td><%=entry.getKey().getCategory()%></td>
                        <td><%=(entry.getKey().getPrice())%></td>
                        <%}
                    } else {%>
                        <td colspan="4" style="text-align: center">Shopping Cart is empty</td>
                        <%}%>
                        </tbody>
                    </table>

                    <input type="button" class="form-control btn btn-primar" name="order" id="order" value="Order">
                </form>
            </div>
        </div>

        <hr>
        <div id="footerwrap">
            <div class="container">
                <div class="row centered">
                    <div class="col-lg-4">
                        <li><a href="contact.jsp"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Contact</a></li>
                    </div>

                    <div class="col-lg-4">
                        <li><a href="about.jsp"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>About Us</a></li>
                    </div>
                    <div class="col-lg-4">
                        <p>Copyright &copy; TicketNinja</p>
                    </div>
                </div>
            </div>
        </div><!-- /footerwrap -->
    </body>
    <script type="text/javascript" src="scripts/jquery-2.1.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
</html>
