window.onscroll = function() {scrollNav()};

function scrollNav(){
const navbar = document.querySelector('.navbar-wagon');
const search_nav = document.getElementById('search_nav');
const location_nav = document.getElementById('btn-location');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > window.innerHeight /2) {
        navbar.classList.add('navbar-wagon_scroll');
      } else {
        navbar.classList.remove('navbar-wagon_scroll');
      }
    });
  }
  if (search_nav) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > window.innerHeight /2) {
        search_nav.classList.remove('navbar-search-show');
        location_nav.classList.remove('navbar-search-show');
      } else {
        search_nav.classList.add('navbar-search-show');
        location_nav.classList.add('navbar-search-show');
      }
    });
  }
}

$(document).ready(function(){
  $("#show_categories_navbar").click(function(){
    $("#categories-navbar").toggleClass("categories-navbar-hide");
      window.addEventListener('scroll', () => {

        if (window.scrollY > window.innerHeight /2) {
          $("#categories-navbar").removeClass('categories-navbar-hide');
        } else {
          $("#categories-navbar").addClass('categories-navbar-hide');
        }
      });
  });
});
