<footer class="myFooter container-fluid">
    <div class="row">

        <div class="col-md-6 col-lg-3">
            <h3 class="footer-headline"><div class="underlineDiv" >Site</div></h3>
            <ul style="list-style-type:none" class="list-group sitemap">
                <li><a class="site-anchor-text" href="${pageContext.request.contextPath}/main">Home</a></li>
                <li><a class="site-anchor-text" href="${pageContext.request.contextPath}/addCars">Add Cars</a></li>
                <li><a class="site-anchor-text" href="${pageContext.request.contextPath}/modCars">Modify Cars</a></li>
            </ul>

        </div>

        <div class="col-md-6 col-lg-3">
            <h3 class="footer-headline"><div class="underlineDiv">Contact Us</div></h3>
            <ul style="list-style-type:none;"  class="list-group">
                <li><span class="fa fa-envelope contact-mini-icons"></span><span class="contact-mini-text">email: zzz@zzz.zzz</span></li>
                <li><span class="fa fa-phone-square contact-mini-icons"></span><span class="contact-mini-text">phone: +30 999999999</span></li>
                <li><span class="fa fa-mobile contact-mini-icons"></span><span class="contact-mini-text">mobile: +30 111111111</span></li>
                <li><span class="fa fa-home contact-mini-icons"></span><span class="contact-mini-text">address: aaa-bbb-ccc 9999 ddd eee fff</span></li>
                <li><a class="location" href="https://www.google.com/maps/place/Java/@-7.3226346,107.6637506,7z/data=!3m1!4b1!4m5!3m4!1s0x2e7aa07ed2323237:0x86fe1c59d6abed60!8m2!3d-7.6145292!4d110.7122465" target="_blank"><span class="fa fa-map-marker contact-mini-icons"></span><span class="contact-mini-text">Location</span></a></li>
            </ul>               
        </div>


        <div class="col-md-6 col-lg-3">
            <h3 class="footer-headline"><div class="underlineDiv">Follow Us</div></h3>
            <a title="follow us on twitter" class="fa fa-twitter social-media-icons"></a>
            <a title="follow us on facebook"class="fa fa-facebook social-media-icons"></a>
            <a title="follow us on google+" class="fa fa-google-plus social-media-icons"></a>

        </div>

        <div class="col-md-6 col-lg-3">
            <h3 class="footer-headline underlineDiv">Leave us your thoughts</h3>
            <form action="">
                
                <input class="form-control msgText" type="text" name="firstName" placeholder="First Name" required>
                <input class="form-control msgText" type="text" name="lastName" placeholder="Last Name" required>
                
                <textarea class="form-control msgTextarea" name="message" rows="4" cols="10" placeholder="Your Message" required></textarea>
                <input class="msgBtn" type="submit" name="submitMessage" value="Send">
                
            </form>
        </div>

    </div>
</footer>