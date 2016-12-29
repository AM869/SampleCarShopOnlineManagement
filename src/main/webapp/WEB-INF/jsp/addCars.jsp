<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- google log in scripts -->
        <script src="${pageContext.request.contextPath}/jsfolder/googleSignInOut.js" ></script>
        <script src="https://apis.google.com/js/platform.js?onload=loadAndInitAuth2" async defer></script>
        
        
        <title>Sample Car Shop - Online Management</title>
        
        <!-- Bootstrap css CDN  -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <!-- Font Awesome css CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!-- JQuery CDN  -->
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" defer></script>
        
        <!-- Bootstrap js CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" defer></script>
        
        <!-- header css -->
        <link rel="stylesheet" href="/SampleCarShopOnlineManagement/cssfolder/header.css" >
        
        <!-- footer css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfolder/footer.css" >
        
        <!-- add cars css and js --> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfolder/addCar.css" >
        <script src="${pageContext.request.contextPath}/jsfolder/addCar.js" defer></script>
        
        <!-- car presentation details css and js -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfolder/carDetails.css" >
        <script src="${pageContext.request.contextPath}/jsfolder/carDetails.js" defer></script>
        
        <!-- image preview modal css and js-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfolder/imagePreview.css" >
        <script src="${pageContext.request.contextPath}/jsfolder/imagePreview.js" defer></script>       

        <style>

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
        <%@ include file="/WEB-INF/jspf/header.jspf" %>

        <h1>Add New Cars</h1>
        
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
            
        
        <form id="myCarForm" action="addCars" class="myVerticalForm"  method="POST" enctype="multipart/form-data">
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
        
        <h1>My Cars</h1>
        
        <%@ include file="/WEB-INF/jspf/cars.jspf" %>

        <%@ include file="/WEB-INF/jspf/footer.jspf" %>

        <script>
            var siteMapElements = document.querySelector(".sitemap").children;
            siteMapElements[1].firstElementChild.classList.add("current-page-sitemap");
        </script>
    </body>
    

</html>
