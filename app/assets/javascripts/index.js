/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/*/

document.getElementById("year-range").addEventListener("change", getPhotos);


function populateYear (el) {
    console.log(el.value);
    document.getElementsByName('year-value')[0].value = el.value;
}

function getPhotos(el){
    populateYear(el);
    
}
console.log (gon.photos);
$(document).ready(function(){
    $('#myCarousel').on('slid.bs.carousel', function () {
    //     alert('hi');
        var elem = document.getElementsByClassName('active');
        var link = elem[0].firstElementChild.getAttribute('src');
        console.log(link);
        for (var i=0; i<gon.photos.length;i++) {
            console.log(gon.photos[i]['link']);
            if (gon.photos[i]['link'] == link){
                document.getElementById('photo-title').innerHTML = gon.photos[i]['title'];
                document.getElementById('photo-story').innerHTML = gon.photos[i]['story'];
                document.getElementById('photo-location').innerHTML = gon.photos[i]['place_taken'];
                document.getElementById('photo-date').innerHTML = gon.photos[i]['date_taken'];
                break;
            }
        }
    });
});


