$(document).ready(function () {
    
    
    
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
        prevArrow: "<img class='a-left control-c prev slick-prev' src='/resources/img/slide_btn_left.png'>",
        nextArrow: "<img class='a-right control-c next slick-next' src='/resources/img/slide_btn_right.png'>"
    });


    $('.prom_slider').slick({
        infinite: true,
        rows: 2,
        slidesToShow: 2,
        slidesToScroll: 2,
        dots: false,
        speed: 300,
        prevArrow: "<div class='slick-prev'><img class='prom_next control-c next' src='/resources/img/prom_prev_btn.png'></div>",
        nextArrow: "<div class='slick-next'><img class='prom_next control-c next' src='/resources/img/prom_next_btn.png'></div>",
        responsive: [
            {
                breakpoint: 572,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            }
        ]
    });

    $('.banner_slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        speed: 300,
        prevArrow: "<div class='slick-prev'><img class='prom_next control-c next' src='/resources/img/prom_prev_btn.png'></div>",
        nextArrow: "<div class='slick-next'><img class='prom_next control-c next' src='/resources/img/prom_next_btn.png'></div>",
    });
    
    $('.ft_slider').slick({
    	infinite: true,
    	slidesToShow: 8,
    	slidesToScroll: 7,
    	dots: false,
    	speed:300,
    	prevArrow: "<div class='slick-prev'><img class='prom_next control-c next' src='/resources/img/prom_prev_btn.png'></div>",
    	nextArrow: "<div class='slick-next'><img class='prom_next control-c next' src='/resources/img/prom_next_btn.png'></div>",
    });
});
