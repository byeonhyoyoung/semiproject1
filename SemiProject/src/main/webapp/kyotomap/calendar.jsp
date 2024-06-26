<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<style type="text/css">
*{
	font-family: 'Noto Sans KR';
}
body {
	background-color: white;
	margin: 0; /* body의 기본 마진 제거 */
	padding: 0; /* body의 기본 패딩 제거 */
}
header {
    padding: 20px;
    text-align: center;
    height: 300px; /* 헤더의 높이를 설정 */
    position: relative; /* 포지션 상대로 설정 */
    overflow: hidden; /* 자식 요소가 넘치는 경우 숨김 */
    border: 0px solid black;
}
header .header-image {
	width: 100%;
    height: 100%;
    background-image: url('./kyotomap/image/bloom.jpg');
    background-size: cover;
    background-position: center;
}
header h1 {
    position: absolute;
    top: 50%; /* 부모 요소(header)의 중앙에서 위치 */
    left: 50%; /* 부모 요소(header)의 중앙에서 위치 */
    transform: translate(-50%, -50%); /* 가운데 정렬 */
    margin: 0;
    color: white;
    font-size: 54px;
    font-weight: bold;
}
.BloomProgression {
    padding: 20px;
    display: flex;
    justify-content: center; /* 요소를 수평 중앙 정렬 */
    align-items: center; /* 요소를 수직 중앙 정렬 */
    border: 0px solid black;
}
.BloomProgression ul {
	height: 200px;
    list-style: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap; /* 요소들을 여러 줄로 감싸기 */
    justify-content: space-around; /* 요소들을 가로 방향으로 공간을 균등하게 배치 */
    align-items: center; /* 요소를 수직 중앙 정렬 */
    border: 0px solid black;
}

.BloomProgression ul li {
    flex-basis: 24%; /* 요소 너비를 조정하여 4개씩 배열 (약간 여유 공간 확보) */
    margin-bottom: 20px; /* 요소 아래 간격 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
    border: 0px solid black;

}
.location{
	width: 200px;
	height: 100px;
}
.icon img {
    width: 30px; /* 아이콘 이미지 크기 조절 */
}
tbody {
    height: 400px; /* 원하는 높이로 설정 */
    overflow-y: auto; /* tbody의 내용이 넘칠 경우 스크롤 표시 */
}
table {
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    border-collapse: collapse;
    width: 100%%; /* 테이블 전체 너비 지정 */
    margin-top: 20px; /* 위쪽 마진 설정 */
    border: none; /* 테이블 테두리 설정 */
}
table th, table td {
    padding: 10px;
    border: 1px solid #ccc; /* 셀 테두리 설정 */
}
table th {
    background-color: #e7708d; /* 테이블 헤더 배경색 */
    color: #fff; /* 테이블 헤더 글자색 */
    font-weight: bold;
    border: 1px solid #ccc; /* 셀 테두리 설정 */
}
.is-sticky {
    background-color: #fcf1f4; /* 테이블 셀(머리글) 배경색 */
    font-weight: bold;
}
.is-sticky a{
    text-decoration: none;
    color: gray;
}
.date {
    position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 24px;
	text-align: center;
}
.diagonal {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) rotate(-45deg);
	width: 40px; /* 대각선의 길이 조절 가능 */
	height: 2px; /* 대각선의 두께 조절 가능 */
	background-color: #333; /* 대각선의 색상 설정 */
}
.month {
    position: relative;
    top: 22px;
    right: 15px;
}

