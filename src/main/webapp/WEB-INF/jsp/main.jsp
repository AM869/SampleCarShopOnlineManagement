<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- google log in meta and scripts -->
        <meta name="google-signin-scope" content="profile">
        <meta name="google-signin-client_id" content="289108522458-ccr2le3rbcmthadua80hk9epkrsakal1.apps.googleusercontent.com">
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
        
        <!-- car presentation details css and js -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfolder/carDetails.css" >
        <script src="${pageContext.request.contextPath}/jsfolder/carDetails.js" defer></script>
        
        <!-- image preview modal css and js-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfolder/imagePreview.css" >
        <script src="${pageContext.request.contextPath}/jsfolder/imagePreview.js" defer></script>               
        
        <style>
            
            html { 
              background: url("images/photos/3.jpg") no-repeat center center fixed; 
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
        

        <%@ include file="/WEB-INF/jsp/header.jsp" %>
        
        
        <h1>All Cars</h1>

        <c:forEach var="car" items="${carList}">
                    
        <div class="car">
            
            <div class="carHeader">
                <img class="carLogos" src="${pageContext.request.contextPath}/ImageFiles?id=${car.brand_fk}" alt="Smiley face" height="45" >         
                <span class="carHeaderSpan">${car.brandName}</span>
                <span class="carHeaderSpan">${car.model}</span>
            </div>
            
            <div class="carDetailsAndImages">
                
                <div class="carDetails">
                    <c:choose>
                        <c:when test="${empty car.description}">
                            <p class="no-details-p">No Details Available Yet.</p>
                        </c:when>
                        <c:otherwise>
                            <p>${car.description}</p>
                        </c:otherwise>
                    </c:choose>   
                </div>
                
                
                <div class="carImages">
                    <c:choose>
                        <c:when test="${car.photoNumber == 0}">
                        <span class="no-img-span">NO IMAGES AVAILABLE.</span>
                        </c:when>
                        <c:otherwise>
                        <div class="smallImageContainer" data-img-sum="${car.photoNumber}">
                            <c:forEach var="i" begin="1" end="${car.photoNumber}">

                            <img class="smallImage" src="${pageContext.request.contextPath}/ImageFiles${car.photoList[i-1].location}" data-img-number="${i}" alt="Smiley face"  width="100">

                            </c:forEach>
                        </div>                   
                        </c:otherwise>
                    </c:choose>

                </div>
                
            </div>
            
            <button type="button" class="btn btn-info showHideButton" ><span style="margin-top:5px;" class="glyphicon glyphicon-eye-open"></span></button>
            
        </div>
        

        <div class="imgPreviewModal" >
                
            <div class="mainImageContainerInModal">
                
                <span class="modalArrows prevArrow">&#10094;</span>
                <div class="mainImageInModalContainer">
                    <c:forEach var="i" begin="1" end="${car.photoNumber}">
                        <img  class="mainImageInModal" data-img-number="${i}" src="${pageContext.request.contextPath}/ImageFiles${car.photoList[i-1].location}" alt="Smiley face" >
                    </c:forEach>
                </div>
                
                <span class="modalArrows nextArrow">&#10095;</span>
                
            </div>

            <p class="captionText">SAMPLE</p>

            <div class="smallImageContainerInModal" data-img-sum="${car.photoNumber}">
                <c:forEach var="i" begin="1" end="${car.photoNumber}">
                    <img class="smallImageInModal" data-img-number="${i}" src="${pageContext.request.contextPath}/ImageFiles${car.photoList[i-1].location}" alt="Smiley face" height="100" width="100">                         
                </c:forEach>
            </div> 
            
            <div class="closeButtonModal">&times;</div>

        </div>
        
        
        </c:forEach>
        
        <%@ include file="/WEB-INF/jsp/footer.jsp" %>
            
        <script>
            var siteMapElements = document.querySelector(".sitemap").children;
            siteMapElements[0].firstElementChild.classList.add("current-page-sitemap");
        </script>
    </body>
</html>
