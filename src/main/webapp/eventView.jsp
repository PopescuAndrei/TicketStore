<%@page import="com.wad.ticketstore.domain.Location"%>
<%@page import="com.wad.ticketstore.dao.LocationsDAO"%>
<%@page import="java.util.Date"%>
<%@page import="com.wad.ticketstore.domain.Review"%>
<%@page import="com.wad.ticketstore.dao.ReviewsDAO"%>
<%@page import="com.wad.ticketstore.dao.TicketsDAO"%>
<%@page import="com.wad.ticketstore.domain.Ticket"%>
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
        <title>Event view</title>
    </head>
    <body>
        <%List<Ticket> ticketsList;%>
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
    <%
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        EventsDAO dao = new EventsDAO();
        String eventId = request.getParameter("eventId");
        Event event = dao.findEventById(eventId);
    %>
</div>
<div class="container">

    <div class="well">
        <div class="row">
            <div class="col-lg-6">
                <div class="thumbnail">
                    <img src="<%=event.getEventImage()%>" alt="<%=event.getEventName()%>">
                </div>
            </div>
            <div class="col-lg-6" style="display:block">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h2>Info</h2>
                    </div>
                    <div class="panel-body">
                        <div class="caption">
                            <h3><%=event.getEventName()%></h3>
                            <p><%=event.getEventDescription()%></p>
                        </div>
                        <% Location location = new LocationsDAO().findLocationByEvent(event.getLocationId());
                            String locationString = location.getCity() + ", " + location.getStreetAddress();%>
                        <p>LOCATION: <span><%=locationString%></span></p>
                        <p>DATE: <span><%=event.getEventDate().toString()%></span></p>
                        <p>START TIME: <span><%=event.getEventStart()%></span></p>
                        <p>END TIME: <span><%=event.getEventEnd()%></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% TicketsDAO ticketsDao = new TicketsDAO();
        ticketsList = ticketsDao.findTicketsByEvent(Integer.parseInt(eventId));%>

    <div class="well">

        <div class="panel panel-default">
            <table class="table table-hover">
                <thead>
                <td>Category</td>
                <td>Price</td>
                <td>Available</td>
                <td>Actions</td>
                </thead>
                <tbody>

                    <%if (!ticketsList.isEmpty()) {%>

                    <%for (Ticket ticket : ticketsList) {%>
                    <tr>    
                        <td><%=ticket.getCategory()%></td>
                        <td><%=ticket.getPrice()%></td>S
                        <td><%=ticket.getNoAvailableTickets()%></td>
                        <td>
                            <a href="addToCart?ticketId=<%=ticket.getTicketId()%>&eventId=<%=eventId%>"><button class="btn btn-block" role="presentation">Add To Cart</button></a>
                        </td>
                    </tr>
                    <%}%>
                    <%} else {%>
                    <tr>
                        <td colspan="5" style="text-align: center">No Available Tickets. Check Back Later</td>
                    </tr>
                    <%}%>

                </tbody>
            </table>
        </div>
    </div>


    <div class="well">

        <div class="text-right">
            <a class="btn btn-success" role="presentation" data-toggle="modal" data-target="#reviewModal">Leave a Review</a>
        </div>

        <hr>
        <%List<Review> reviews = new ReviewsDAO().findReviewsByEvent(Integer.parseInt(eventId));%>
        <div class="row">
            <% if (reviews.size() > 0) {
                    for (Review review : reviews) {
                        System.out.println(review.toString());
            %>
            <div class="col-md-12">
                <%=review.getName()%>
                <span class="pull-right"><%=new Date(review.getDate() * 1000)%></span>
                <p><%=review.getReviewMessage()%></p>
            </div>
            <%}%>
            <%} else {%>
            <div class="col-md-12">
                <p>There are no reviews for this product. Leave one!</p>
            </div>
            <%}%>
        </div>
    </div>

</div>
</div>

</div>
<!-- /.container -->

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

<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Add Review</h4>
            </div> <!-- /.modal-header -->

            <div class="modal-body">
                <form name = "reviewForm" role="form" method="POST" action="review?eventId=<%=eventId%>">
                    <div class="row">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Name: " >
                                <label for="name" class="input-group-addon glyphicon glyphicon-user" ></label>
                            </div>
                        </div> <!-- /.form-group -->
                    </div>
                    <div class="row">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <textarea style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" name="message" required></textarea>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button class="form-control btn btn-primary">Submit review</button>
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