.day {
	position: relative;
    top: -12px;
    left: 15px;
}
.image{
	width: 100%;
	height: 200px;
	background-size: cover;
}
.container {
	width: 100%; /* 부모 요소의 너비를 확보 */
    max-width: 1400px; /* 최대 너비 설정 */
    margin: 0 auto;
}
.report {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 250px;
}
.report header {
    text-align: center;
    width: 100%;
}
.report h2 {
    font-size: 54px;
    font-weight: bold;
}
.bloom-stage-container {
	width: 1400px;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 0px solid black;
}
.bloom-stage-select-wrapper {
    flex: 1;
    margin-left: 10px; /* 필요에 따라 마진 조정 */
}
#bloomStageSelect {
    width: 250px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    font-size: 16px;
}
#bloomStageResults{
	display: flex;
    justify-content: flex-start; /* 요소들을 왼쪽 정렬 */
    align-items: flex-start; /* 요소들을 위쪽 정렬 */
    padding: 20px; /* 요소들의 외부 여백 추가 */
    box-sizing: border-box;
    border: 0px solid black;
}
#bloomStageResults ul {
    display: flex; /* 내부 li 요소를 가로 방향으로 정렬 */
	flex-wrap: wrap; /* 내부 요소가 여러 줄에 걸쳐 표시될 수 있도록 설정 */
	padding: 0;
	list-style: none;
	width: 100%;
	
}
#bloomStageResults ul li {
	margin-right:20px;
	border: 0px solid #ccc;
	box-sizing: border-box; /* 내부 여백, 테두리 포함 */
	width: calc((100% - 60px)/4);
	margin-bottom: 40px;
}
#bloomStageResults ul li:nth-last-child(4n) {
   margin-right: 0
}
@media (max-width: 1200px) {
    #bloomStageResults ul {
        flex-basis: 33.33%; /* 화면이 작을 때 3개씩 배치 */
    }
}

@media (max-width: 800px) {
    #bloomStageResults ul {
        flex-basis: 50%; /* 화면이 아주 작을 때 2개씩 배치 */
    }
}



