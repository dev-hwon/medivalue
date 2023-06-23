<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="robots" content="all" />
	<meta name="format-detection" content="telephone=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi"/>
	<meta property="og:title" content="메디밸류-스토어">
	<meta property="og:description" content="최초의 의료재료 직거래 커머스 플랫폼">
	<meta name="description" content="최초의 의료재료 직거래 커머스 플랫폼">
	<meta property="og:image" content="/resources/images/main_renew/img_og_image.jpg">
	<meta name="robots" content="index,follow">
	<title>메디밸류-스토어</title>
	<meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">
	<%--
    <link rel="apple-touch-icon" sizes="" href="#" />
    --%>
	<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
	<style>
		body{margin:0; padding:0;}
		.wrap{}
		.wrap .img{}
		.wrap .img img{width:100%; display:block;}
	</style>
	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
				new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
			j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
			'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-5RNFZSC');</script>
	<!-- End Google Tag Manager -->

	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5RNFZSC"
					  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
</head>
<body>
	<div class="wrap">
        <div class="img">
            <img src="/resources/images/main_renew/mobile_introduce.jpg?v20230615" alt="">
        </div>
    </div>
</body>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }

	let param = new URLSearchParams(location.search);

	  if (param.has("utm_source") && param.get("utm_source") === "mobile") {
		  alert("AI가 선별한 기공소에 기공수가표를 요청했어요.\n기공수가표는 메디밸류 PC에서 확인해주세요.");
	  }
  })();
  ChannelIO('boot', {
    "pluginKey": "0f535368-1d85-49c0-af56-c3a12d95d3a6"
  });
  
</script>
<!-- End Channel Plugin -->
</html>