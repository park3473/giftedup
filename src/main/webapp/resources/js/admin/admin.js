$(document).ready(function () {
	
    $(".adm_menu_con li").click(function () {
        $(".adm_menu_con >li").find(".sub_menu_con").hide();
        $(".adm_menu_con >li").css({
            backgroundColor: "transparent"
        });
        $(this).find(".sub_menu_con").show();
        $(this).css({
            backgroundColor: "#fff"
        });
    });

    
    $.datetimepicker.setLocale('ko');
	$('.datecalendar').datetimepicker({
	    format:'Y.m.d',
	    lang: "ko",
	    timepicker:false
	});
	
	$.datetimepicker.setLocale('ko');
	$('.datecalendar2').datetimepicker({
	    format:'Y.m.d H:i',
	    lang: "ko",
	    timepicker:true
	});

    //모달 버튼
    $(".Excel").click(function () {
        $(".excel_modal_wrap").fadeIn(200);
        $(".modal_bg").fadeIn(200);
    });

    $(".modal_btn_con .cancel").click(function () {
        $(".excel_modal_wrap").fadeOut(200);
        $(".modal_bg").fadeOut(200);
    });

    $(".class_manual").click(function () {
        $(".classM_modal_wrap").fadeIn(200);
        $(".modal_bg").fadeIn(200);
    });

    $(".modal_btn_con .cancel").click(function () {
        $(".classM_modal_wrap").fadeOut(200);
        $(".modal_bg").fadeOut(200);
    });

    $(".class_auto").click(function () {
        $(".classA_modal_wrap").fadeIn(200);
        $(".modal_bg").fadeIn(200);
    });

    $(".modal_btn_con .cancel").click(function () {
        $(".classA_modal_wrap").fadeOut(200);
        $(".modal_bg").fadeOut(200);
    });

    $(".teacher_btn li").click(function () {
        $(".port_modal_wrap").fadeIn(200);
        $(".modal_bg").fadeIn(200);
    });

    $(".modal_btn_con .cancel").click(function () {
        $(".port_modal_wrap").fadeOut(200);
        $(".modal_bg").fadeOut(200);
    });

    $(".group_list_area ul li > a").click(function () {
        $(this).toggleClass("select_active");
    });


});
