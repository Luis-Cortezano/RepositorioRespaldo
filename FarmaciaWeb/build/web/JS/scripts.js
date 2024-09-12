/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $('.carousel').slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 3000, // Adjust speed as needed
      arrows: true,
      prevArrow: '<button class="carousel-button prev">Prev</button>',
      nextArrow: '<button class="carousel-button next">Next</button>',
    });
  });