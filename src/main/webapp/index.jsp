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
        <link href="css/errorcss.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <title>Ticket Ninja</title>
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
                    <%if ((!session.isNew()) && session.getAttribute("username") != null && !(session.getAttribute("username").equals("Guest"))) {
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

    <div id="headerwrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                    <h2>
                        Millions of tickets in one place.</h2>
                    <h3>Find sports, concert and many other events tickets.</h3>
                </div>
            </div><!--/row -->
        </div> <!-- /container -->
    </div><!-- /headerwrap -->



    <!-- Features -->
    <section class="container space-before">

        <div class="row featurelist space-after">
            <div class="col-md-5 col-sm-6 col-md-push-1 ">
                <img class="img-feature img-responsive" src="img/icons.png" alt="Sample image">
            </div>
            <div class="col-md-5 col-md-push-1 col-sm-6">
                <h2 class="space-before">Search tickets</h2>
                <h3> The largest inventory on the web </h3>
                <p> Ticket Ninja is a ticket search engine that makes finding tickets to live entertainment a cinch. We search dozens of the biggest ticket sites and present the results all in one place.</p>
            </div>
        </div>

        <div class="row featurelist space-after">
            <div class="col-md-5 col-sm-6 col-sm-push-6">
                <img class="img-feature img-responsive" src="img/coupon.png" alt="Sample image">
            </div>
            <div class="col-md-5 col-sm-6 col-md-pull-4 col-sm-pull-6">
                <h2 class="space-before">Save money </h2>
                <h3> The most bang for your dollar </h3>
                <p>There are 2 more color themes inside this template. You'll just need to uncomment 
                    few lines in the CSS file to activate any of them. </p>

            </div>
        </div>

        <div class="row featurelist space-after">
            <div class="col-md-5 col-sm-6 col-md-push-1 col-sm-6">
                <img class="img-feature img-responsive" src="img/location.png" alt="Sample image">
            </div>
            <div class="col-md-5 col-md-push-1 col-sm-6">
                <h2 class="space-before">Find location </span></h2>
                <h3> Know where you'll go </h3>
                <p> Our best system allows you to find all the locations of every artist's performance, every sport game locations and any event locations you are interested. Find right now everything you want! </p>
            </div
        </div>
    </div>
</section> 


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




<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Log in</h4>
            </div> <!-- /.modal-header -->

            <div class="modal-body">
                <form name="formLogin" role="loginForm" method="POST" action="login">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" id="usernameLogin" name="usernameLogin" placeholder="Username: ">
                            <label for="usernameLogin" class="input-group-addon glyphicon glyphicon-user"></label>
                        </div>
                    </div> <!-- /.form-group -->

                    <div class="form-group">
                        <div class="input-group">
                            <input type="password" class="form-control" id="passwordLogin" name="passwordLogin" placeholder="Password: ">
                            <label for="passwordLogin" class="input-group-addon glyphicon glyphicon-lock"></label>
                        </div> <!-- /.input-group -->
                    </div> <!-- /.form-group -->

                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Remember me
                        </label>
                    </div> <!-- /.checkbox -->

                    <div class="modal-footer">
                        <button class="form-control btn btn-primary">Login</button>
                    </div> <!-- /.modal-footer -->
                </form>
            </div> <!-- /.modal-body -->
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Register</h4>
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
<script type="text/javascript" src="scripts/validation.js"></script>
</html>
