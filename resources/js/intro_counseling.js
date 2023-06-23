$(function(){
	$(".atc_howtouse .tab ul").slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 3000,
        speed: 500,
        fade: false,
        swipe: false,
        swipeToSlide: true,
        dots: false,
        arrows: false,
        focusOnSelect: true,
        pauseOnHover: false,
        pauseOnFocus: false,
        asNavFor: '.atc_howtouse .cnt ul'
    });
    $(".atc_howtouse .cnt ul").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 3000,
        speed: 500,
        fade: true,
        swipe: false,
        swipeToSlide: true,
        dots: false,
        arrows: false,
        pauseOnHover: false,
        pauseOnFocus: false,
        asNavFor: '.atc_howtouse .tab ul'
    });
});
