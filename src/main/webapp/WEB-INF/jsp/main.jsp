

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            @media (min-width:992px) and (max-width:1369px){
                .smallImage{
                    padding-left: 17px;
                    padding-bottom: 17px;
                    
                }
            }
            
            
            .smallImageContainer{
                 display: inline-block;
            }
            .smallImage{
                cursor: pointer;
                border: 1px solid #fefefe;
                padding:2px;
                text-align: center;
            }
            
            .imgPreviewModal{
                z-index: 1;
                position: fixed;
                background-color: rgba(0, 0, 0,0.95);
                display: none;
                left:0;
                top:0;
                height:100%;
                width:100%;
                overflow: auto;
            }

            .mainImageContainerInModal{
                 max-width: 80%; 
                 /*margin: auto;*/
                 margin-top: 80px;
                 display: inline-block;
                 position: relative;
            }
            .mainImageInModal{
                display: none;
                max-width: 100%;
                /*margin: auto;*/
/*                height: auto;
                width: auto;*/      
            }
            
            .smallImageContainerInModal{
                
            }
            .smallImageInModal{
                padding-top: 5px;
                opacity: 0.7;
            }
            .smallImageInModal:hover{
                opacity: 1;
            }
            .selected{
                opacity: 1;
            }
            
            .captionText{
                color: graytext;
                margin: 20px;
                margin-top: 30px;
            }
            
            .modalArrows{
                position: absolute;
                top: 40%;
                
                cursor: pointer;
                padding: 12px;
                color: white;
                font-weight: bold;
                font-size: 3em;
                transition: 0.6s ease;
                /*border-radius: 0 3px 3px 0;*/
                user-select: none;
                -webkit-user-select: none;     
            }
            .prevArrow{
                right: 100%;
                border-radius: 3px 0 0 3px;
                
            }
            .nextArrow{
                left: 100%;
                border-radius: 0 3px 3px 0;    
            }
            .modalArrows:hover{
              background-color: rgba(217, 217, 217,0.8);
            }           
            
            .closeButtonModal{
                color: white;
                position: absolute;
                top: 10px;
                right: 25px;
                font-size: 50px;
                font-weight: bold;
            }
            .closeButtonModal:hover,
            .closeButtonModal:focus {
                color: #999;
                text-decoration: none;
                cursor: pointer;
            }
                      
            
            /*custom vertical form*/
            form > label{
                display: initial;      
            }

            .myVerticalForm{
                max-width: 40%;
                margin: auto;
            }

            .myVerticalFormRow{
                margin-bottom: 15px;
            }

            .fileInputDiv{
                position: relative;
            }
            .fileInputClose {
                position: absolute;
                right: -5px;
                top: -5px;
                margin:5px;
                margin-bottom: 2px;
                padding-top: 0px;
                padding-bottom: 0px;
                padding-left: 10px;
                padding-right: 10px;
                border: none;
                cursor: pointer;
                transition:  color 0.6s ease-out;
                color: rgb(166, 166, 166);
                background-color: transparent;
                font-size: 24px;   
            }
            .fileInputClose:hover{
                color: rgb(64, 64, 64);
            }

            /* Custom, iPhone Retina */ 
            @media only screen and (min-width : 320px) {
                .myVerticalForm{
                    max-width: 85%;
                    padding-left: 15px;
                    padding-right: 15px;
                }
            }

            /* Extra Small Devices, Phones */ 
            @media only screen and (min-width : 480px) {
                .myVerticalForm{
                    max-width: 75%;
                    padding-left: 15px;
                    padding-right: 15px;
                }
            }

            /* Small Devices, Tablets */
            @media only screen and (min-width : 768px) {
                .myVerticalForm{
                    max-width: 65%;
                    padding-left: 20px;
                    padding-right: 20px;
                }
            }

            /* Medium Devices, Desktops */
            @media only screen and (min-width : 992px) {
                .myVerticalForm{
                    max-width: 50%;
                    padding-left: 30px;
                    padding-right: 30px;
                }

            }

            /* Large Devices, Wide Screens */
            @media only screen and (min-width : 1200px) {
                .myVerticalForm{
                    max-width: 40%;
                }

            }


            /* car presentation div*/
            .car{
                margin-bottom: 40px;
                position: relative;
                border: 1px solid gray;
                border-left: 0px;
                border-right:0px;
                text-align:left;
            }
            /* car header div*/
            .carHeader{

            }
            /*car logo img*/
            .carLogos{
                border-right: 1px solid gray;
                border-bottom: 1px solid gray;
            }

            /* title and brand span elements*/
            .carHeaderSpan{
                padding-left: 10px;
            }

            /*car details and images div*/
            .carDetailsAndImages{
                display: none;
            }
            .carDetails{
                overflow: auto;
            }

            /*show hide details button*/
            .showHideButton{
                position:absolute;
                padding-top:5px;
                padding-bottom:7px;
                right:0px;
                top: 0px;
            }
            @media only screen and (max-width: 767px){
                .showHideButton{
                    left: 0px;
                    top:100%;
                }
            }
            .showHideArrows{
                font-weight: bold;
                display:inline-block; /* this is needed for rotate*/
            }
            .upwardArrow{
                transform: rotate(-90deg);
            }
            .downwardArrow{
                transform: rotate(90deg);
            }
    
            .brand-select{
                cursor: pointer;
            }