@-webkit-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-o-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-ms-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-moz-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-webkit-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-o-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-ms-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-moz-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-webkit-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-o-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-ms-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-moz-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-webkit-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-o-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-ms-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-moz-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-webkit-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-o-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-ms-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-moz-keyframes blow-medium-lerightft {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-webkit-keyframes sway-0 {
    0% {
        -webkit-transform: rotate(-5deg)
    }
    40% {
        -webkit-transform: rotate(28deg)
    }
    100% {
        -webkit-transform: rotate(3deg)
    }
}

@-o-keyframes sway-0 {
    0% {
        -o-transform: rotate(-5deg)
    }
    40% {
        -o-transform: rotate(28deg)
    }
    100% {
        -o-transform: rotate(3deg)
    }
}

@-ms-keyframes sway-0 {
    0% {
        -ms-transform: rotate(-5deg)
    }
    40% {
        -ms-transform: rotate(28deg)
    }
    100% {
        -ms-transform: rotate(3deg)
    }
}

@-moz-keyframes sway-0 {
    0% {
        -moz-transform: rotate(-5deg)
    }
    40% {
        -moz-transform: rotate(28deg)
    }
    100% {
        -moz-transform: rotate(3deg)
    }
}

@keyframes sway-0 {
    0% {
        transform: rotate(-5deg)
    }
    40% {
        transform: rotate(28deg)
    }
    100% {
        transform: rotate(3deg)
    }
}

@-webkit-keyframes sway-1 {
    0% {
        -webkit-transform: rotate(10deg)
    }
    40% {
        -webkit-transform: rotate(43deg)
    }
    100% {
        -webkit-transform: rotate(15deg)
    }
}

@-o-keyframes sway-1 {
    0% {
        -o-transform: rotate(10deg)
    }
    40% {
        -o-transform: rotate(43deg)
    }
    100% {
        -o-transform: rotate(15deg)
    }
}

@-ms-keyframes sway-1 {
    0% {
        -ms-transform: rotate(10deg)
    }
    40% {
        -ms-transform: rotate(43deg)
    }
    100% {
        -ms-transform: rotate(15deg)
    }
}

@-moz-keyframes sway-1 {
    0% {
        -moz-transform: rotate(10deg)
    }
    40% {
        -moz-transform: rotate(43deg)
    }
    100% {
        -moz-transform: rotate(15deg)
    }
}

@keyframes sway-1 {
    0% {
        transform: rotate(10deg)
    }
    40% {
        transform: rotate(43deg)
    }
    100% {
        transform: rotate(15deg)
    }
}

@-webkit-keyframes sway-2 {
    0% {
        -webkit-transform: rotate(15deg)
    }
    40% {
        -webkit-transform: rotate(56deg)
    }
    100% {
        -webkit-transform: rotate(22deg)
    }
}

@-o-keyframes sway-2 {
    0% {
        -o-transform: rotate(15deg)
    }
    40% {
        -o-transform: rotate(56deg)
    }
    100% {
        -o-transform: rotate(22deg)
    }
}

@-ms-keyframes sway-2 {
    0% {
        -ms-transform: rotate(15deg)
    }
    40% {
        -ms-transform: rotate(56deg)
    }
    100% {
        -ms-transform: rotate(22deg)
    }
}

@-moz-keyframes sway-2 {
    0% {
        -moz-transform: rotate(15deg)
    }
    40% {
        -moz-transform: rotate(56deg)
    }
    100% {
        -moz-transform: rotate(22deg)
    }
}

@keyframes sway-2 {
    0% {
        transform: rotate(15deg)
    }
    40% {
        transform: rotate(56deg)
    }
    100% {
        transform: rotate(22deg)
    }
}

@-webkit-keyframes sway-3 {
    0% {
        -webkit-transform: rotate(25deg)
    }
    40% {
        -webkit-transform: rotate(74deg)
    }
    100% {
        -webkit-transform: rotate(37deg)
    }
}

@-o-keyframes sway-3 {
    0% {
        -o-transform: rotate(25deg)
    }
    40% {
        -o-transform: rotate(74deg)
    }
    100% {
        -o-transform: rotate(37deg)
    }
}

@-ms-keyframes sway-3 {
    0% {
        -ms-transform: rotate(25deg)
    }
    40% {
        -ms-transform: rotate(74deg)
    }
    100% {
        -ms-transform: rotate(37deg)
    }
}

@-moz-keyframes sway-3 {
    0% {
        -moz-transform: rotate(25deg)
    }
    40% {
        -moz-transform: rotate(74deg)
    }
    100% {
        -moz-transform: rotate(37deg)
    }
}

@keyframes sway-3 {
    0% {
        transform: rotate(25deg)
    }
    40% {
        transform: rotate(74deg)
    }
    100% {
        transform: rotate(37deg)
    }
}

@-webkit-keyframes sway-4 {
    0% {
        -webkit-transform: rotate(40deg)
    }
    40% {
        -webkit-transform: rotate(68deg)
    }
    100% {
        -webkit-transform: rotate(25deg)
    }
}

@-o-keyframes sway-4 {
    0% {
        -o-transform: rotate(40deg)
    }
    40% {
        -o-transform: rotate(68deg)
    }
    100% {
        -o-transform: rotate(25deg)
    }
}

@-ms-keyframes sway-4 {
    0% {
        -ms-transform: rotate(40deg)
    }
    40% {
        -ms-transform: rotate(68deg)
    }
    100% {
        -ms-transform: rotate(25deg)
    }
}

@-moz-keyframes sway-4 {
    0% {
        -moz-transform: rotate(40deg)
    }
    40% {
        -moz-transform: rotate(68deg)
    }
    100% {
        -moz-transform: rotate(25deg)
    }
}

@keyframes sway-4 {
    0% {
        transform: rotate(40deg)
    }
    40% {
        transform: rotate(68deg)
    }
    100% {
        transform: rotate(25deg)
    }
}

@-webkit-keyframes sway-5 {
    0% {
        -webkit-transform: rotate(50deg)
    }
    40% {
        -webkit-transform: rotate(78deg)
    }
    100% {
        -webkit-transform: rotate(40deg)
    }
}

@-o-keyframes sway-5 {
    0% {
        -o-transform: rotate(50deg)
    }
    40% {
        -o-transform: rotate(78deg)
    }
    100% {
        -o-transform: rotate(40deg)
    }
}

@-ms-keyframes sway-5 {
    0% {
        -ms-transform: rotate(50deg)
    }
    40% {
        -ms-transform: rotate(78deg)
    }
    100% {
        -ms-transform: rotate(40deg)
    }
}

@-moz-keyframes sway-5 {
    0% {
        -moz-transform: rotate(50deg)
    }
    40% {
        -moz-transform: rotate(78deg)
    }
    100% {
        -moz-transform: rotate(40deg)
    }
}

@keyframes sway-5 {
    0% {
        transform: rotate(50deg)
    }
    40% {
        transform: rotate(78deg)
    }
    100% {
        transform: rotate(40deg)
    }
}

@-webkit-keyframes sway-6 {
    0% {
        -webkit-transform: rotate(65deg)
    }
    40% {
        -webkit-transform: rotate(92deg)
    }
    100% {
        -webkit-transform: rotate(58deg)
    }
}

@-o-keyframes sway-6 {
    0% {
        -o-transform: rotate(65deg)
    }
    40% {
        -o-transform: rotate(92deg)
    }
    100% {
        -o-transform: rotate(58deg)
    }
}

@-ms-keyframes sway-6 {
    0% {
        -ms-transform: rotate(65deg)
    }
    40% {
        -ms-transform: rotate(92deg)
    }
    100% {
        -ms-transform: rotate(58deg)
    }
}

@-moz-keyframes sway-6 {
    0% {
        -moz-transform: rotate(65deg)
    }
    40% {
        -moz-transform: rotate(92deg)
    }
    100% {
        -moz-transform: rotate(58deg)
    }
}

@keyframes sway-6 {
    0% {
        transform: rotate(65deg)
    }
    40% {
        transform: rotate(92deg)
    }
    100% {
        transform: rotate(58deg)
    }
}

@-webkit-keyframes sway-7 {
    0% {
        -webkit-transform: rotate(72deg)
    }
    40% {
        -webkit-transform: rotate(118deg)
    }
    100% {
        -webkit-transform: rotate(68deg)
    }
}

@-o-keyframes sway-7 {
    0% {
        -o-transform: rotate(72deg)
    }
    40% {
        -o-transform: rotate(118deg)
    }
    100% {
        -o-transform: rotate(68deg)
    }
}

@-ms-keyframes sway-7 {
    0% {
        -ms-transform: rotate(72deg)
    }
    40% {
        -ms-transform: rotate(118deg)
    }
    100% {
        -ms-transform: rotate(68deg)
    }
}

@-moz-keyframes sway-7 {
    0% {
        -moz-transform: rotate(72deg)
    }
    40% {
        -moz-transform: rotate(118deg)
    }
    100% {
        -moz-transform: rotate(68deg)
    }
}

@keyframes sway-7 {
    0% {
        transform: rotate(72deg)
    }
    40% {
        transform: rotate(118deg)
    }
    100% {
        transform: rotate(68deg)
    }
}

@-webkit-keyframes sway-8 {
    0% {
        -webkit-transform: rotate(94deg)
    }
    40% {
        -webkit-transform: rotate(136deg)
    }
    100% {
        -webkit-transform: rotate(82deg)
    }
}

@-o-keyframes sway-8 {
    0% {
        -o-transform: rotate(94deg)
    }
    40% {
        -o-transform: rotate(136deg)
    }
    100% {
        -o-transform: rotate(82deg)
    }
}

@-ms-keyframes sway-8 {
    0% {
        -ms-transform: rotate(94deg)
    }
    40% {
        -ms-transform: rotate(136deg)
    }
    100% {
        -ms-transform: rotate(82deg)
    }
}

@-moz-keyframes sway-8 {
    0% {
        -moz-transform: rotate(94deg)
    }
    40% {
        -moz-transform: rotate(136deg)
    }
    100% {
        -moz-transform: rotate(82deg)
    }
}

@keyframes sway-8 {
    0% {
        transform: rotate(94deg)
    }
    40% {
        transform: rotate(136deg)
    }
    100% {
        transform: rotate(82deg)
    }
}

.sakura {
    background: -webkit-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -o-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -ms-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -moz-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    -webkit-border-radius: 12px 1px;
    -o-border-radius: 12px 1px;
    -ms-border-radius: 12px 1px;
    -moz-border-radius: 12px 1px;
    border-radius: 12px 1px;
    -webkit-pointer-events: none;
    -moz-pointer-events: none;
    -ms-pointer-events: none;
    -o-pointer-events: none;
    pointer-events: none;
    position: absolute
}

</style>
</head>


<script type="text/javascript">


$(window).load(function () {
    $('body').sakura();
});



(function ($) {
    // requestAnimationFrame Polyfill
    (function () {
        var lastTime = 0;
        var vendors = ['ms', 'moz', 'webkit', 'o'];

        for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
            window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
            window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] || window[vendors[x] + 'CancelRequestAnimationFrame'];
        }

        if (!window.requestAnimationFrame)
            window.requestAnimationFrame = function (callback, element) {
                var currTime = new Date().getTime();
                var timeToCall = Math.max(0, 16 - (currTime - lastTime));
                var id = window.setTimeout(function () {
                        callback(currTime + timeToCall);
                    },
                    timeToCall);
                lastTime = currTime + timeToCall;

                return id;
            };

        if (!window.cancelAnimationFrame)
            window.cancelAnimationFrame = function (id) {
                clearTimeout(id);
            };
    }());

    // Sakura function.
    $.fn.sakura = function (options) {
        // We rely on these random values a lot, so define a helper function for it.
        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

        // Helper function to attach cross-browser events to an element.
        var prefixes = ['moz', 'ms', 'o', 'webkit', ''];
        var prefCount = prefixes.length;

        function prefixedEvent(element, type, callback) {
            for (var i = 0; i < prefCount; i++) {
                if (!prefixes[i]) {
                    type = type.toLowerCase();
                }

                element.get(0).addEventListener(prefixes[i] + type, callback, false);
            }
        }

        // Defaults for the option object, which gets extended below.
        var defaults = {
            blowAnimations: ['blow-soft-left', 'blow-medium-left', 'blow-hard-left', 'blow-soft-right', 'blow-medium-right', 'blow-hard-right'],
            className: 'sakura',
            fallSpeed: 1,
            maxSize: 20,
            minSize: 15,
            newOn: 300,
            swayAnimations: ['sway-0', 'sway-1', 'sway-2', 'sway-3', 'sway-4', 'sway-5', 'sway-6', 'sway-7', 'sway-8']
        };

        var options = $.extend({}, defaults, options);

        // Declarations.
        var documentHeight = $(document).height();
        var documentWidth = $(document).width();
        var sakura = $('<div class="' + options.className + '" />');

        // Set the overflow-x CSS property on the body to prevent horizontal scrollbars.
        $('body').css({ 'overflow-x': 'hidden' });

        // Function that inserts new petals into the document.
        var petalCreator = function () {
            setTimeout(function () {
                requestAnimationFrame(petalCreator);
            }, options.newOn);

            // Get one random animation of each type and randomize fall time of the petals.
            var blowAnimation = options.blowAnimations[Math.floor(Math.random() * options.blowAnimations.length)];
            var swayAnimation = options.swayAnimations[Math.floor(Math.random() * options.swayAnimations.length)];
            var fallTime = (Math.round(documentHeight * 0.007) + Math.random() * 5) * options.fallSpeed;

            var animations = 'fall ' + fallTime + 's linear 0s 1' + ', ' +
                blowAnimation + ' ' + (((fallTime > 30 ? fallTime : 30) - 20) + getRandomInt(0, 20)) + 's linear 0s infinite' + ', ' +
                swayAnimation + ' ' + getRandomInt(2, 4) + 's linear 0s infinite';
            var petal = sakura.clone();
            var size = getRandomInt(options.minSize, options.maxSize);
            var startPosLeft = Math.random() * documentWidth - 100;
            var startPosTop = -((Math.random() * 20) + 15);

            // Apply Event Listener to remove petals that reach the bottom of the page.
            prefixedEvent(petal, 'AnimationEnd', function () {
                $(this).remove();
            });

            // Apply Event Listener to remove petals that finish their horizontal float animation.
            prefixedEvent(petal, 'AnimationIteration', function (ev) {
                if ($.inArray(ev.animationName, options.blowAnimations) != -1) {
                    $(this).remove();
                }
            });

            petal
                .css({
                    '-webkit-animation': animations,
                    '-o-animation': animations,
                    '-ms-animation': animations,
                    '-moz-animation': animations,
                    animation: animations,
                    height: size,
                    left: startPosLeft,
                    'margin-top': startPosTop,
                    width: size
                })
                .appendTo('body');
        };


        // Recalculate documentHeight and documentWidth on browser resize.
        $(window).resize(function () {
            documentHeight = $(document).height();
            documentWidth = $(document).width();
        });

        // Finally: Start adding petals.
        requestAnimationFrame(petalCreator);
    };
}(jQuery));



