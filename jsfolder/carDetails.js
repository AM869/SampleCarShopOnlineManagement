var showHideDetailsAndImagesButtons = document.getElementsByClassName("showHideButton");
for (var i=0; i< showHideDetailsAndImagesButtons.length; i++){
    showHideDetailsAndImagesButtons[i].addEventListener("click", function(){showHideButtonClickCallback(this);});
}

function showHideButtonClickCallback(buttonClicked){
    
    var arrowElement = buttonClicked.firstElementChild;
//    var smallTextElement = buttonClicked.lastElementChild;
    
    //just pressed SHOW details
    if (arrowElement.classList.contains("glyphicon-eye-open")){
        arrowElement.classList.remove("glyphicon-eye-open");
        arrowElement.classList.add("glyphicon-eye-close");
        arrowElement.style.color = "#ED3437";
//        smallTextElement.innerHTML = "Hide Details";
        buttonClicked.previousElementSibling.style.display = "initial";

        var smallImages = buttonClicked.previousElementSibling.getElementsByClassName("smallImage");
        if(!smallImages[0].hasAttribute("src")){
            for(var i=0; i<smallImages.length; i++){
                smallImages[i].src = smallImages[i].dataset.imgSrc;
            }
        }
    }
    //just pressed HIDE details
    else if (arrowElement.classList.contains("glyphicon-eye-close")){
        arrowElement.classList.remove("glyphicon-eye-close");
        arrowElement.classList.add("glyphicon-eye-open");
        arrowElement.style.color = "#6CF06C";
//        smallTextElement.innerHTML = "Show Details";
        buttonClicked.previousElementSibling.style.display = "none";
    }       
}

var carHeaders = document.getElementsByClassName("carHeader");
for (var i=0; i< carHeaders.length; i++){
    carHeaders[i].addEventListener("click", function(){this.parentElement.querySelector(".showHideButton").click();});
}