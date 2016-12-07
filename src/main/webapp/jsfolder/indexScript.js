var addCarButton = document.getElementById("add_car_Button");
addCarButton.addEventListener("click",addCar);
var add_car_doc_fragment = document.getElementById("add_car_template").content;
var add_img_doc_fragment = document.getElementById("add_image_template").content;
var car_counter = 0;
function addCar (){
    var carNode = add_car_doc_fragment.cloneNode(true);
    var newImageButton = carNode.querySelector(".add_images_Button");
    var fileInputClose = carNode.querySelector(".fileInputClose");
    var image_counter=1;
 
    function addImage(){
        image_counter++;
        var newFileInputDiv = add_img_doc_fragment.cloneNode(true);
        newFileInputDiv.firstElementChild.lastElementChild.addEventListener("click", removeImage);
        newImageButton.parentElement.parentElement.insertBefore(newFileInputDiv,newImageButton.parentElement);
        if(image_counter === 5){
            newImageButton.disabled=true;
            newImageButton.style.cursor = "not-allowed";
            newImageButton.style.color = "gray";
        }
    }
    
    function removeImage(event){
        var x_button = event.target;
        if(x_button.tagName === "SPAN"){
            x_button = x_button.parentElement;
        }      
        var fileInputDiv = x_button.parentElement;
        fileInputDiv.parentElement.removeChild(fileInputDiv);
        if (image_counter === 5){
            newImageButton.disabled=false;
            newImageButton.style.cursor = "initial";
            newImageButton.style.color = "black";
        }
        image_counter--;
    }

    function removeCar(){
            
    }
    
    newImageButton.addEventListener("click",addImage);
    fileInputClose.addEventListener("click", removeImage);
    addCarButton.parentElement.insertBefore(carNode, addCarButton);
}

var showHideDetailsAndImagesButtons = document.getElementsByClassName("showHideButton");
for (var i=0; i< showHideDetailsAndImagesButtons.length; i++){
    showHideDetailsAndImagesButtons[i].addEventListener("click", function(){showHideButtonClickCallback(this);});
}

function showHideButtonClickCallback(buttonClicked){
    
    var arrowElement = buttonClicked.firstElementChild;
    var smallTextElement = buttonClicked.lastElementChild;
    
    //just pressed SHOW details
    if (arrowElement.classList.contains("downwardArrow")){
        arrowElement.classList.remove("downwardArrow");
        arrowElement.classList.add("upwardArrow");
        smallTextElement.innerHTML = "Hide Details";
        buttonClicked.previousElementSibling.style.display = "initial";
    }
    //just pressed HIDE details
    else if (arrowElement.classList.contains("upwardArrow")){
        arrowElement.classList.remove("upwardArrow");
        arrowElement.classList.add("downwardArrow");
        smallTextElement.innerHTML = "Show Details";
        buttonClicked.previousElementSibling.style.display = "none";
    }       
}
