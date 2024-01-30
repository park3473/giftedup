$(document).ready(function(){
    $('.slider_con').slick({
        dots: true,
        infinite: true,
        speed: 300,
        slidesToShow: 1,
        autoplay: true,
        autoplaySpeed: 5000,
        fade: true,
        pauseOnHover: false,
        swipe: true,
        prevArrow: "<img class='a-left control-c prev slick-prev' src='/kaist/resources/img/slide_btn_left.png'>",
        nextArrow: "<img class='a-right control-c next slick-next' src='/kaist/resources/img/slide_btn_right.png'>"
    });
    
});