/*            .row {
              display: -webkit-box;
              display: -webkit-flex;
              display: -ms-flexbox;
              display: flex;
              flex-wrap: wrap;
            }
            .row > [class*='col-'] {
              display: flex;
              flex-direction: column;
            }*/
            
            label{
                display:block;
            }
            legend{
                position:relative;
                margin-top: 20px;
            }
            fieldset{
                margin-bottom: 30px;
                margin-top: 20px;
            }
            
            .carCloseButton{
                position: absolute;
                right: 0px;
                top: -8px;
                background-color: transparent;
                color: white;
                font-size: 24px;
                padding-left: 15px;
                padding-right: 15px;
                
            }
            .fileBtn{
                height: 37px;
                overflow: auto;
            }
        </style>
        
        
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <!--Using those two as templates in client side.-->
        <!-- image-adding template below Images Label inside form myForm-->
        <template id="add_image_template" >
            <div class=" fileInputDiv myVerticalFormRow">
                <label class="fileBtn btn btn-default form-control"><input type="file" name="file" multiple></label>
                <button type="button" class="fileInputClose"><span>&times;</span></button>
            </div>
        </template>  

        <!-- car-adding template inside form myForm-->
        <template id="add_car_template">
            
            <fieldset >
                    <legend>New-Car<button type="button" class="carCloseButton">&times;</button>
                    </legend>
                
                <label > Choose Brand:
                    <div class="myVerticalFormRow" style="display:block;width:100%;">
                        <select class="form-control brand-select" name="brand" required="true">
                            <option value="" disabled selected >Choose a brand or add one here in the bottom.</option>
                            <option value="bmw" >bmw</option>
                            <option value="merc">mersenta</option>
                            <option value="opel">opel</option>
                        </select>
                    </div>
                </label>

                <label>Model: 
                    <div class="myVerticalFormRow">   
                        <input class="form-control" type="text" name="model" placeholder="Add car model, year, edition etc."required>
                    </div>
                </label>    

                <label>Details: 
                    <div class="myVerticalFormRow">
                        <textarea class="form-control" cols="40" rows="8" name="description" placeholder="Add extra details here."></textarea>
                    </div>
                </label>

                <label>Images </label> 

                <div class="myVerticalFormRow fileInputDiv">
                    <label class="fileBtn btn btn-default form-control"><input type="file" name="file" multiple></label>
                    <button type="button" class="fileInputClose"><span>&times;</span></button>
                </div>


                <div class="myVerticalFormRow">
                    <button class="add_images_Button" type="button">Add images</button>
                </div>
            </fieldset>
        </template>
            
        
        <form id="myForm" class="myVerticalForm " action="" method="POST" enctype="multipart/form-data">

                       
            <button id="add_car_Button" type="button">Add New Car</button>
            <input id="submitCars" form="myForm" type="submit" value="Submit">         
        </form>

        
        <div>All Registered Cars</div>
        
        <div class="car">
            
            <div class="carHeader">
                <img class="carLogos" src="images/logos/brands/volvo.jpg" alt="Smiley face" height="35" >         
                <span class="carHeaderSpan">Brand1asdsadadasd</span>
                <span class="carHeaderSpan">Model1asdasdsadsads</span>
            </div>
            
            <div class="carDetailsAndImages">
                
                <div class="carDetails">
                    <p>No Details</p>
                    <p>asdsadadsaddddddddddddddddddddddddddddeeeeeeeeeeeeeeeeeeeeeeeeeddddddddddddddddasasddddddddddddddddddddddddddd
                        asddddddddddddddddddddddddddddddddddddddddddddada
                            -asdadas
                                -asdada-dsa
                                -asdadasd
                    </p>
                </div>
                
                <div class="carImages">
                    <span>NO IMAGES AVAILABLE OR div with images:</span>
                    <div class="smallImageContainer" data-img-sum="9">
                        <img class="smallImage" src="images/logos/brands/bmw.jpg" data-img-number="1" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/merc.png" data-img-number="2" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/opel.jpg" data-img-number="3" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/audi.png" data-img-number="4" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/img_fjords_wide.jpg" data-img-number="5" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/img_mountains_wide.jpg" data-img-number="6" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/star.png" data-img-number="7" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/star.jpg" data-img-number="8" alt="Smiley face"  width="100">
                        <img class="smallImage" src="images/logos/brands/volvo.jpg" data-img-number="9" alt="Smiley face"  width="100">
                    </div>                   
                </div>
                
            </div>
            
            <button type="button" class="showHideButton" ><span class="showHideArrows downwardArrow">&Gg;</span><span>Show Details</span></button>
        
        </div>
        

        <div class="imgPreviewModal" >
                
            <div class="mainImageContainerInModal">
                
                <span class="modalArrows prevArrow">&#10094;</span>
                
                <img  class="mainImageInModal" data-img-number="1" src="images/logos/brands/bmw.jpg" alt="Smiley face" >
                <img  class="mainImageInModal" data-img-number="2" src="images/logos/brands/merc.png" alt="Smiley face" > 
                <img  class="mainImageInModal" data-img-number="3" src="images/logos/brands/opel.jpg" alt="Smiley face" >
                <img  class="mainImageInModal" data-img-number="4" src="images/logos/brands/audi.png" alt="Smiley face" >
                
                <img  class="mainImageInModal" data-img-number="5" src="images/logos/brands/img_fjords_wide.jpg" alt="Smiley face" >
                <img  class="mainImageInModal" data-img-number="6" src="images/logos/brands/img_mountains_wide.jpg" alt="Smiley face" >
                <img  class="mainImageInModal" data-img-number="7" src="images/logos/brands/star.png" alt="Smiley face" >
                <img  class="mainImageInModal" data-img-number="8" src="images/logos/brands/star.jpg" alt="Smiley face" >
                <img  class="mainImageInModal" data-img-number="9" src="images/logos/brands/volvo.jpg" alt="Smiley face" >
                
                <span class="modalArrows nextArrow">&#10095;</span>
                
            </div>

            <p class="captionText">SAMPLE</p>

            <div class="smallImageContainerInModal" data-img-sum="9">
                <img class="smallImageInModal" data-img-number="1" src="images/logos/brands/bmw.jpg" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="2" src="images/logos/brands/merc.png" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="3" src="images/logos/brands/opel.jpg" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="4" src="images/logos/brands/audi.png" alt="Smiley face" height="100" width="100">
                
                <img class="smallImageInModal" data-img-number="5" src="images/logos/brands/img_fjords_wide.jpg" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="6" src="images/logos/brands/img_mountains_wide.jpg" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="7" src="images/logos/brands/star.png" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="8" src="images/logos/brands/star.jpg" alt="Smiley face" height="100" width="100">
                <img class="smallImageInModal" data-img-number="9" src="images/logos/brands/volvo.jpg" alt="Smiley face" height="100" width="100">               
            </div> 
            
            <div class="closeButtonModal">&times;</div>

        </div>
        
        
    </body>
</html>
