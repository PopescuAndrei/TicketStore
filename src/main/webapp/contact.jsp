<%-- 
    Document   : contact
    Created on : May 24, 2015, 3:12:35 PM
    Author     : Topo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.wad.ticketstore.dao.EventsDAO"%>
<%@page import="com.wad.ticketstore.dao.EventsDAO"%>
<%@page import="com.wad.ticketstore.domain.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <title>Contact Us</title>
    </head>
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
        <div class="row" >
            <div class="col-lg-12">
                <h1 class="page-header">Contact Us</h1>
            </div>
        </div>
        <div class="row">
            <form name = "feedbackForm" role="form" method="POST" action="feedback">
                <div class="row">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name: " >
                            <label for="name" class="input-group-addon glyphicon glyphicon-user" ></label>
                        </div>
                    </div> <!-- /.form-group -->
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <textarea style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" name="message" id="message" required></textarea>
                        <label for="message"></label>
                    </div>
                </div>
        </div>
        <div class="modal-footer">
            <button class="form-control btn btn-primary">Submit Feedback</button>
        </div> <!-- /.modal-footer -->
    </form>
</div>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Log in</h4>
            </div> <!-- /.modal-header -->

            <div class="modal-body">
                <form name = "registerForm" role="form" onsubmit="return validate()" method="POST" action="register">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name: " >
                                    <label for="firstName" class="input-group-addon glyphicon glyphicon-user" ></label>
                                    <span id="firstname-error" class="error-output"></span>
                                </div>
                            </div> <!-- /.form-group -->
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" name = "lastName" id="lastName" placeholder="Last Name: ">
                                    <label for="lastName" class="input-group-addon glyphicon glyphicon-user" size="35"></label>
                                    <span id="lastname-error" class="error-output"></span>
                                </div>
                            </div> <!-- /.form-group -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="username" id="username" placeholder="Username: ">
                                    <label for="username" class="input-group-addon glyphicon glyphicon-user"></label>
                                    <span id="username-error" class="error-output"></span>
                                </div>
                            </div> <!-- /.form-group -->
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email: ">
                                    <label for="email" class="input-group-addon glyphicon glyphicon-envelope"></label>
                                    <span id="email-error" class="error-output"></span>
                                </div>
                            </div> <!-- /.form-group -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="password" class="form-control" name = "passwordRegister" id="passwordRegister" placeholder="Password: ">
                                    <label for="passwordRegister" class="input-group-addon glyphicon glyphicon-lock"></label>
                                    <span id="pass-error" class="error-output"></span>
                                </div> <!-- /.input-group -->
                            </div> <!-- /.form-group -->
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="password" class="form-control" name="repeatPasswordRegister" id="repeatPasswordRegister" placeholder="Repeat Password: ">
                                    <label for="repeatPasswordRegister" class="input-group-addon glyphicon glyphicon-lock"></label>
                                    <span id="repeatpass-error" class="error-output"></span>
                                </div> <!-- /.input-group -->
                            </div> <!-- /.form-group -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Address: ">
                                    <label for="address" class="input-group-addon glyphicon glyphicon-road"></label>
                                    <span id="address-error" class="error-output"></span>
                                </div>
                            </div> <!-- /.form-group -->
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number: ">
                                    <label for="phone" class="input-group-addon glyphicon glyphicon-phone"></label>
                                    <span id="phone-error" class="error-output"></span>
                                </div>
                            </div> <!-- /.form-group -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="form-control btn btn-primary">Register</button>
                    </div> <!-- /.modal-footer -->
                </form>
            </div> <!-- /.modal-body -->
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script type="text/javascript" src="scripts/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="scripts/bootstrap.min.js"></script>
</html>