</script>





<body>
<header>
	<div class="header-image"></div>
	<h1 class="">Kyoto Cherry Blossom Calendar</h1>
</header>

<section class="BloomProgression">
	<div>
		<h3>Bloom Progression</h3>
	</div>
	<div>
		<ul>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura01.png" width="40"></p>
				<p class="text">Buds Only 0%</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura02.png" width="40"></p>
				<p class="text">Beginning to Bloom 15%</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png" width="40"></p>
				<p class="text">Partial Bloom 30%</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png" width="40"></p>
				<p class="text">Half Bloom 50%</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png" width="40"></p>
				<p class="text">Almost Full Bloom 70%</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png" width="40"></p>
				<p class="text">Full Bloom 100%</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura07.png" width="40"></p>
				<p class="text">Beginning to Fall</p>
			</li>
			<li>
				<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura08.png" width="40"></p>
				<p class="text">Blossoms Gone</p>
			</li>
		</ul>
	</div>
</section>
<div>
	<table style="width: 1400px;">
		<thead>
			<tr>
				<th style="width: 400px;">지역</th>
				<th style="width: 300px;">개화시기</th>
					
				<th>
					<div class="date">
						<p class="month">4</p>
						<span class="diagonal"></span>
						<p class="day">1</p>
					</div>
				</th>
				<th>
					<div class="date">
						<p class="month">4</p>
						<span class="diagonal"></span>
						<p class="day">3</p>
					</div>
				</th>
				<th>
					<div class="date">
						<p class="month">4</p>
						<span class="diagonal"></span>
						<p class="day">5</p>
					</div>
				</th>
				<th>
					<div class="date">
						<p class="month">4</p>
						<span class="diagonal"></span>
						<p class="day">8</p>
					</div>
				</th>
				<th>
					<div class="date">
						<p class="month">4</p>
						<span class="diagonal"></span>
						<p class="day">10</p>
					</div>
				</th>
				<th>
					<div class="date">
						<p class="month">4</p>
						<span class="diagonal"></span>
						<p class="day">12</p>
					</div>
				</th>
		</thead>
		<tbody>
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location1.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EC%BF%A0%EB%9D%BC%EB%A7%88%EB%8D%B0%EB%9D%BC/@35.1181404,135.7708892,15z/data=!4m6!3m5!1s0x6001a612b377319d:0x50283d7e45708438!8m2!3d35.1181404!4d135.7708892!16s%2Fm%2F0lpwtfz?entry=ttu">
									쿠라마데라 절
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>4월 중순~하순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura01.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura01.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location2.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EA%B5%90%ED%86%A0%EB%B6%80%EB%A6%BD%EC%8B%9D%EB%AC%BC%EC%9B%90/@35.0469259,135.7630102,17z/data=!3m1!4b1!4m6!3m5!1s0x6001081b1979efd5:0x9bba6e81c2248ac5!8m2!3d35.0469259!4d135.7630102!16s%2Fm%2F02z3750?entry=ttu">
									교토부립 식물원
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>3월 하순~4월 중순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura07.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location3.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EA%B8%88%EA%B3%84%EA%B4%91%EB%AA%85%EC%82%AC/@35.0194736,135.7875217,17z/data=!3m1!4b1!4m6!3m5!1s0x600108e2da0aadc9:0x25ed5d922698e790!8m2!3d35.0194736!4d135.7875217!16s%2Fm%2F03c73sk?entry=ttu">
									금계광명사
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>4월 상순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location4.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EB%A7%88%EB%A3%A8%EC%95%BC%EB%A7%88+%EA%B3%B5%EC%9B%90+(%EC%9B%90%EC%82%B0+%EA%B3%B5%EC%9B%90)/@35.0035631,135.777952,17z/data=!3m1!4b1!4m6!3m5!1s0x600108dcae68a29b:0xeb260d8a2775cd4b!8m2!3d35.0035587!4d135.7805269!16zL20vMGYyeXBr?entry=ttu">
									마루야마 공원
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>3월 하순~4월 중순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura07.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura07.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura08.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location5.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EB%8B%88%EC%A1%B0+%EC%84%B1/@35.0140423,135.7458509,17z/data=!4m6!3m5!1s0x600107d40a2b9b0b:0x106b8759906a2f2f!8m2!3d35.0140379!4d135.7484258!16zL20vMDJubmh4?entry=ttu">
									니조 성
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>3월 하순~4월 하순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura02.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura07.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura07.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location6.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%ED%97%A4%EC%9D%B4%EC%95%88+%EC%8B%A0%EA%B6%81/@35.0159822,135.7775608,17z/data=!3m1!4b1!4m6!3m5!1s0x600108e5187cc88d:0x75bed992d897454f!8m2!3d35.0159823!4d135.7824263!16zL20vMDJ5NGti?entry=ttu">
									헤이안 신궁
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>4월 상순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location7.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EC%B2%A0%ED%95%99%EC%9D%98+%EA%B8%B8/@35.0266194,135.7928767,17z/data=!3m1!4b1!4m6!3m5!1s0x60010908ae94f057:0x917af331a75280f4!8m2!3d35.0266194!4d135.795457!16s%2Fg%2F11n065ssgc?entry=ttu">
									철학의 길
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>4월 상순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location8.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%ED%9E%88%EB%9D%BC%EB%85%B8+%EC%8B%A0%EC%82%AC/@35.0325953,135.729402,17z/data=!3m1!4b1!4m6!3m5!1s0x6001078ce753f549:0x51a6cbb1594b20db!8m2!3d35.0325953!4d135.7319823!16s%2Fm%2F03d3q23?entry=ttu">
									히라노 신사
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>3월 중순~하순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura05.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location9.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%EB%8B%8C%EB%82%98%EC%A7%80/@35.0310937,135.7112395,17z/data=!3m1!4b1!4m6!3m5!1s0x6001077ff3ae5187:0xea1bdd27377bb743!8m2!3d35.0310937!4d135.7138198!16zL20vMDdrYmQx?entry=ttu">
									닌나지
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>4월 상순~중순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura01.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura01.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura02.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
			
			<tr>
				<td class="is-sticky" rowspan="2">
					<div>
						<p><img alt="" src="./kyotomap/image/location10.jpg" class="location"></p>
						<div>
							<p>
								<a href="https://www.google.com/maps/place/%E5%8D%8A%E6%9C%A8%E3%81%AE%E9%81%93/@35.0502343,135.7562104,17z/data=!3m1!4b1!4m6!3m5!1s0x60010968aab2fb65:0xe29ffcbca396cc8b!8m2!3d35.0502343!4d135.7587907!16s%2Fg%2F11nx1xvgxm?entry=ttu">
									나카라기 길
								</a>
							</p>
						</div>
					</div>
				</td>
				<td rowspan="2">
					<p>4월 상순~중순</p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura02.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura03.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura04.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
				<td>
					<p class="icon"><img alt="" src="./kyotomap/image/ico_sakura06.png"></p>
				</td>
			</tr>
			
			<tr></tr>
		</tbody>
	</table>
