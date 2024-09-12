/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


document.addEventListener('DOMContentLoaded', function() {
    const offerCards = document.querySelector('.offer-cards');
    let scrollAmount = 0;
    
    function autoScroll() {
        scrollAmount += 1;
        offerCards.scrollLeft = scrollAmount;
        if (scrollAmount >= offerCards.scrollWidth - offerCards.clientWidth) {
            scrollAmount = 0;
        }
    }

    setInterval(autoScroll, 50); // Ajusta la velocidad del carrusel automático
});
