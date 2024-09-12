/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


document.addEventListener('DOMContentLoaded', function() {
    var carousel = document.querySelector('#carouselExampleControls');
    var miniImages = document.querySelectorAll('.mini-image');
    
    function updateMiniImages() {
        var activeItem = carousel.querySelector('.carousel-item.active');
        var activeImage = activeItem.querySelector('.large-image').src;
        
        miniImages.forEach(function(img) {
            if (img.src === activeImage) {
                img.classList.add('active-mini');
            } else {
                img.classList.remove('active-mini');
            }
        });
    }
    
    updateMiniImages(); // Initialize on page load

    // Update mini images on carousel slide change
    carousel.addEventListener('slid.bs.carousel', updateMiniImages);
});