</div>

<section>
	<div class="container">
		<header class="report">
			<h2><b>Cherry Blossom Report</b></h2>
		</header>
		<div class="bloom-stage-container">
					<h3>개화 진행단계</h3>
					<div class="bloom-stage-select-wrapper">
					<select id="bloomStageSelect">
						<option value="Buds_Only_0%">Buds Only 0%</option>
						<option value="Beginning_to_Bloom_15%">Beginning to Bloom 15%</option>
						<option value="Partial_Bloom_30%">Partial Bloom 30%</option>
						<option value="Half_Bloom_50%">Half Bloom 50%</option>
						<option value="Almost_Full_Bloom_70%">Almost Full Bloom 70%</option>
						<option selected value="Full_Bloom_100%">Full Bloom 100%</option>
						<option value="Beginning_to_Fall">Beginning to Fall</option>
						<option value="Blossoms_Gone">Blossoms Gone</option>
					</select>
					</div>
		</div>
		
		<div id="bloomStageResults">
			<ul data-area="Buds_Only_0%">
				<li class="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
			</ul>
			<ul data-area="Beginning_to_Bloom_15%">
				<li class="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
			</ul>
			<ul data-area="Partial_Bloom_30%">
				<li class="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
			</ul>
			<ul data-area="Half_Bloom_50%">
				<li class="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
			</ul>
			<ul data-area="Almost_Full_Bloom_70%">
				<li class="noItem">이 개화 진행단계와 일치하는 결과는 없습니다</li>
			</ul>
			<ul class="is-show" data-area="Full_Bloom_100%">
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location1.jpg')"></p>
					<h4 class="title">쿠라메데라 절</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location3.jpg')"></p>
					<h4 class="title">금계광명사</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location6.jpg')"></p>
					<h4 class="title">헤이안 신궁</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location7.jpg')"></p>
					<h4 class="title">철학의 길</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location8.jpg')"></p>
					<h4 class="title">히라노 신사</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location9.jpg')"></p>
					<h4 class="title">닌나지</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location10.jpg')"></p>
					<h4 class="title">나카라기 길</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura06.png" width="15px;"></span><span class="text">Full Bloom 100%</span></p>
				</li>
			</ul>
			<ul data-area="Beginning_to_Fall">
                <li>
					<p class="image" style="background-image: url('./kyotomap/image/location2.jpg')"></p>
					<h4 class="title">교토부립 식물원</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura07.png" width="15px;"></span><span class="text">Beginning to Fall</span></p>
				</li>
				<li>
					<p class="image" style="background-image: url('./kyotomap/image/location5.jpg')"></p>
					<h4 class="title">니조 성</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura07.png" width="15px;"></span><span class="text">Beginning to Fall</span></p>
				</li>
            </ul>
            <ul data-area="Blossoms_Gone">
                <li>
					<p class="image" style="background-image: url('./kyotomap/image/location4.jpg')"></p>
					<h4 class="title">니조 성</h4>
					<p class="tag"><span><img alt="" src="./kyotomap/image/ico_sakura08.png" width="15px;"></span><span class="text">Blossoms Gone</span></p>
				</li>
            </ul>
		</div>
	</div>
</section>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const select = document.querySelector('#bloomStageSelect');
    const resultsDiv = document.querySelector('#bloomStageResults');

    if (select && resultsDiv) {
        // 초기 로드 시 선택된 옵션에 해당하는 결과를 표시합니다.
        const initialSelectedValue = select.value;
        showResults(initialSelectedValue);

        // select 요소의 change 이벤트 리스너를 추가합니다.
        select.addEventListener('change', function() {
            const selectedValue = select.value;
            showResults(selectedValue);
        });
    }

    // 선택된 값에 해당하는 결과를 보여주는 함수
    function showResults(selectedValue) {
        // 모든 결과 항목을 숨김
        const allResults = resultsDiv.querySelectorAll('ul');
        allResults.forEach(function(result) {
            const dataArea = result.getAttribute('data-area');
            if (dataArea === selectedValue) {
                result.style.display = 'flex'; // 선택된 값과 일치하는 결과를 표시
            } else {
                result.style.display = 'none'; // 선택된 값과 일치하지 않는 결과는 숨김
            }
        });
    }
});
</script>

</body>
</html>