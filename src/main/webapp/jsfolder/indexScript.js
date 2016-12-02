var addCarButton = document.getElementById("add_car_Button");
addCarButton.addEventListener("click",addCar);
var add_car_doc_fragment = document.getElementById("add_car_template").content;

function addCar (){
    var carNode = add_car_doc_fragment.cloneNode(true);
    var newImageButton = carNode.querySelector(".add_more_images_Button");
    newImageButton.addEventListener("click",function(){addImage(this);});
    addCarButton.parentElement.insertBefore(carNode, addCarButton);
}

function addImage(newImageButton){
    var new_image_div = newImageButton.previousElementSibling.cloneNode(true);
    newImageButton.parentElement.insertBefore(new_image_div,newImageButton);
}