document.addEventListener('DOMContentLoaded', function() {
    const offerCards = document.querySelector('.offer-cards');
    const prevButton = document.querySelector('.carousel-prev');
    const nextButton = document.querySelector('.carousel-next');
    
    let cardWidth = offerCards.querySelector('.offer-card').offsetWidth;
    let scrollAmount = 0;
    
    // Desplazamiento automático
    function autoScroll() {
        scrollAmount += cardWidth;
        if (scrollAmount >= offerCards.scrollWidth - offerCards.clientWidth) {
            scrollAmount = 0; // Volver al inicio cuando llega al final
        }
        offerCards.scrollTo({
            left: scrollAmount,
            behavior: 'smooth' // Desplazamiento suave
        });
    }
    
    // Intervalo más lento y suave
    setInterval(autoScroll, 3000); // 3000 ms = 3 segundos por tarjeta

    // Función para moverse a la izquierda
    prevButton.addEventListener('click', function() {
        scrollAmount -= cardWidth;
        if (scrollAmount < 0) {
            scrollAmount = offerCards.scrollWidth - offerCards.clientWidth;
        }
        offerCards.scrollTo({
            left: scrollAmount,
            behavior: 'smooth'
        });
    });

    // Función para moverse a la derecha
    nextButton.addEventListener('click', function() {
        scrollAmount += cardWidth;
        if (scrollAmount >= offerCards.scrollWidth - offerCards.clientWidth) {
            scrollAmount = 0;
        }
        offerCards.scrollTo({
            left: scrollAmount,
            behavior: 'smooth'
        });
    });
});
