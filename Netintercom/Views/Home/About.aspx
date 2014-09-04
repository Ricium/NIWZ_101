<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>About Us</title>
    <meta name="description" content="Netintercom">
    <meta name="keywords" content="Netintercom">
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
            <li><a href="../Home/Index"><i class="icon-user"></i> Home</a></li>
            <li><a href="../Home/About" class="active"><i class="icon-trophy"></i> About</a></li>
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
        <div class="Contacts">
            <div class="Christo"style="padding:20px;">
                <table>
                    <tr>
                    <td>
                <img style="width:150px;height:150px;" src="../../Content/homepage/img/Man_Silhouette.png" />
                  </td>
                        <td>Name:<br />
                            Surname:<br />
                            Contact Details:<br />
                            Position:<br />
                            Qualifications:
                        </td>
                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                        <td>
                            Christo<br />
                            Erasmus<br />
                            082 088 9391<br />
                            Client Manager<br />
                            B.Comm Informatics
                        </td>
                    </tr>
                    </table>
                </div>
                     <div class="RM" style="padding:20px;">
                <table>
                    <tr>
                    <td>
                <img style="width:150px;height:150px;" src="../../Content/homepage/img/Man_Silhouette.png" />
                  </td>
                        <td>Name:<br />
                            Surname:<br />
                            Contact Details:<br />
                            Position:<br />
                            Qualifications:
                        </td>
                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                        <td>
                            RM<br />
                            Lombard<br />
                            rm@netintercom.co.za<br />
                            Web Developer<br />
                            B.Eng Computer Engineering
                        </td>
                    </tr>
                    </table>
                </div>
                     <div class="MC"style="padding:20px;">
                <table>
                    <tr>
                    <td>
                <img style="width:150px;height:150px;" src="../../Content/homepage/img/Man_Silhouette.png" />
                  </td>
                        <td>Name:<br />
                            Surname:<br />
                            Contact Details:<br />
                            Position:<br />
                            Qualifications:
                        </td>
                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                        <td>
                            MC<br />
                            van der Bank<br />
                            mc@netintercom.co.za<br />
                            App Developer<br />
                            B.Eng Computer Engineering
                        </td>
                    </tr>
                    </table>
            </div>
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
