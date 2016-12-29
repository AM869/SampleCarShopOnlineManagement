

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sample Car Shop - Online Management</title>
        
        <!-- Bootstrap css CDN  -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <!-- JQuery CDN  -->
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" defer></script>
        
        <!-- Bootstrap js CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" defer></script>
         
    </head>
    <body>
        
        
        <%@ include file="/WEB-INF/jspf/footer.jspf" %>
        
        
        <h1>Hello World!</h1>
        
        <form action="" method="POST">
            <input type="text" name="model" placeholder="server" required>
            <textarea name="description" placeholder="server" required></textarea>
            <button type="submit">Confirm Changes</button>    
        </form>
        
        <form action="" method="POST">
            <label><img width="200" src=""><input type="checkbox" name="imgToDelete" value="imgId1"></label>
            <label><img width="200" src=""><input type="checkbox" name="imgToDelete" value="imgId2"></label>
            <label><img width="200" src=""><input type="checkbox" name="imgToDelete" value="imgId3"></label>
            <label><img width="200" src=""><input type="checkbox" name="imgToDelete" value="imgId4"></label>           
            <button type="submit">Delete Photo</button>
        </form>

        <form action="" method="POST" enctype="multipart/form-data">
            <input type="file" name="file" multiple>
            <button type="submit" name="fileSubmit" value="carId">Upload Photo</button>
        </form>
        
        <form action="" method="POST">
            <button type="submit" name="deleteCar" value="carId">Delete Car</button>
        </form>
        
        
        
        
    </body>
    
</html>
