<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Netintercom</title>
    <meta name="description" content="Netintercom">
    <meta name="keywords" content="Netintercom, communication app">
    <meta name="author" content="Rm Lombard, MC van der Bank, Christo Erasmus">
    <!-- styles -->
    <link href="../../Content/homepage/css/bootstrap.css" rel="stylesheet">
    <link href="../../Content/homepage/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="../../Content/homepage/css/style.css" rel="stylesheet">
    <link href="../../Content/homepage/font/css/fontello.css" rel="stylesheet">
    <link href="../../Content/homepage/font/css/nasalization.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
          <ul class="nav nav-collapse pull-right">
            <li><a href="../Home/Index" class="active"><i class="icon-user"></i> Home</a></li>
            <li><a href="../Home/About"><i class="icon-trophy"></i> About</a></li>
            <li><a href="../Home/ContactUs"><i class="icon-mail"></i> Contact Us</a></li>
            <li><a href="../Home/Home"><i class="icon-paper-plane"></i> Log In</a></li>            
          </ul>
          <div class="nav-collapse collapse">
          </div>
        </div>
      </div>
    </div>
   
    <div class="container profile">
        <div class="span13"><img style="width:100%" src="../../Content/homepage/img/Logo_Design_Banner.png" /></div>
      <div class="span3"> <img style="width:250px;height:300px;" src="../../Content/homepage/img/phone.png"> </div>
      <div class="span5">
        <h1 class="f" style="font-family:'nasalization';color:#3097ff"></h1>
        <h3 class="f" style="font-family:'nasalization'; font-size:30px;color:black">Introduction</h3>
        <p>The Netintercom System provides a communication service where a multitude of client apps receive push notifications from a central web interface. Content created on the web interface will be sent instantaneously to all connected mobile apps.
            Our service will allow you to bring mobility to your business or organization. The service is optimized for schools, estates and clubs, but can be used by any other organization as well.</p>
    </div>
        <div class="features">
            <h3 class="f" style="font-family:'nasalization'; font-size:30px;color:black">Features</h3>
            <p>The main features provided by the app is as follows:<br /></p>
                <ul>
                    <li>News</li>
                    <li>Events</li>
                    <li>Announcements</li>
                    <li>Contacts</li>
                    <li>Advertisements</li>
                </ul>
                <p> A Facebook account can also be linked, which will automatically post content created on the web interface.<br />As a bonus, the Advertisements feature will allow you, our client, to generate a potential revenue by selling advertisement space to any third-party company.</p>
        </div>
        <br />
        <div class="customization" style="width:50%">
        <h3 class="f" style="font-family:'nasalization'; font-size:30px;color:black">Customization</h3>
            <p>
                We customize each app with a unique color scheme to match your requirements. We can also provide additional custom features and functionality on request.
            </p>
        </div>
        <div class="custom"style="width:30%;position:inherit;margin-left:450px;margin-top:-140px">
            <img src="../../Content/homepage/img/Customization.png" /></div>

        <div class="demoapp">
        <h3 class="f" style="font-family:'nasalization'; font-size:30px;color:black">Have a look</h3>
            <p>Try our example demo app now, and contact us for further information.</p>
            <a href="https://play.google.com/store/apps/details?id=com.netintercom.demonstration" target="_blank"><img style="width:150px;height:50px;" src="../../Content/homepage/img/Google Play store logo.png" alt="google play"></a>
            <!--<img style="width:150px;height:50px;" src="../../Content/homepage/img/Google Play store logo.png" />-->
            <img  style="width:80px;height:80px" src="../../Content/homepage/img/Netintercom Demo QR.png" />
        </div>  
        
    <div class="row social">
       <ul class="social-icons"style="padding:10px;" >
        <li style="margin-left:80px"><a href="#" target="_blank"><img src="../../Content/homepage/img/fb.png" alt="facebook"></a></li>
        <li><a href="#" target="_blank"><img src="../../Content/homepage/img/tw.png" alt="twitter"></a></li>
        <li><a href="#" target="_blank"><img src="../../Content/homepage/img/go.png" alt="google plus"></a></li>   
      </ul>
    </div>
        </div>
    <div class="footer">
      <div class="container">      
        <p class="pull-left"><a href="http://www.netintercom.co.za" style="font-family:'nasalization'; font-size:10px;color:white">www.netintercom.co.za</a></p>
        <p class="pull-right"><a href="#myModal" role="button" data-toggle="modal"> <i class="icon-mail"></i> CONTACT</a></p>
      </div>
    </div>
    
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel"><i class="icon-mail"></i> Contact Me</h3>
      </div>
      <div class="modal-body">
        <form action="../Home/Mail" method="post">
          <input type="text" placeholder="Your Name" name="name">
          <input type="text" placeholder="Your Email" name="email">
          <input type="text" placeholder="Website (Optional)" name="website">
          <textarea rows="3" style="width:80%" name="message"></textarea>
          <br/>
          <button type="submit" class="btn btn-large"><i class="icon-paper-plane"></i> SUBMIT</button>
        </form>
      </div>
    </div>
    <!-- Scripts -->
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="../../Content/homepage/js/bootstrap.min.js"></script>
    <script>
        $('#myModal').modal('hidden')
    </script>
    </body>
    </html>
