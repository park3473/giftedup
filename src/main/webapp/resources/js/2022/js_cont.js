//카운트(숫자)
(function ($) {
$.fn.countTo = function (options) {
options = options || {};

return $(this).each(function () {
// set options for current element
var settings = $.extend({}, $.fn.countTo.defaults, {
from:            $(this).data('from'),
to:              $(this).data('to'),
speed:           $(this).data('speed'),
refreshInterval: $(this).data('refresh-interval'),
decimals:        $(this).data('decimals')
}, options);

// how many times to update the value, and how much to increment the value on each update
var loops = Math.ceil(settings.speed / settings.refreshInterval),
increment = (settings.to - settings.from) / loops;

// references & variables that will change with each update
var self = this,
$self = $(this),
loopCount = 0,
value = settings.from,
data = $self.data('countTo') || {};

$self.data('countTo', data);

// if an existing interval can be found, clear it first
if (data.interval) {
clearInterval(data.interval);
}
data.interval = setInterval(updateTimer, settings.refreshInterval);

// initialize the element with the starting value
render(value);

function updateTimer() {
value += increment;
loopCount++;

render(value);

if (typeof(settings.onUpdate) == 'function') {
settings.onUpdate.call(self, value);
}

if (loopCount >= loops) {
// remove the interval
$self.removeData('countTo');
clearInterval(data.interval);
value = settings.to;

if (typeof(settings.onComplete) == 'function') {
settings.onComplete.call(self, value);
}
}
}

function render(value) {
var formattedValue = settings.formatter.call(self, value, settings);
$self.html(formattedValue);
}
});
};

$.fn.countTo.defaults = {
from: 0,               // the number the element should start at
to: 0,                 // the number the element should end at
speed: 1000,           // how long it should take to count between the target numbers
refreshInterval: 1,  // 빠르기
decimals: 0,           // the number of decimal places to show
formatter: formatter,  // handler for formatting the value before rendering
onUpdate: null,        // callback method for every time the element is updated
onComplete: null       // callback method for when the element finishes updating
};

function formatter(value, settings) {
return value.toFixed(settings.decimals);
}
}(jQuery));

jQuery(function ($) {
// custom formatting example
$('.count-number').data('countToOptions', {
formatter: function (value, options) {
return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
}
});

// start all the timers
$('.timer').each(count);

function count(options) {
var $this = $(this);
options = $.extend({}, options || {}, $this.data('countToOptions') || {});
$this.countTo(options);
}
});

//반응형탭 셀렉트
$(function() {
var $tabButtonItem = $('#tab-button li'),
$tabSelect = $('#tab-select'),
$tabContents = $('.tab-contents'),
activeClass = 'is-active';

$tabButtonItem.first().addClass(activeClass);
$tabContents.not(':first').hide();

$tabButtonItem.find('a').on('click', function(e) {
var target = $(this).attr('href');

$tabButtonItem.removeClass(activeClass);
$(this).parent().addClass(activeClass);
$tabSelect.val(target);
$tabContents.hide();
$(target).show();
e.preventDefault();
});

$tabSelect.on('change', function() {
var target = $(this).val(),
targetSelectNum = $(this).prop('selectedIndex');

$tabButtonItem.removeClass(activeClass);
$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
$tabContents.hide();
$(target).show();
});
});

//사이드메뉴
(function($){
$(document).ready(function(){
$('#cssmenu li.active').addClass('open').children('ul').show();
$('#cssmenu li.has-sub>a').on('click', function(){
$(this).removeAttr('href');
var element = $(this).parent('li');
if (element.hasClass('open')) {
element.removeClass('open');
element.find('li').removeClass('open');
element.find('ul').slideUp(200);
}
else {
element.addClass('open');
element.children('ul').slideDown(200);
element.siblings('li').children('ul').slideUp(200);
element.siblings('li').removeClass('open');
element.siblings('li').find('li').removeClass('open');
element.siblings('li').find('ul').slideUp(200);
}
});
});
})(jQuery);

//모바일사이드메뉴바
$(document).ready(function(){
$(".openMenu").click(function(){
$("body").toggleClass("menuOpened");
});

$(".menu_overlay").click(function(){
$("body").removeClass("menuOpened");
});
});

