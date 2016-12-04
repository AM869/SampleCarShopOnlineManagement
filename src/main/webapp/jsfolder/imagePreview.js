
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
var smallImgContainers = document.getElementsByClassName("smallImageContainer");

var containerCount;
for(containerCount=0; containerCount < smallImgContainers.length; containerCount++){
    var imgContainer = smallImgContainers[containerCount];
    imgContainer.addEventListener("click", function(){displayImgPreviewModal(this);});
}

function displayImgPreviewModal(imgContainer){
    var img_sum = imgContainer.getAttribute("data-img-sum");
    var img_number = event.target.getAttribute("data-img-number");
    if (img_number === null){
        img_number = 1;
    }
    var imgPreviewModal = imgContainer.nextElementSibling;
    
    var mainImage = imgPreviewModal.firstElementChild.children[img_number-1];    
       
    imgPreviewModal.querySelector(".captionText").innerHTML = img_number+" / "+img_sum;
    imgPreviewModal.style.display = "block";
    mainImage.style.display = "inline";
    
    var smallImageContainerInModal = imgPreviewModal.querySelector(".smallImageContainerInModal");
    
    smallImageContainerInModal.children[img_number - 1].className += " selected";
    //add event listeners for all children regardles of the one we clicked
    var small_images = smallImageContainerInModal.children;
    var image_count;
    for(image_count=0; image_count < small_images.length; image_count++){
        small_images[image_count].addEventListener("click", function(){inModalEventCallback(smallImageContainerInModal,this,img_sum);});
    }
    
}

function inModalEventCallback(smallImgContainerInModal,selectedImage,img_sum){
//    alert(clickedImage.getAttribute("data-img-number"));
//    var smallImgContainerInModal = clickedImage.parentElement;
    var mainImgContainerInModal = smallImgContainerInModal.previousElementSibling.previousElementSibling;
    
    var prev_selected_image = smallImgContainerInModal.querySelector(".selected");
    var prev_img_number = prev_selected_image.getAttribute("data-img-number");
    prev_selected_image.className.replace(" selected", "");
    mainImgContainerInModal.children[prev_img_number-1].style.display = "none";
    
    var img_number = selectedImage.getAttribute("data-img-number");
    selectedImage.className += " selected";
     mainImgContainerInModal.children[img_number - 1].style.display = "inline";
     
     smallImgContainerInModal.previousElementSibling.innerHTML = img_number+" / "+img_sum;
     
}



var imgContainers = document.getElementsByClassName("smallImageContainer");
var i;
var entry_flag;
for(i =0; i<imgContainers.length; i++){
    imgContainers[i].addEventListener("click", function(){imgContainerCallback(this); });
}

function imgContainerCallback(imgContainer){
    
    var img_sum = imgContainer.getAttribute("data-img-sum");
    var img_clicked = event.target;
    var img_number = img_clicked.getAttribute("data-img-number");
    //user might just click inside the image container not just a specific image, the selected img number will default to one if that happens
    if ( img_number === null){
        img_number = 1;
    }
    
    
    var imgPreviewModal = imgContainer.parentElement.nextElementSibling;
    var initialMainImage = imgPreviewModal.firstElementChild.children[img_number-1];
    var smallImagesInModal = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
    var captionTextElement = imgPreviewModal.querySelector(".captionText");
    
    imgPreviewModal.style.display = "block";
    initialMainImage.style.display = "inline";
    smallImagesInModal[img_number - 1].className += " selected"; 
    captionTextElement.innerHTML = img_number+" / "+img_sum;
    
    entry_flag = 1;
    //add event listener to imgs in modal too
    for (i=0; i < smallImagesInModal.length; i++){
        smallImagesInModal[i].addEventListener("click", function(){imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement);});
    }
}


function imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement){

    var newImgClicked = event.target;

//    var displayedImages = imgPreviewModal.firstElementChild.children;
//    var smallImages = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
//        for(var i = 0; i<displayedImages.length;i++){
//            
//            alert('for mainimagemodal container, imgNumber: '+displayedImages[i].dataset.imgNumber+" display: "+displayedImages[i].style.display +"\n"+
//                    
//                'for smallimagemodal container, imgNumber '+smallImages[i].dataset.imgNumber+ ' className: '+smallImages[i].className);
////            alert(displayedImages[i].dataset.imgNumber);
////            alert(displayedImages[i].style.display);
//            
////            alert('for smallimagemodal container, imgNumber '+smallImages[i].dataset.imgNumber+ ' className: '+smallImages[i].className);
////            alert(smallImages[i].dataset.imgNumber);
////            alert(smallImages[i].className);
//        }
    
    
    
    if(entry_flag === 1){
        //if we enter from outside modal do the following:
        var displayedImages = imgPreviewModal.firstElementChild.children;
        for(var i = 0; i<displayedImages.length;i++){
            displayedImages[i].style.display = "none";
        }
        
        var smallImages = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
        for(var i = 0; i< smallImages.length; i++){
//            alert('before'+smallImages[i].className);
            smallImages[i].classList.remove("selected");
//            alert('after'+smallImages[i].className);
        }
        entry_flag = 0;
    }
    else{
        var prev_img = imgPreviewModal.querySelector(".selected");
        var prev_img_number = prev_img.getAttribute("data-img-number");
        var prevMainImg = imgPreviewModal.firstElementChild.children[prev_img_number - 1];

//        alert('before'+prev_img.className);
        prev_img.classList.remove("selected");
//        alert('before'+prev_img.className);
        prevMainImg.style.display = "none";
    }
    
    var img_number = newImgClicked.getAttribute("data-img-number");
    var mainImg = imgPreviewModal.firstElementChild.children[img_number-1];
    mainImg.style.display = "inline";
    newImgClicked.className += " selected";
    captionTextElement.innerHTML = img_number+" / "+img_sum;
    
}