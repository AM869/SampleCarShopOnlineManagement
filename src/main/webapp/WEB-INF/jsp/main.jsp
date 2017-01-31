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
              background: #000 url("images/photos/3.jpg") no-repeat center center fixed; 
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
        
        
        <h1>All Cars</h1>

        <%@ include file="/WEB-INF/jspf/cars.jspf" %>
        <div style="width:40%;margin:auto;">
        <ul  class="pagination">
            <c:forEach var="page"  begin="1" end="${maxPageNumber}" step="1">
                <li><a href="${pageContext.request.contextPath}/Home?page=${page}">${page}</a></li>
            </c:forEach>
        </ul>
        </div>
        
        <%@ include file="/WEB-INF/jspf/footer.jspf" %>
            
        <script>
            var siteMapElements = document.querySelector(".sitemap").children;
            siteMapElements[0].firstElementChild.classList.add("current-page-sitemap");
        </script>
    </body>
</html>
