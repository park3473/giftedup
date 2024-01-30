$(document).ready(function () {
    $('a[href="#"]').click(function (e) {
        e.preventDefault();
    });

    $("#new_hd_con .main_menu .nav_main a").mouseover(function () {
        $("#new_hd_con .main_menu .nav_main > li > a").addClass("a_color");
        $(".logo_img").addClass("logo_active");
        $("#new_hd_con .main_menu .nav_main > li .sub_main").fadeIn(100);
        $("#new_hd_con .menu_bg").fadeIn(100);
    });

    $("#new_hd_con .menu_bg").mouseout(function () {
        $("#new_hd_con .main_menu .nav_main > li > a").removeClass("a_color");
        $("#new_hd_con .main_menu .nav_main > li .sub_main").fadeOut(100);
        $(".logo_img").removeClass("logo_active");
        $("#new_hd_con .menu_bg").fadeOut(100);
    });

    $("#new_hd_con .m_main_menu .m_btn_con").click(function () {
        $(".m_nav_main").fadeIn(200);
        $(".m_menu_bg").fadeIn(200);
    });


    $("#new_hd_con .m_nav_close .m_close_bars").click(function () {
        $(".m_nav_main").fadeOut(200);
        $(".m_menu_bg").fadeOut(200);
    });


    var acodian = {
        click: function (target) {
            var _self = this,
                $target = $(target);
            $target.on('click', function () {
                var $this = $(this);
                if ($this.find('.m_sub_main').css('display') == 'none') {
                    $('.m_sub_main').slideUp();
                    _self.onremove($target);

                    $this.find("a").addClass("open");

                    $this.find(".m_sub_main").slideDown();
                } else {
                    $('.m_sub_main').slideUp();
                    _self.onremove($target);

                    $this.find("a").removeClass("open");
                }
            });
        },
        onremove: function ($target) {
            $target.find(".m_sub_main").slideUp();
            $target.find("a").removeClass("open");
        }
    };
    acodian.click('.m_menu');

    
    
    
    var scroll = $(window).scrollTop();
    //console.log(scroll);
    if (scroll >= 80) {
        //console.log('a');
        $(".m_main_menu").css({
            backgroundColor: "#fff",
            boxShadow: "0 1px 5px rgba(0,0,0,0.2)"
        });
        $(".m_main_menu .logo_off").hide();
        $(".m_main_menu .logo_on").fadeIn(200);
        $(".m_btn_con").find(".patty").css({
            backgroundColor: "#05304d"
        });
    } else {
        //console.log('a');
        $(".m_main_menu").css({
            backgroundColor: "transparent",
            boxShadow: "none"
        });
        $(".m_main_menu .logo_off").fadeIn(200);
        $(".m_main_menu .logo_on").hide();
        $(".m_btn_con").find(".patty").css({
            backgroundColor: "#fff"
        });
    }

    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        //console.log(scroll);
        if (scroll >= 80) {
            //console.log('a');
            $(".m_main_menu").css({
                backgroundColor: "#fff",
                boxShadow: "0 1px 5px rgba(0,0,0,0.2)"
            });
            $(".m_main_menu .logo_off").hide();
            $(".m_main_menu .logo_on").fadeIn(200);
            $(".m_btn_con").find(".patty").css({
                backgroundColor: "#05304d"
            });
        } else {
            //console.log('a');
            $(".m_main_menu").css({
                backgroundColor: "transparent",
                boxShadow: "none"
            });
            $(".m_main_menu .logo_off").fadeIn(200);
            $(".m_main_menu .logo_on").hide();
            $(".m_btn_con").find(".patty").css({
                backgroundColor: "#fff"
            });
        }
    });


    var subacodian = {
        click: function (target) {
            var _self = this,
                $target = $(target);
            $target.on('click', function () {
                var $this = $(this);
                if ($this.find('.sub_ul_menu').css('display') == 'none') {
                    $('.sub_ul_menu').slideUp();
                    _self.onremove($target);

                    $this.find("a").addClass("sub_open");

                    $this.find(".sub_ul_menu").slideDown();
                } else {
                    $('.sub_ul_menu').slideUp();
                    _self.onremove($target);

                    $this.find("a").removeClass("sub_open");
                }
            });
        },
        onremove: function ($target) {
            $target.find(".sub_ul_menu").slideUp();
            $target.find("a").removeClass("sub_open");
        }
    };
    subacodian.click('.sub_nav_menu');



    $(".port_btn").click(function () {
        $(".port_modal_wrap").fadeIn(200);
        $(".modal_bg").fadeIn(200);
    });

    $(".modal_btn_con .cancel").click(function () {
        $(".port_modal_wrap").fadeOut(200);
        $(".modal_bg").fadeOut(200);
    });
    /*
    $(".modal_box").draggable({
		containment: "window",
		scroll: false
	});
	*/
});
