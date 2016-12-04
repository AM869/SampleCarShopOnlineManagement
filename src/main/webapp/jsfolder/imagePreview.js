
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
var entry_flag;
for(i =0; i<imgContainers.length; i++){
    imgContainers[i].addEventListener("click", function(){imgContainerCallback(this); });
}

function imgContainerCallback(imgContainer){
    
    var img_sum = imgContainer.getAttribute("data-img-sum");
    var img_clicked = event.target;
    var img_number = img_clicked.getAttribute("data-img-number");

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
    
    entry_flag = 1;
    
    //add event listeners for the small images in Modal view
    for (i=0; i < smallImagesInModal.length; i++){
        smallImagesInModal[i].addEventListener("click", function(){imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement);});
    }
    
    //add event listener for close button
    imgPreviewModal.querySelector(".closeButtonModal").addEventListener("click", function(){alert('test valid function');closeModal(imgPreviewModal);});
    //add event listeners for image navigation by clicking the arrows OR pressing keyboard arrows
}

function imgContainerModalCallback(imgPreviewModal,img_sum,captionTextElement){

    var newImgClicked = event.target;   

    if(entry_flag === 1){
        //if we enter from outside modal do the following:
        var displayedImages = imgPreviewModal.firstElementChild.children;
        for(var i = 1; i<(displayedImages.length-1);i++){
            displayedImages[i].style.display = "none";
        }
        
        var smallImages = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
        for(var i = 0; i< smallImages.length; i++){
            smallImages[i].classList.remove("selected");
        }
        entry_flag = 0;
    }
    else{
        var prev_img = imgPreviewModal.querySelector(".selected");
        var prev_img_number = prev_img.getAttribute("data-img-number");
        var prevMainImg = imgPreviewModal.firstElementChild.children[prev_img_number];

        prev_img.classList.remove("selected");
        prevMainImg.style.display = "none";
    }
    
    var img_number = newImgClicked.getAttribute("data-img-number");
    var mainImg = imgPreviewModal.firstElementChild.children[img_number];
    
    mainImg.style.display = "inline";
    newImgClicked.className += " selected";
    captionTextElement.innerHTML = img_number+" / "+img_sum;
    
}

function closeModal(imgPreviewModal){
    imgPreviewModal.style.display = "none";   
    cleanModalState(imgPreviewModal);
}

function cleanModalState(imgPreviewModal){
    var displayedImages = imgPreviewModal.firstElementChild.children;
    for(var i = 1; i<(displayedImages.length-1);i++){
        displayedImages[i].style.display = "none";
    }
        
    var smallImages = imgPreviewModal.querySelector(".smallImageContainerInModal").children;
    for(var i = 0; i< smallImages.length; i++){
        smallImages[i].classList.remove("selected");
    }
}