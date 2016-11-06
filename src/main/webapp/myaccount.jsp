<%-- 
    Document   : myaccount
    Created on : May 24, 2015, 11:43:44 PM
    Author     : Topo
--%>

<%@page import="com.wad.ticketstore.dao.PurchaseDAO"%>
<%@page import="com.wad.ticketstore.domain.Purchase"%>
<%@page import="com.wad.ticketstore.dao.UserDAO"%>
<%@page import="com.wad.ticketstore.domain.User"%>
<%@page import="com.wad.ticketstore.domain.User"%>
<%@page import="com.wad.ticketstore.dao.TicketsDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.wad.ticketstore.dao.EventsDAO"%>
<%@page import="com.wad.ticketstore.dao.EventsDAO"%>
<%@page import="com.wad.ticketstore.domain.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <title>Browse Tickets</title>
    </head>
    <body>
        <%User currentUser = new UserDAO().getCurrentUser(session.getAttribute("username").toString());%>
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

    <div class="seatgeek-splash">
        <div class="block-shade"></div>
        <div class="row carousel-holder">
            <div id="carousel-example-generic" class="carousel slide"data-ride="carousel" style="height: 300px; overflow: hidden">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img class="slide-image" src="img/pic10.jpg"  alt="">
                    </div>
                    <div class="item">
                        <img class="slide-image" src="img/pic20.jpg" alt="">
                    </div>
                    <div class="item">
                        <img class="slide-image" src="img/pic30.jpg" alt="">
                    </div>
                    <div class="item">
                        <img class="slide-image" src="img/pic4.jpg" alt="">
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
                <div class="upwards-shade"></div>
                <div class="left-shade"></div>
                <div class="main-clear-space"></div>
                <div class="right-shade"></div>
            </div>
        </div>
        <div class="block-shade"></div>
    </div>

    <!-- Page Content -->
    <div class="container">


        <hr>

        <h1> <strong>About me </strong> </h1>

        <hr>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Details</h3>
                    </div>
                    <div class="panel-body">
                        <p>First name: <span><%=currentUser.getFirstName()%></span></p>
                        <p>Last name: <span><%=currentUser.getLastName()%></span></p>
                        <p>Username: <span><%=currentUser.getUserName()%></span></p>
                        <p>Address: <span><%=currentUser.getAddress()%></span></p>
                        <p>Phone: <span><%=currentUser.getPhoneNumber()%></span></p>
                        <p>Email: <span><%=currentUser.getEmail()%></span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-success">
                    <!-- Default panel contents -->
                    <div class="panel-heading">My purchases</div>

                    <!-- List group -->
                    <%//List<Purchase> purchases = new PurchaseDAO().getAllPurchasesForUser(currentUser.getUserName());%>
                    <ul class="list-group">
                        <%//for (Purchase purchase : purchases) {%>
                        <li class="list-group-item"><%//=purchase.toString()%>Purchase 1</li>
                        <li class="list-group-item"><%//=purchase.toString()%>Purchase 2</li>
                        <li class="list-group-item"><%//=purchase.toString()%>Purchase 3</li>
                        <li class="list-group-item"><%//=purchase.toString()%>Purchase 4</li>
                        <li class="list-group-item"><%//=purchase.toString()%>Purchase 5</li>
                            <%//}%>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- /.container -->

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
