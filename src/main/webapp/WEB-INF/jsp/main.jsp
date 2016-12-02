

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample Car Shop - Online Management</title>
        
        <!-- Bootstrap CDN  -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <!-- JQuery CDN  -->
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" defer></script>
        
        
        
        
        
        
        <!-- Our scripts --> 
        <script src="<%=request.getContextPath()%>/jsfolder/indexScript.js" defer></script>
        <script src="<%=request.getContextPath()%>/jsfolder/imagePreview.js" defer></script>
        
        <style>
            body {
                text-align: center;
                background-color: lightblue;
            }
            .close_button{
                font-size:2em;
                background-color: transparent;
                /*position: relative;*/
                top: 5px;
                left: -105px;
            }

            ::-webkit-input-placeholder {
               font-style: italic;
            }

            textarea {
                border-radius: 10px;
                border-color: aliceblue;
                
            }
            input {
                border-radius: 5px;
                border-color: aliceblue;
                border: none;
            }
            
            .div-label{
                position: relative;
                text-align: right;
            }
            .form-label{
                position: absolute;
                top: 0.5em;
                right: 5%;
            }
            .row{
                margin-top: 20px;
            }
            
            /*START static lightbox*//*static lightbox*/
            /*START static lightbox*//*static lightbox*/
            .lightbox-row > .column {
              padding: 0 8px;
            }

            .lightbox-row:after {
              content: "";
              display: table;
              clear: both;
            }

            .column {
              float: left;
              width: 25%;
            }

            /* The Modal (background) */
            .modal {
              display: none;
              position: fixed;
              z-index: 1;
              padding-top: 100px;
              left: 0;
              top: 0;
/*              width: 100%;
              height: 100%;*/
              overflow: auto;
              background-color: black;
            }

            /* Modal Content */
            .modal-content {
              position: relative;
              background-color: #fefefe;
              margin: auto;
              padding: 0;
              width: 90%;
              max-width: 1200px;
            }

            /* The Close Button */
            .close {
              color: white;
              position: absolute;
              top: 10px;
              right: 25px;
              font-size: 35px;
              font-weight: bold;
            }

            .close:hover,
            .close:focus {
              color: #999;
              text-decoration: none;
              cursor: pointer;
            }

            .mySlides {
              display: none;
            }

            /* Next & previous buttons */
            .prev,
            .next {
              cursor: pointer;
              position: absolute;
              top: 50%;
              /*width: auto;*/
              padding: 16px;
              /*margin-top: -50px;*/
              color: white;
              font-weight: bold;
              font-size: 2em;
              transition: 0.6s ease;
              border-radius: 0 3px 3px 0;
              user-select: none;
              -webkit-user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
              right: 0;
              border-radius: 3px 0 0 3px;
            }
            
            /* Position the "previous button" to the left */
            .prev {
              left: 0;
              border-radius: 0 3px 3px 0;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover,
            .next:hover {
              background-color: rgba(0, 0, 0, 0.8);
            }

            /* Number text (1/3 etc) */
            .numbertext {
              color: #f2f2f2;
              font-size: 12px;
              padding: 8px 12px;
              position: absolute;
              top: 0;
            }

            .caption-container {
              text-align: center;
              background-color: black;
              padding: 2px 16px;
              color: white;
            }

            img.demo {
              opacity: 0.6;
            }

            .active,
            .demo:hover {
              opacity: 1;
            }

            img.hover-shadow {
              transition: 0.3s
            }

            .hover-shadow:hover {
              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
            }            
            /* END static lightbox*//*static lightbox*/
            /* END static lightbox*//*static lightbox*/
            
        </style>
        
        
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <template id="add_car_template">
            
            <form class="container-fluid" action="" method="POST" enctype="multipart/form-data">
                
                <div class="row">
                    <div class="col-xs-4 div-label">
                        <label class="form-label"> Choose Brand:</label>
                    </div>
                    <div  class="col-xs-8">
                        <select class="form-control" name="brand" required="true">
                            <option value="" disabled selected >Choose a brand or add one here in the bottom.</option>
                            <option value="bmw" >bmw</option>
                            <option value="merc">mersenta</option>
                            <option value="opel">opel</option>
                        </select>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-xs-4 div-label">
                        <label class="form-label">
                            Model:
                        </label>
                    </div>
                    <div  class="col-xs-8">
                        <input class="form-control" type="text" name="model" placeholder="Add car model, year, edition etc."required>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col-xs-4 div-label">
                        <label class="form-label">Details: </label>
                    </div>
                    <div class="col-xs-8">
                        <textarea class="form-control" cols="40" rows="8" name="description" placeholder="Add extra details here."></textarea>
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-xs-4 div-label">
                        <label class="form-label">
                             Images
                        </label>
                    </div>
                    <div class="col-xs-8 container-fluid">
                        <div class="row">
                            <div  class="col-xs-11">
                                    <input class="btn btn-default form-control" type="file" name="file" multiple>
                            </div>
                            <div  class="col-xs-1">
                                <span class="glyphicon glyphicon-remove-sign close_button" ></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <button class="add_more_images_Button" type="button">Add more images</button>
                </div>
                <div class="row">
                    <small>Accepted file types: jpg/jpeg, gif, png. Max File Size: 16MB each. Max number of photos uploaded per car: 30.</small>
                </div>
                <div class="row">
                    <input type="submit">
                </div>
            </form>
                
            
        </template>
        
        <button id="add_car_Button" type="button">Add New Car</button>
        
        <div>All Registered Cars</div>
        
        <div class="container-fluid">            
            <div class="row">
                <img class="logos" src="images/logos/brands/volvo.jpg" alt="Smiley face" height="30" width="30">Brand1 Model1
            </div>
            <div class="row">
                Details: above is logo not image blablabla, below is image.
            </div>
        </div>
        IMAGES START
        <div>
            <img class="images" src="images/logos/brands/volvo.jpg" alt="Smiley face" height="100" width="100">
        </div>
        IMAGES END    
            
        <div class="container-fluid"> 
            <div class="row">
                <img class="logos" src="smiley.gif" alt="Smiley face" height="50" width="50">Brand1 Model1
            </div>
            <div class="row">
                Details:
            </div>
        </div>
             

        <div class="lightbox-row">
          <div class="column">
              <img src="images/logos/brands/audi.png" height="100" width="100" onclick="openModal();currentSlide(1)" class="hover-shadow">
          </div>
          <div class="column">
            <img src="images/logos/brands/bmw.jpg" height="70" width="70" onclick="openModal();currentSlide(2)" class="hover-shadow">
          </div>
          <div class="column">
            <img src="images/logos/brands/merc.png" height="70" width="70" onclick="openModal();currentSlide(3)" class="hover-shadow">
          </div>
          <div class="column">
            <img src="images/logos/brands/opel.jpg" height="70" width="70" onclick="openModal();currentSlide(4)" class="hover-shadow">
          </div>
        </div>                


        <div id="myModal" class="modal">
          <span class="close cursor" onclick="closeModal()">&times;</span>
          <div class="modal-content">

            <div class="mySlides">
              <div class="numbertext">1 / 4</div>
                <img src="images/logos/brands/audi.png" >
            </div>

            <div class="mySlides">
              <div class="numbertext">2 / 4</div>
                <img src="images/logos/brands/bmw.jpg" >
            </div>

            <div class="mySlides">
              <div class="numbertext">3 / 4</div>
                <img src="images/logos/brands/merc.png" >
            </div>

            <div class="mySlides">
              <div class="numbertext">4 / 4</div>
                <img src="images/logos/brands/opel.jpg" >
            </div>

            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

            <div class="caption-container">
              <p id="caption"></p>
            </div>

            <div class="column">
              <img class="demo" src="images/logos/brands/audi.png" onclick="currentSlide(1)" alt="Nature">
            </div>

            <div class="column">
              <img class="demo" src="images/logos/brands/bmw.jpg" onclick="currentSlide(2)" alt="Trolltunga">
            </div>

            <div class="column">
              <img class="demo" src="images/logos/brands/merc.png" onclick="currentSlide(3)" alt="Mountains">
            </div>

            <div class="column">
              <img class="demo" src="images/logos/brands/opel.jpg" onclick="currentSlide(4)" alt="Lights">
            </div>
          </div>
        </div>                


            
            
            
        
        
        
    </body>
</html>
