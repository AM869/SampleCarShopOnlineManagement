<%-- 
    Document   : test
    Created on : Dec 15, 2016, 4:15:40 PM
    Author     : Xristos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>JSP Page</title>
        
         Bootstrap CDN  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         Font Awesome CSS 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
         JQuery CDN  
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" defer></script>
        
         Bootstrap js CDN 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" defer></script>-->
            
        <style>
/*            .myFooter{
                color: #fff;
                background-color: #3b3f3f;
                cursor:default;
            }
            .row{
                text-align: center;
            }
            
            .social-media-icons{
                font-size: 3em;
                cursor: pointer;
                padding: 10px;
            }
            .fa-twitter:hover{
                color: #55acee;
            }
            .fa-facebook:hover{
                color: #3B5998;
            }
            .fa-google-plus:hover{
                color: #dd4b39;
            }
            .contact-mini-icons{
                font-size: 32px;
                padding: 5px;
            }
            .contact-mini-text{
                font-size: 24px;
                padding: 5px;
            }
            .location:hover{
                text-decoration: none;
            }
            .sitemap{
                font-size: 24px;
            }
            .site-anchor-text{
                color: white;
            }
            .site-anchor-text:hover{
                text-decoration: none;
                color: #fff;
            }*/
            
        </style>
        
        
    </head>
    <body>
        <h1>Hello World!</h1>
        <div style="background-color: grey; height:800px; width: 100%;">lalalalala</div>
        
        
        <div>XXXXXXXXXXXXXXXXXX</div>
        <footer class="myFooter container-fluid">
            <div class="row">
                
                <div class="col-md-6 col-lg-3">
                    <h3>Site</h3>
                    <ul style="list-style-type:none" class="list-group sitemap">
                        <li><a class="site-anchor-text" href="${pageContext.request.contextPath}/main">Home</a></li>
                        <li><a class="site-anchor-text" href="${pageContext.request.contextPath}/addCars">Add Cars</a></li>
                        <li><a class="site-anchor-text" href="${pageContext.request.contextPath}/modCars">Modify Cars</a></li>
                    </ul>

                </div>
                
                <div class="col-md-6 col-lg-3">
                    <h3>Contact Us</h3>
                    <ul style="list-style-type:none;"  class="list-group">
                        <li><span class="fa fa-envelope contact-mini-icons"></span><span class="contact-mini-text">email: zzz@zzz.zzz</span></li>
                        <li><span class="fa fa-phone-square contact-mini-icons"></span><span class="contact-mini-text">phone: +30 999999999</span></li>
                        <li><span class="fa fa-mobile contact-mini-icons"></span><span class="contact-mini-text">mobile: +30 111111111</span></li>
                        <li><span class="fa fa-home contact-mini-icons"></span><span class="contact-mini-text">address: aaa-bbb-ccc 9999 ddd eee fff</span></li>
                        <li><a class="location" href="https://www.google.com/maps/place/Java/@-7.3226346,107.6637506,7z/data=!3m1!4b1!4m5!3m4!1s0x2e7aa07ed2323237:0x86fe1c59d6abed60!8m2!3d-7.6145292!4d110.7122465" target="_blank"><span class="fa fa-map-marker contact-mini-icons"></span><span class="contact-mini-text">Location</span></a></li>
                    </ul>               
                </div>
                
                    
                <div class="col-md-6 col-lg-3">
                    <h3>Follow Us</h3>
                    <a title="follow us on twitter" class="fa fa-twitter social-media-icons"></a>
                    <a title="follow us on facebook"class="fa fa-facebook social-media-icons"></a>
                    <a title="follow us on google+" class="fa fa-google-plus social-media-icons"></a>
                    
                </div>

                <div class="col-md-6 col-lg-3">
                    <h3>Leave A Message</h3>
                </div>
                
            </div>
        </footer>
        
    </body>
</html>
