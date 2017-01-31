
var imgContainers = document.getElementsByClassName("smallImageContainer");

for(var i =0; i<imgContainers.length; i++){
    imgContainers[i].addEventListener("click", function(event){imgContainerCallback(this,event); });
}

function getAncestorByClassName(element, className){
    var ancestor=element.parentElement;
    while(!ancestor.classList.contains(className)){
           ancestor = ancestor.parentElement; 
    }
    return ancestor;
}

function imgContainerCallback(imgContainer,evt){
    

    
    var img_sum = parseInt(imgContainer.getAttribute("data-img-sum"));
    var img_clicked = evt.target;
    var img_number = img_clicked.getAttribute("data-img-number");

    //if user didnt click an image but click inside the image container
    if ( img_number === null){
        img_number = 1;
    }

    var carElement = getAncestorByClassName(imgContainer, "car");
    var imgPreviewModal = carElement.nextElementSibling;

    var mainImagesInModal = imgPreviewModal.querySelector(".mainImageInModalContainer").children;
    var initialMainImage = mainImagesInModal[img_number-1];
    var smallImagesInModal = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
    var captionTextElement = imgPreviewModal.querySelector(".captionText");
    
    imgPreviewModal.style.display = "block";
    initialMainImage.style.display = "inline";
    smallImagesInModal[img_number - 1].className += " selected"; 
    captionTextElement.innerHTML = img_number+" / "+img_sum;
       
       
    var smallImages = imgPreviewModal.getElementsByClassName("smallImageInModal");
    if(!smallImagesInModal[0].hasAttribute("src")){
        for(var i=0; i<smallImagesInModal.length; i++){
            smallImagesInModal[i].src = smallImagesInModal[i].dataset.imgSrc;
            mainImagesInModal[i].src = mainImagesInModal[i].dataset.imgSrc;
        }
//        var mainImage = imgPreviewModal.getElementsByClassName("mainImageInModal")[0];
//        mainImage.src = mainImage.dataset.imgSrc;
    }
    //add event listeners for the small images in Modal view OR Add One Event Listener to the whole smallImageContainerInModal, with this small images will delegate event handling to the container
//    for (i=0; i < smallImagesInModal.length; i++){
//        smallImagesInModal[i].addEventListener("click", function(){imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement);});
//    }
    imgPreviewModal.querySelector(".smallImageContainerInModal").addEventListener("click", function(event){imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement,event);});
    
    //add event listener for close button
    imgPreviewModal.querySelector(".closeButtonModal").addEventListener("click", function(){closeModal(imgPreviewModal);});
    
    //add event listeners for image navigation by clicking the arrows OR pressing keyboard arrows
    imgPreviewModal.querySelector(".prevArrow").addEventListener("click", prevArrowCallback);
    imgPreviewModal.querySelector(".nextArrow").addEventListener("click", nextArrowCallback);
    function prevArrowCallback(){
        var currentSmallImg = imgPreviewModal.querySelector(".selected");
        var currentImgNumber = currentSmallImg.getAttribute("data-img-number");
        var newImgNumber;
        var newSmallImg;

        if(currentImgNumber == 1){
            newImgNumber = img_sum;
            newSmallImg= currentSmallImg.parentElement.lastElementChild;;
        }
        else{
            newImgNumber = currentImgNumber - 1;
            newSmallImg = currentSmallImg.previousElementSibling;
        }
        currentSmallImg.classList.remove("selected");
        newSmallImg.classList.add("selected");
        imgPreviewModal.querySelector(".mainImageInModalContainer").children[currentImgNumber-1].style.display = "none";
        imgPreviewModal.querySelector(".mainImageInModalContainer").children[newImgNumber-1].style.display = "inline";
        captionTextElement.innerHTML = newImgNumber+" / "+img_sum;
    }
    function nextArrowCallback(){
        var currentSmallImg = imgPreviewModal.querySelector(".selected");
        var currentImgNumber = currentSmallImg.getAttribute("data-img-number");
        var newImgNumber;
        var newSmallImg;

        if(currentImgNumber == img_sum){         
            newImgNumber = 1;
            newSmallImg= currentSmallImg.parentElement.firstElementChild;;
        }
        else{
            newImgNumber = parseInt(currentImgNumber) + 1;
            newSmallImg = currentSmallImg.nextElementSibling;
        }
        currentSmallImg.classList.remove("selected");
        newSmallImg.classList.add("selected");
        imgPreviewModal.querySelector(".mainImageInModalContainer").children[currentImgNumber-1].style.display = "none";       
        imgPreviewModal.querySelector(".mainImageInModalContainer").children[newImgNumber-1].style.display = "inline";      
        captionTextElement.innerHTML = newImgNumber+" / "+img_sum;
        
    }
    
    imgPreviewModal.querySelector(".mainImageInModalContainer").addEventListener("click",function(evt){
        imgPreviewModal.querySelector(".nextArrow").click();
    });
}

function imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement,evt){
 
    var newImgClicked = evt.target;   
    //check if event target( newImgClicked) is of type img meaning the user has clicked in one of the imgs, otherwise if the use just clicked the container body do nothing
    if(newImgClicked.tagName === "IMG"){
        var prev_img = imgPreviewModal.querySelector(".selected");
        var prev_img_number = prev_img.getAttribute("data-img-number");
        var prevMainImg = imgPreviewModal.querySelector(".mainImageInModalContainer").children[prev_img_number-1];

        prev_img.classList.remove("selected");
        prevMainImg.style.display = "none";

        var img_number = newImgClicked.getAttribute("data-img-number");
        var mainImg = imgPreviewModal.querySelector(".mainImageInModalContainer").children[img_number-1];

        mainImg.style.display = "inline";
        newImgClicked.className += " selected";
        captionTextElement.innerHTML = img_number+" / "+img_sum;  
    }
    else{
    }
}

function closeModal(imgPreviewModal){
    imgPreviewModal.style.display = "none";   
    cleanModalState(imgPreviewModal);
}

function cleanModalState(imgPreviewModal){

    //"unselect" small image and remove display of current-last main image in modal
    var lastSelectedSmallImg = imgPreviewModal.querySelector(".selected");
    var lastImgNumber = lastSelectedSmallImg.getAttribute("data-img-number");
    
    lastSelectedSmallImg.classList.remove("selected");
    imgPreviewModal.querySelector(".mainImageInModalContainer").children[lastImgNumber-1].style.display = "none";

    //unbind all event listeners by cloning and replacing the old with the cloned one
    var clonedModal = imgPreviewModal.cloneNode(true);
    imgPreviewModal.parentElement.replaceChild(clonedModal, imgPreviewModal);
}
