/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.addEventListener('DOMContentLoaded', function() {
    var collTrigger = document.querySelector('.collapsible-trigger');
    var collContent = document.querySelector('.collapsible-content');

    if (collTrigger && collContent) {
        collTrigger.addEventListener('click', function() {
            if (collContent.style.display === 'block') {
                collContent.style.display = 'none';
            } else {
                collContent.style.display = 'block';
            }
        });
    }
});

