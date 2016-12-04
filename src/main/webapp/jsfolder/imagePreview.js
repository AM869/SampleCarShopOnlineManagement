
function openModal() {
  document.getElementById('myModal').style.display = "block";
}

function closeModal() {
  document.getElementById('myModal').style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1;}
  if (n < 1) {slideIndex = slides.length;}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}

//--------------------------------------------------
//--------------------------------------------------

var imgContainers = document.getElementsByClassName("smallImageContainer");
var i;
for(i =0; i<imgContainers.length; i++){
    imgContainers[i].addEventListener("click", function(){imgContainerCallback(this); });
}

function imgContainerCallback(imgContainer){
    
    var img_sum = imgContainer.getAttribute("data-img-sum");
    var img_clicked = event.target;
    var img_number = img_clicked.getAttribute("data-img-number");

    //if user didnt click an image but click inside the image container
    if ( img_number === null){
        img_number = 1;
    }
    var imgPreviewModal = imgContainer.parentElement.nextElementSibling;
    var initialMainImage = imgPreviewModal.firstElementChild.children[img_number];
    var smallImagesInModal = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
    var captionTextElement = imgPreviewModal.querySelector(".captionText");
    
    imgPreviewModal.style.display = "block";
    initialMainImage.style.display = "inline";
    smallImagesInModal[img_number - 1].className += " selected"; 
    captionTextElement.innerHTML = img_number+" / "+img_sum;
       
    //add event listeners for the small images in Modal view
    
    function gtp(){
        
        alert('lane klyik');
        imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement);
        
    }
    for (i=0; i < smallImagesInModal.length; i++){
        smallImagesInModal[i].addEventListener("click", gtp);
    }
    //---------------------
    
    
    
    function closeModal(){
     
    
    
               //"unselect" small image and remove display of current-last main image in modal
    var lastSelectedSmallImg = imgPreviewModal.querySelector(".selected");
    var lastImgNumber = lastSelectedSmallImg.getAttribute("data-img-number");
    
    lastSelectedSmallImg.classList.remove("selected");
    imgPreviewModal.firstElementChild.children[lastImgNumber].style.display = "none";

//    //unbind all event listeners by cloning and replacing the old with the cloned one
//    var clonedModal = imgPreviewModal.cloneNode(true);
//    imgPreviewModal.parentElement.replaceChild(clonedModal, imgPreviewModal);
    
        for (i=0; i < smallImagesInModal.length; i++){
        smallImagesInModal[i].removeEventListener("click", gtp);
    }
    imgPreviewModal.style.display = "none";      
    imgPreviewModal.querySelector(".closeButtonModal").removeEventListener("click", closeModal);
        alert('patisaX');
    }
    //----------------------------
    //
    //add event listener for close button
    imgPreviewModal.querySelector(".closeButtonModal").addEventListener("click", closeModal);
    //add event listeners for image navigation by clicking the arrows OR pressing keyboard arrows
        
}

function imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement){

    var newImgClicked = event.target;   

    var prev_img = imgPreviewModal.querySelector(".selected");
    var prev_img_number = prev_img.getAttribute("data-img-number");
    var prevMainImg = imgPreviewModal.firstElementChild.children[prev_img_number];

    prev_img.classList.remove("selected");
    prevMainImg.style.display = "none";
    
    var img_number = newImgClicked.getAttribute("data-img-number");
    var mainImg = imgPreviewModal.firstElementChild.children[img_number];
    
    mainImg.style.display = "inline";
    newImgClicked.className += " selected";
    captionTextElement.innerHTML = img_number+" / "+img_sum;  
}

//function closeModal(imgPreviewModal){
//    imgPreviewModal.style.display = "none";   
//    cleanModalState(imgPreviewModal);
//}
//
//function cleanModalState(imgPreviewModal){
//
//    //"unselect" small image and remove display of current-last main image in modal
//    var lastSelectedSmallImg = imgPreviewModal.querySelector(".selected");
//    var lastImgNumber = lastSelectedSmallImg.getAttribute("data-img-number");
//    
//    lastSelectedSmallImg.classList.remove("selected");
//    imgPreviewModal.firstElementChild.children[lastImgNumber].style.display = "none";
//
//    //unbind all event listeners by cloning and replacing the old with the cloned one
//    var clonedModal = imgPreviewModal.cloneNode(true);
//    imgPreviewModal.parentElement.replaceChild(clonedModal, imgPreviewModal);
//}