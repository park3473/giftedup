<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <html>
<head>
<meta charset="UTF-8">
<title>영재키움 홈페이지 - 수정중</title>
</head>
<body leftmargin="0" topmargin="0">


<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0" style="position: fixed;">
<tr>
<td align="center">
    <img src="${pageContext.request.contextPath}/resources/img/2022/parking.jpg">

</td>
</tr>
</table>


</body>
</html> --%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><title>전민동 - 가마쿠라</title><style>
/* cspell:disable-file */
/* webkit printing magic: print all background colors */
html {
	-webkit-print-color-adjust: exact;
}
* {
	box-sizing: border-box;
	-webkit-print-color-adjust: exact;
}

html,
body {
	margin: 0;
	padding: 0;
}
@media only screen {
	body {
		margin: 2em auto;
		max-width: 900px;
		color: rgb(55, 53, 47);
	}
}

body {
	line-height: 1.5;
	white-space: pre-wrap;
}

a,
a.visited {
	color: inherit;
	text-decoration: underline;
}

.pdf-relative-link-path {
	font-size: 80%;
	color: #444;
}

h1,
h2,
h3 {
	letter-spacing: -0.01em;
	line-height: 1.2;
	font-weight: 600;
	margin-bottom: 0;
}

.page-title {
	font-size: 2.5rem;
	font-weight: 700;
	margin-top: 0;
	margin-bottom: 0.75em;
}

h1 {
	font-size: 1.875rem;
	margin-top: 1.875rem;
}

h2 {
	font-size: 1.5rem;
	margin-top: 1.5rem;
}

h3 {
	font-size: 1.25rem;
	margin-top: 1.25rem;
}

.source {
	border: 1px solid #ddd;
	border-radius: 3px;
	padding: 1.5em;
	word-break: break-all;
}

.callout {
	border-radius: 3px;
	padding: 1rem;
}

figure {
	margin: 1.25em 0;
	page-break-inside: avoid;
}

figcaption {
	opacity: 0.5;
	font-size: 85%;
	margin-top: 0.5em;
}

mark {
	background-color: transparent;
}

.indented {
	padding-left: 1.5em;
}

hr {
	background: transparent;
	display: block;
	width: 100%;
	height: 1px;
	visibility: visible;
	border: none;
	border-bottom: 1px solid rgba(55, 53, 47, 0.09);
}

img {
	max-width: 100%;
}

@media only print {
	img {
		max-height: 100vh;
		object-fit: contain;
	}
}

@page {
	margin: 1in;
}

.collection-content {
	font-size: 0.875rem;
}

.column-list {
	display: flex;
	justify-content: space-between;
}

.column {
	padding: 0 1em;
}

.column:first-child {
	padding-left: 0;
}

.column:last-child {
	padding-right: 0;
}

.table_of_contents-item {
	display: block;
	font-size: 0.875rem;
	line-height: 1.3;
	padding: 0.125rem;
}

.table_of_contents-indent-1 {
	margin-left: 1.5rem;
}

.table_of_contents-indent-2 {
	margin-left: 3rem;
}

.table_of_contents-indent-3 {
	margin-left: 4.5rem;
}

.table_of_contents-link {
	text-decoration: none;
	opacity: 0.7;
	border-bottom: 1px solid rgba(55, 53, 47, 0.18);
}

table,
th,
td {
	border: 1px solid rgba(55, 53, 47, 0.09);
	border-collapse: collapse;
}

table {
	border-left: none;
	border-right: none;
}

th,
td {
	font-weight: normal;
	padding: 0.25em 0.5em;
	line-height: 1.5;
	min-height: 1.5em;
	text-align: left;
}

th {
	color: rgba(55, 53, 47, 0.6);
}

ol,
ul {
	margin: 0;
	margin-block-start: 0.6em;
	margin-block-end: 0.6em;
}

li > ol:first-child,
li > ul:first-child {
	margin-block-start: 0.6em;
}

ul > li {
	list-style: disc;
}

ul.to-do-list {
	text-indent: -1.7em;
}

ul.to-do-list > li {
	list-style: none;
}

.to-do-children-checked {
	text-decoration: line-through;
	opacity: 0.375;
}

