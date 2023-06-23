$(document).ready(function (){
	function myHis () {
		if($('.bxslider_his1').length>0){
			var bxshis1=$('.bxslider_his1').bxSlider({
				auto : true,
				autoHover : true,
				autoControls : false,
				pause: 4000,
				controls : true,
				pager: false,			
				touchEnabled : false,
				onSlideBefore: function ($slideElement, oldIndex, newIndex){
					var current_index = parseInt(newIndex + 1);               
	                $('#bxslider_his1_view_no').text(current_index);                
				}
			});
			bxshis1.reloadSlider();
		}
		
		if($('.bxslider_his2').length>0){
			var bxshis2=$('.bxslider_his2').bxSlider({
				auto : true,
				autoHover : true,
				autoControls : false,
				pause: 4000,
				controls : true,
				pager: false,
				touchEnabled : false,
				onSlideBefore: function ($slideElement, oldIndex, newIndex){
					var current_index = parseInt(newIndex + 1);				
					if(current_index >1){
						current_index = (current_index*3)/3;
					}
	                $('#bxslider_his2_view_no').text(current_index);                
				}
			});
			bxshis2.reloadSlider();
		}

		if($('.bxslider_his3').length>0){
			var bxshis3=$('.bxslider_his3').bxSlider({
				auto : true,
				autoHover : true,
				autoControls : false,
				pause: 4000,
				controls : true,
				pager: false,
				touchEnabled : false,
				onSlideBefore: function ($slideElement, oldIndex, newIndex){
					var current_index = parseInt(newIndex + 1);               
	                $('#bxslider_his3_view_no').text(current_index);                
				}
			});
			bxshis3.reloadSlider();
		}

		if($('.bxslider_his4').length>0){
			var bxshis4=$('.bxslider_his4').bxSlider({
				auto : true,
				autoHover : true,
				autoControls : false,
				pause: 4000,
				controls : true,
				pager: false,
				touchEnabled : false,
				onSlideBefore: function ($slideElement, oldIndex, newIndex){
					var current_index = parseInt(newIndex + 1);				
					if(current_index >1){
						current_index = (current_index*3)/3;
					}
	                $('#bxslider_his4_view_no').text(current_index);                
				}
			});
			bxshis4.reloadSlider();
		}

		if($('.bxslider_his5').length>0){
			var bxshis5=$('.bxslider_his5').bxSlider({
				auto : true,
				autoHover : true,
				autoControls : false,
				pause: 4000,
				controls : true,
				pager: false,
				touchEnabled : false,
				onSlideBefore: function ($slideElement, oldIndex, newIndex){
					var current_index = parseInt(newIndex + 1);               
	                $('#bxslider_his5_view_no').text(current_index);                
				}
			});
			bxshis5.reloadSlider();
		}

		if($('.bxslider_his6').length>0){
			var bxshis6=$('.bxslider_his6').bxSlider({
				auto : true,
				autoHover : true,
				autoControls : false,
				pause: 4000,
				controls : true,
				pager: false,
				touchEnabled : false,
				onSlideBefore: function ($slideElement, oldIndex, newIndex){
					var current_index = parseInt(newIndex + 1);				
					if(current_index >1){
						current_index = (current_index*3)/3;
					}
	                $('#bxslider_his6_view_no').text(current_index);                
				}
			});
			bxshis6.reloadSlider();
		}

		$(".my_history .area .real_area .txt .tab_split .tab_btn li button").on("click", function  () {
			var tgIdx=$(this).parent().index();

			$(this).parent().addClass("on").siblings().removeClass("on");
			$(this).closest(".tab_split").find(">.tab_cnt>div").eq(tgIdx).show().siblings().hide();

			bxshis1.reloadSlider();
			bxshis2.reloadSlider();
			bxshis3.reloadSlider();
			bxshis4.reloadSlider();
			bxshis5.reloadSlider();
			bxshis6.reloadSlider();
		});
	}
	myHis();
});