<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




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
        
        <!-- Bootstrap js CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" defer></script>
        
        
        
        
        <!-- Our scripts --> 
        <script src="<%=request.getContextPath()%>/jsfolder/indexScript.js" defer></script>
        <script src="<%=request.getContextPath()%>/jsfolder/imagePreview.js" defer></script>
        
        <style>
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
                border-radius: 15px;
            }
            .smallImage:hover{
                cursor: pointer;
                z-index: 1;
                transform: scale(2,2);
                transition: 0.3s ease;
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
                margin-bottom: 40px;
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
                top: -4px;
                margin:5px;
                margin-bottom: 5px;
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
                
                background-color: graytext;
                max-width:85%;
                margin: auto;
                margin-bottom: 40px;
                position: relative;
/*                border: 3px solid #46b8da;*/
                border-radius: 50px;
                text-align:left;
            }
            /* car header div*/
            .carHeader{
                padding: 15px;
                color: white;
                overflow: auto;
                
            }
            /*car logo img*/
            .carLogos{
                padding: 5px;
                border-right: 1px solid gray;
                border-bottom: 1px solid gray;
                border-radius: 15px;
                overflow:auto;
            }

            /* title and brand span elements*/
            .carHeaderSpan{
                padding-left: 10px;
                font-weight: bold;
                overflow: auto;
            }

            /*car details and images div*/
            .carDetailsAndImages{
                display: none;
            }
            .carDetails{
                overflow: auto;
                padding: 15px;
                color: white;
            }
            .carImages{
                padding: 15px;
                color:white;
            }

            /*show hide details button*/
            .showHideButton{
                position:absolute;
                padding-top:5px;
                padding-bottom:7px;
                right:2%;
                top: 15px;
                border-radius: 20px;
                overflow: hidden;
                color: #6CF06C;
                background-color: black;
                border: 0;
            }
            .showHideButton:focus{
                background-color: black;
            }

            @media only screen and (max-width: 991px){
                .showHideButton{
                    right:50%;                 
                    top:100%;
                    transform: translate(50%);
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
                overflow-x: auto;
            }
            
            label{
                display:block;
            }
            legend{
                position:relative;
                margin-top: 20px;
                color: #FFD700;
                
            }
            fieldset{
                color: #FFD700;
                margin-bottom: 30px;
                margin-top: 30px;
            }
            
            .carCloseButton{  
                position: absolute;
                right: 0px;
                top: -10px;
                background-color: transparent;
                border-radius: 50px;
                color: red;
                font-size: 24px;
                height: 38px;
                padding-left: 15px;
                padding-right: 15px;
                padding-top: 4px;          
            }
            .carCloseButton:hover{
                box-shadow: inset 0 5px 30px #193047;
                color: red;
            }
            .carCloseButton:active{
                box-shadow: inset 0 5px 30px #193047;
                color: initial;
            }
            .fileBtn{
                height: 37px;
                overflow: auto;
            }
            
            .add_images_Button{
                background-color: black;
                color: #E8CC38;
                border-radius: 20px 20px 20px 20px;
            }
            .blackGrad {
                background-color:black;
                color: greenyellow;
                border-radius: 7px 7px 7px 7px; 
            }
            .blackGrad:hover {
                color: green;
            }
            .blackGrad:focus {
                color: greenyellow;
            }
            .buttonRightSideText{
                padding-left:5px;
            }
            .myPanel{
                border-top:0px;
                background-color: transparent;   
                border: 0px;
            }
            .myPanelHeading{
                color: red;
                /*text-align: left;*/
                background-color: transparent;
            }
            .myPanelBody{
                background-color: transparent;
            }
            
            #toogleBrand, #submitBrand{
                color: greenyellow;
                background-color: gray;
            }
            
            .form-control{
                background-color: gainsboro ;
            }
            
            html { 
              background: url("images/photos/1.jpg") no-repeat center center fixed; 
              -webkit-background-size: cover;
              -moz-background-size: cover;
              -o-background-size: cover;
              background-size: cover;
            }
            body {
                text-align: center;
                background-color: transparent;
                /*background-color: lightblue;*/
            }
        </style>
        
        
    </head>
    <body>
        <%@ include file="/WEB-INF/html/navBar.html" %>

        <h1>add Cars Hello World!</h1>
        
        <!--Using those two as templates in client side.-->
        <!-- image-adding template below Images Label inside form myCarForm-->
        <template id="add_image_template" >
            <div class=" fileInputDiv myVerticalFormRow">
                <label class="fileBtn btn btn-default form-control"><input type="file" name="file" multiple></label>
                <button type="button" class="fileInputClose"><span>&times;</span></button>
            </div>
        </template>  

        <!-- car-adding template inside form myCarForm-->
        <template id="add_car_template">
            
            <fieldset>
                <legend>New-Car<button type="button" class="btn carCloseButton"><span class="glyphicon glyphicon-remove-sign"></span></button>
                    </legend>
                
                <label> Choose Brand:
                    <div class="myVerticalFormRow" >
                        <select class="form-control brand-select" name="brand" required="true">
                            <option value="" disabled selected >Choose a brand or add one here in the bottom.</option>
                            
                            <c:forEach var="brand" items="${brandList}">
                            <option value="${brand.id}" >${brand.name}</option>
                            </c:forEach>
                            
                            <option value="AddNewBrand" >Add new Brand</option>
                        </select>
                    </div>
                </label>
                

                <label>Model: 
                    <div class="myVerticalFormRow">   
                        <input class="form-control model" type="text" name="model" placeholder="Add car model, year, edition etc."required>
                    </div>
                </label>    

                <label>Details(optional): 
                    <div class="myVerticalFormRow">
                        <textarea class="form-control" cols="40" rows="8" name="description" placeholder="Add extra details here."></textarea>
                    </div>
                </label>

                <label>Images(optional) </label> 

                <div class="myVerticalFormRow fileInputDiv">
                    <label class="fileBtn btn btn-default form-control"><input type="file" name="file" multiple></label>
                    <button type="button" class="fileInputClose"><span>&times;</span></button>
                </div>

                <div class="myVerticalFormRow">
                    <button class="btn add_images_Button" type="button"><span  style="color: chartreuse;" class="glyphicon glyphicon-plus"></span><span class="buttonRightSideText" style="color: white;">Add images</span></button>
                </div>
                
            </fieldset>
            
        </template>
            
        
        <form id="myCarForm" class="myVerticalForm"  method="POST" enctype="multipart/form-data">
            <!-- here goes car template above-->
            <button class="btn blackGrad" id="add_car_Button" type="button"><span class="glyphicon glyphicon-plus-sign"></span><span class="buttonRightSideText">Add New Car</span></button> 
            <button name="submit" value="submitCars" type="submit" id="submitCars" class="btn blackGrad"><span class="glyphicon glyphicon-ok-sign"></span><span class="buttonRightSideText"> Submit Cars</span> </button>
        </form>
            
            
        <button id="toogleBrand" style="border:0px;" type="button" class="btn btn-info" data-toggle="collapse" data-target="#myBrandForm">+ New Brand</button>
        
        <form style="" id="myBrandForm" class="myVerticalForm collapse" action="AddCars" method="POST" enctype="multipart/form-data">

            <div class="panel panel-default myPanel">
                    <div class="panel-body myPanelBody" >
                        <label style="background-color: #d3d3d3; color: #333333;">Brand Name: 
                            <div class="myVerticalFormRow">   
                                <input class="form-control" type="text" name="name" placeholder="Add Brand name." required>
                            </div>
                        </label>

                        <label style="margin-bottom: 0;background-color: #d3d3d3; color: #333333;">Brand Logo(optional)</label>
                        <div class=" fileInputDiv myVerticalFormRow">
                            <label class="fileBtn btn btn-default form-control"><input type="file" name="file"></label>
                        </div>         
                        
                        <button name="submit" value="submitBrand" class="btn" id="submitBrand" type="submit" ><span class="glyphicon glyphicon-ok"></span> Submit New Brand </button>
                    </div>
            </div>
        </form>
        

        <div style="margin-top: 50px; margin-bottom: 15px; font-size: 1.5em;"><u><b>All Registered Cars</b></u></div>
        
        
        
        
        <div class="car">
            
            <div class="carHeader">
                <img class="carLogos" src="images/logos/brands/volvo.jpg" alt="Smiley face" height="35" >         
                <span class="carHeaderSpan">Brand1asdsadadasdBrand1asdsadadasd</span>
                <span class="carHeaderSpan">123451234512345123451234512345</span>
            </div>
            
            <div class="carDetailsAndImages">
                
                <div class="carDetails">
                    <p>No Details Available Yet.</p>
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
            
            <button type="button" class="btn btn-info showHideButton" ><span style="margin-top:5px;" class="glyphicon glyphicon-eye-open"></span></button>
            
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