ul.toggle > li {
	list-style: none;
}

ul {
	padding-inline-start: 1.7em;
}

ul > li {
	padding-left: 0.1em;
}

ol {
	padding-inline-start: 1.6em;
}

ol > li {
	padding-left: 0.2em;
}

.mono ol {
	padding-inline-start: 2em;
}

.mono ol > li {
	text-indent: -0.4em;
}

.toggle {
	padding-inline-start: 0em;
	list-style-type: none;
}

/* Indent toggle children */
.toggle > li > details {
	padding-left: 1.7em;
}

.toggle > li > details > summary {
	margin-left: -1.1em;
}

.selected-value {
	display: inline-block;
	padding: 0 0.5em;
	background: rgba(206, 205, 202, 0.5);
	border-radius: 3px;
	margin-right: 0.5em;
	margin-top: 0.3em;
	margin-bottom: 0.3em;
	white-space: nowrap;
}

.collection-title {
	display: inline-block;
	margin-right: 1em;
}

.simple-table {
	margin-top: 1em;
	font-size: 0.875rem;
	empty-cells: show;
}
.simple-table td {
	height: 29px;
	min-width: 120px;
}

.simple-table th {
	height: 29px;
	min-width: 120px;
}

.simple-table-header-color {
	background: rgb(247, 246, 243);
	color: black;
}
.simple-table-header {
	font-weight: 500;
}

time {
	opacity: 0.5;
}

.icon {
	display: inline-block;
	max-width: 1.2em;
	max-height: 1.2em;
	text-decoration: none;
	vertical-align: text-bottom;
	margin-right: 0.5em;
}

img.icon {
	border-radius: 3px;
}

.user-icon {
	width: 1.5em;
	height: 1.5em;
	border-radius: 100%;
	margin-right: 0.5rem;
}

.user-icon-inner {
	font-size: 0.8em;
}

.text-icon {
	border: 1px solid #000;
	text-align: center;
}

.page-cover-image {
	display: block;
	object-fit: cover;
	width: 100%;
	max-height: 30vh;
}

.page-header-icon {
	font-size: 3rem;
	margin-bottom: 1rem;
}

.page-header-icon-with-cover {
	margin-top: -0.72em;
	margin-left: 0.07em;
}

.page-header-icon img {
	border-radius: 3px;
}

.link-to-page {
	margin: 1em 0;
	padding: 0;
	border: none;
	font-weight: 500;
}

p > .user {
	opacity: 0.5;
}

td > .user,
td > time {
	white-space: nowrap;
}

input[type="checkbox"] {
	transform: scale(1.5);
	margin-right: 0.6em;
	vertical-align: middle;
}

p {
	margin-top: 0.5em;
	margin-bottom: 0.5em;
}

.image {
	border: none;
	margin: 1.5em 0;
	padding: 0;
	border-radius: 0;
	text-align: center;
}

.code,
code {
	background: rgba(135, 131, 120, 0.15);
	border-radius: 3px;
	padding: 0.2em 0.4em;
	border-radius: 3px;
	font-size: 85%;
	tab-size: 2;
}

code {
	color: #eb5757;
}

.code {
	padding: 1.5em 1em;
}

.code-wrap {
	white-space: pre-wrap;
	word-break: break-all;
}

.code > code {
	background: none;
	padding: 0;
	font-size: 100%;
	color: inherit;
}

blockquote {
	font-size: 1.25em;
	margin: 1em 0;
	padding-left: 1em;
	border-left: 3px solid rgb(55, 53, 47);
}

.bookmark {
	text-decoration: none;
	max-height: 8em;
	padding: 0;
	display: flex;
	width: 100%;
	align-items: stretch;
}

.bookmark-title {
	font-size: 0.85em;
	overflow: hidden;
	text-overflow: ellipsis;
	height: 1.75em;
	white-space: nowrap;
}

.bookmark-text {
	display: flex;
	flex-direction: column;
}

.bookmark-info {
	flex: 4 1 180px;
	padding: 12px 14px 14px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.bookmark-image {
	width: 33%;
	flex: 1 1 180px;
	display: block;
	position: relative;
	object-fit: cover;
	border-radius: 1px;
}

.bookmark-description {
	color: rgba(55, 53, 47, 0.6);
	font-size: 0.75em;
	overflow: hidden;
	max-height: 4.5em;
	word-break: break-word;
}

.bookmark-href {
	font-size: 0.75em;
	margin-top: 0.25em;
}

.sans { font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"; }
.code { font-family: "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace; }
.serif { font-family: Lyon-Text, Georgia, ui-serif, serif; }
.mono { font-family: iawriter-mono, Nitti, Menlo, Courier, monospace; }
.pdf .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK JP'; }
.pdf:lang(zh-CN) .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK SC'; }
.pdf:lang(zh-TW) .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK TC'; }
.pdf:lang(ko-KR) .sans { font-family: Inter, ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol", 'Twemoji', 'Noto Color Emoji', 'Noto Sans CJK KR'; }
.pdf .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK JP'; }
.pdf:lang(zh-CN) .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC'; }
.pdf:lang(zh-TW) .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK TC'; }
.pdf:lang(ko-KR) .code { font-family: Source Code Pro, "SFMono-Regular", Menlo, Consolas, "PT Mono", "Liberation Mono", Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK KR'; }
.pdf .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK JP'; }
.pdf:lang(zh-CN) .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK SC'; }
.pdf:lang(zh-TW) .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK TC'; }
.pdf:lang(ko-KR) .serif { font-family: PT Serif, Lyon-Text, Georgia, ui-serif, serif, 'Twemoji', 'Noto Color Emoji', 'Noto Serif CJK KR'; }
.pdf .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK JP'; }
.pdf:lang(zh-CN) .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK SC'; }
.pdf:lang(zh-TW) .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK TC'; }
.pdf:lang(ko-KR) .mono { font-family: PT Mono, iawriter-mono, Nitti, Menlo, Courier, monospace, 'Twemoji', 'Noto Color Emoji', 'Noto Sans Mono CJK KR'; }
.highlight-default {
	color: rgba(55, 53, 47, 1);
}
.highlight-gray {
	color: rgba(120, 119, 116, 1);
	fill: rgba(120, 119, 116, 1);
}
.highlight-brown {
	color: rgba(159, 107, 83, 1);
	fill: rgba(159, 107, 83, 1);
}
.highlight-orange {
	color: rgba(217, 115, 13, 1);
	fill: rgba(217, 115, 13, 1);
}
.highlight-yellow {
	color: rgba(203, 145, 47, 1);
	fill: rgba(203, 145, 47, 1);
}
.highlight-teal {
	color: rgba(68, 131, 97, 1);
	fill: rgba(68, 131, 97, 1);
}
.highlight-blue {
	color: rgba(51, 126, 169, 1);
	fill: rgba(51, 126, 169, 1);
}
.highlight-purple {
	color: rgba(144, 101, 176, 1);
	fill: rgba(144, 101, 176, 1);
}
.highlight-pink {
	color: rgba(193, 76, 138, 1);
	fill: rgba(193, 76, 138, 1);
}
.highlight-red {
	color: rgba(212, 76, 71, 1);
	fill: rgba(212, 76, 71, 1);
}
.highlight-gray_background {
	background: rgba(241, 241, 239, 1);
}
.highlight-brown_background {
	background: rgba(244, 238, 238, 1);
}
.highlight-orange_background {
	background: rgba(251, 236, 221, 1);
}
.highlight-yellow_background {
	background: rgba(251, 243, 219, 1);
}
.highlight-teal_background {
	background: rgba(237, 243, 236, 1);
}
.highlight-blue_background {
	background: rgba(231, 243, 248, 1);
}
.highlight-purple_background {
	background: rgba(244, 240, 247, 0.8);
}
.highlight-pink_background {
	background: rgba(249, 238, 243, 0.8);
}
.highlight-red_background {
	background: rgba(253, 235, 236, 1);
}
.block-color-default {
	color: inherit;
	fill: inherit;
}
.block-color-gray {
	color: rgba(120, 119, 116, 1);
	fill: rgba(120, 119, 116, 1);
}
.block-color-brown {
	color: rgba(159, 107, 83, 1);
	fill: rgba(159, 107, 83, 1);
}
.block-color-orange {
	color: rgba(217, 115, 13, 1);
	fill: rgba(217, 115, 13, 1);
}
.block-color-yellow {
	color: rgba(203, 145, 47, 1);
	fill: rgba(203, 145, 47, 1);
}
.block-color-teal {
	color: rgba(68, 131, 97, 1);
	fill: rgba(68, 131, 97, 1);
}
.block-color-blue {
	color: rgba(51, 126, 169, 1);
	fill: rgba(51, 126, 169, 1);
}
.block-color-purple {
	color: rgba(144, 101, 176, 1);
	fill: rgba(144, 101, 176, 1);
}
.block-color-pink {
	color: rgba(193, 76, 138, 1);
	fill: rgba(193, 76, 138, 1);
}
.block-color-red {
	color: rgba(212, 76, 71, 1);
	fill: rgba(212, 76, 71, 1);
}
.block-color-gray_background {
	background: rgba(241, 241, 239, 1);
}
.block-color-brown_background {
	background: rgba(244, 238, 238, 1);
}
.block-color-orange_background {
	background: rgba(251, 236, 221, 1);
}
.block-color-yellow_background {
	background: rgba(251, 243, 219, 1);
}
.block-color-teal_background {
	background: rgba(237, 243, 236, 1);
}
.block-color-blue_background {
	background: rgba(231, 243, 248, 1);
}
.block-color-purple_background {
	background: rgba(244, 240, 247, 0.8);
}
.block-color-pink_background {
	background: rgba(249, 238, 243, 0.8);
}
.block-color-red_background {
	background: rgba(253, 235, 236, 1);
}
.select-value-color-pink { background-color: rgba(245, 224, 233, 1); }
.select-value-color-purple { background-color: rgba(232, 222, 238, 1); }
.select-value-color-green { background-color: rgba(219, 237, 219, 1); }
.select-value-color-gray { background-color: rgba(227, 226, 224, 1); }
.select-value-color-opaquegray { background-color: rgba(255, 255, 255, 0.0375); }
.select-value-color-orange { background-color: rgba(250, 222, 201, 1); }
.select-value-color-brown { background-color: rgba(238, 224, 218, 1); }
.select-value-color-red { background-color: rgba(255, 226, 221, 1); }
.select-value-color-yellow { background-color: rgba(253, 236, 200, 1); }
.select-value-color-blue { background-color: rgba(211, 229, 239, 1); }

.checkbox {
	display: inline-flex;
	vertical-align: text-bottom;
	width: 16;
	height: 16;
	background-size: 16px;
	margin-left: 2px;
	margin-right: 5px;
}

.checkbox-on {
	background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20width%3D%2216%22%20height%3D%2216%22%20fill%3D%22%2358A9D7%22%2F%3E%0A%3Cpath%20d%3D%22M6.71429%2012.2852L14%204.9995L12.7143%203.71436L6.71429%209.71378L3.28571%206.2831L2%207.57092L6.71429%2012.2852Z%22%20fill%3D%22white%22%2F%3E%0A%3C%2Fsvg%3E");
}

.checkbox-off {
	background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%0A%3Crect%20x%3D%220.75%22%20y%3D%220.75%22%20width%3D%2214.5%22%20height%3D%2214.5%22%20fill%3D%22white%22%20stroke%3D%22%2336352F%22%20stroke-width%3D%221.5%22%2F%3E%0A%3C%2Fsvg%3E");
}
	
</style></head><body><article id="d9febf07-d713-4e40-9d1c-d833735b4a35" class="page sans"><header><h1 class="page-title">가마쿠라</h1></header><div class="page-body"><p id="938034cd-a6c7-4277-a2d6-3d186b0c2cbe" class="">※ <mark class="highlight-blue_background">ㅁ : 유튜브</mark> <mark class="highlight-red_background">ㅁ : 사이트</mark> <mark class="highlight-yellow_background">ㅁ : 숙소 예약사이트</mark> <mark class="highlight-orange_background">ㅁ : 구글지도</mark></p><p id="58434024-431b-4012-b893-c50a32f7c8b7" class="">
</p><p id="1a1196d4-b950-4d4b-b9d5-bc5a27692358" class=""><mark class="highlight-blue"><strong>장소</strong></mark></p><ul id="a24c406e-6056-4a19-accf-91f4d61ae53e" class="bulleted-list"><li style="list-style-type:disc"><mark class="highlight-blue_background"><a target="_blank" href="https://youtu.be/bnlLe51aEqE">에노시마 + 바다 해변</a></mark></li></ul><ul id="0f9a981b-b477-4283-9be2-06cc250be639" class="bulleted-list"><li style="list-style-type:disc"><mark class="highlight-blue_background"><a target="_blank" href="https://youtu.be/xgcs8G8YzhA">에노덴 , 에노덴 전철 건널목 (사진명소 )</a></mark></li></ul><ul id="6d91aa56-4f0c-4e0e-a3a3-21dcdc62fdfc" class="bulleted-list"><li style="list-style-type:disc"><a target="_blank" href="https://youtu.be/djZnaxgnPN4"><mark class="highlight-blue_background">코마치 상점가</mark></a></li></ul><ul id="60e1ac31-2587-4e00-9b59-4f05dd1b6a21" class="bulleted-list"><li style="list-style-type:disc"><a target="_blank" href="https://youtu.be/Qax1vMMnmFE"><mark class="highlight-blue_background">쓰루가오카하치만구 (신사)</mark></a></li></ul><ul id="3bd9ebdd-2b32-4a3f-ac0c-dc1a9cd14634" class="bulleted-list"><li style="list-style-type:disc"><a target="_blank" href="https://www.japan.travel/ko/spot/1584/"><mark class="highlight-red_background">겐초지 2</mark></a></li></ul><ul id="2243d289-089d-424c-bd65-01a6433fe614" class="bulleted-list"><li style="list-style-type:disc"><a target="_blank" href="https://www.japan.travel/ko/spot/1595/"><mark class="highlight-red_background">엔카쿠지 2</mark></a></li></ul><p id="a6e5ef06-ef97-49c7-a2a8-ddb53f63261b" class="">
</p><p id="ac7fb1fb-b2a8-4342-b7f9-4f7c1d1d031e" class=""><mark class="highlight-yellow"><strong>숙소</strong></mark></p><p id="564bfb61-c50b-447b-8307-5a2246238988" class=""><mark class="highlight-yellow_background"><a target="_blank" href="https://www.agoda.com/ko-kr/gen-hotel-kamakura/hotel/kamakura-jp.html?finalPriceView=1&amp;isShowMobileAppPrice=false&amp;cid=1830544&amp;numberOfBedrooms=&amp;familyMode=false&amp;adults=4&amp;children=0&amp;rooms=1&amp;maxRooms=0&amp;checkIn=2023-01-21&amp;isCalendarCallout=false&amp;childAges=&amp;numberOfGuest=0&amp;missingChildAges=false&amp;travellerType=2&amp;showReviewSubmissionEntry=false&amp;currencyCode=KRW&amp;isFreeOccSearch=false&amp;isCityHaveAsq=false&amp;los=1&amp;searchrequestid=7d8b019d-a395-4843-a8f1-b1b14b2e3a1">숙소 후보 1</a></mark>  <mark class="highlight-orange_background"><a target="_blank" href="https://www.google.co.kr/maps/place/TOSEI+HOTEL+COCONE+Kamakura/@35.3142708,139.5423314,15.5z/data=!4m8!3m7!1s0x6018459d7f09e9ad:0xe684471e3e05c7a6!5m2!4m1!1i2!8m2!3d35.3166285!4d139.5489038?hl=ko">위치</a></mark></p><p id="3f0a8a41-ce3a-4fbf-8c2f-ddec1f631b3a" class=""><mark class="highlight-yellow_background"><a target="_blank" href="https://www.agoda.com/ko-kr/tosei-hotel-cocone-kamakura/hotel/yokohama-jp.html?finalPriceView=1&amp;isShowMobileAppPrice=false&amp;cid=1830544&amp;numberOfBedrooms=&amp;familyMode=false&amp;adults=4&amp;children=0&amp;rooms=1&amp;maxRooms=0&amp;checkIn=2023-01-21&amp;isCalendarCallout=false&amp;childAges=&amp;numberOfGuest=0&amp;missingChildAges=false&amp;travellerType=-1&amp;showReviewSubmissionEntry=false&amp;currencyCode=KRW&amp;isFreeOccSearch=false&amp;tag=63364A36735966245F4A72515331546C3544526F3151&amp;isCityHaveAsq=false&amp;tspTypes=2,2&amp;los=1&amp;searchrequestid=609ac140-818e-43f9-bcde-9dc29237af73">숙소 후보 2</a></mark>  <mark class="highlight-orange_background"><a target="_blank" href="https://www.google.co.kr/maps/place/GEN+HOTEL+KAMAKURA/@35.3215065,139.5471379,15z/data=!3m1!5s0x601845c6d6726a9f:0xd60b321e95b7174!4m8!3m7!1s0x601845c7244f0c57:0xed9360eb5fd93354!5m2!4m1!1i2!8m2!3d35.3233448!4d139.5543155?hl=ko">위치</a></mark></p><p id="7b441edb-9a78-4cd0-9b14-81698a700240" class=""><mark class="highlight-yellow_background"><a target="_blank" href="https://kr.trip.com/hotels/detail/?Allianceid=6107&amp;sid=707143&amp;hotelid=7819026&amp;city=50150&amp;locale=ko_KR&amp;checkin=2023-01-21&amp;checkout=2023-01-22&amp;ouid=ugs8Z1dbu7DnSvWAUVDecw&amp;shoppingid=785f1bc9655b47b6b9cfeb01ff1506a0&amp;utm_medium=referral&amp;utm_source=hotelscombined&amp;utm_campaign=&amp;mincurr=KRW&amp;curr=KRW&amp;roomquantity=&amp;minprice=&amp;mproom=924443668&amp;adult=4&amp;children=0&amp;ages=&amp;language=kokr&amp;swid=0&amp;fgt=1&amp;display=inctotal&amp;popup=close&amp;source=hc&amp;stand=H4sIAAAAAAAAAOMK52KSYBFi4mCU8uWYcuL5DmYhTnNDEwtzE3MDE4OV_BZXswI4ZjBOmneXeQUj4w5GlouMDEBQ4Mvh-BDMmrCby_EF4---edJdTIxaC1lBYg0dZxykFMwtTNMMk5ItzUxNk0zMk8ySLJPTUpMMDNPSDE0NzBINFBg1dp3YNpvNgzGIzdzc0snCLEqGi9krIFJQddqU3ec_rrSXYvYOClec8o0tfoZPqX0Sa3Z-vHdQxknuiqQuRiYPxlWMDJ8YrQ0NDAwMzc0NjXSNDIyMDIHAwNLIxMBSl5D98QYAWzYIFP0AAAA">숙소 후보 3</a></mark>  <a target="_blank" href="https://www.google.com/maps/place/%EC%9C%84%EB%B2%A0%EC%9D%B4%EC%8A%A4+%ED%98%B8%EC%8A%A4%ED%85%94+%EA%B0%80%EB%A7%88%EC%BF%A0%EB%9D%BC/@35.3108848,139.5412859,15z/data=!4m2!3m1!1s0x0:0x685bd2abddc03684?sa=X&amp;ved=2ahUKEwj754yYgaX7AhWo8DgGHWzND5oQ_BJ6BAhiEAU"><mark class="highlight-orange_background">위치</mark></a></p><p id="720cdd01-0d49-4c5e-8a72-724aa071abfb" class="">
</p><p id="58cb42fd-fc27-469c-8211-1fba1b92b7e2" class=""><mark class="highlight-brown"><strong>총합</strong></mark></p><p id="f1fe27fc-e70c-45b8-82bc-ef2ee89c7762" class=""><mark class="highlight-orange_background"><a href="https://www.google.com/maps/d/edit?mid=12Egofd3QFpGCqCKBWKfkaB-EEOWZTe8&amp;usp=sharing">총합 지도</a></mark></p><p id="720cdd01-0d49-4c5e-8a72-724aa071abfb" class="">
</p><p id="4eccda4c-8718-4000-b08d-e00435d6663b" class="">
</p><p id="efc839b9-85ab-4750-8862-f0c79d69f1ca" class="">
</p></div></article></body></html>