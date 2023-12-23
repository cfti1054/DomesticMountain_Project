<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

/*=============== body (area) ===============*/
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	padding-top: 120px;
	max-width: 1300px;
	margin: 30px auto;
	position: relative;
	align-items: center;
	min-height: 100vh;
	overflow-x: hidden;
}
.amain h1 {
	display: flex;
	justify-content: space-between;
	margin: 20px 0 80px 0;
	font-weight: 700;
	color: #6558be;
}

.amain-main {
	padding: 0 0 10px 10px;
	border-bottom: 2px solid #3a3a3a;
	font-size: xx-large;
	color: #6557be;
}

.amain-main a>span {
	font-size: 18px;
	color: gray;
	margin: 10px 0 0 20px;
}

.amain-main span {
	font-size: 14px;
	color: gray;
	margin: 15px 0 0 20px;
}


:root {
	--adjust-size: 0px;
}

.features-1 p {
	line-height: 1;
	color: black;
	font-weight: 500;
}
.features-1 a {
	color: hsl(212deg 35.69% 49.28%);
	text-decoration: none;
}
.features-1 img {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
	pointer-events: none;
}
#gallery {
	position: relative;
	left: calc(-1 * var(--adjust-size));
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
	gap: 40px;
	max-width: auto;
	padding: 20px;
	-webkit-perspective: 0;
	perspective: 0;
}
#gallery figure:nth-child(7n) {
	--duration: 1s;
	--pin-color: crimson;
}
#gallery figure:nth-child(7n + 1) {
	--duration: 1.8s;
	--pin-color: hotpink;
}
#gallery figure:nth-child(7n + 2) {
	--duration: 1.3s;
	--pin-color: magenta;
}
#gallery figure:nth-child(7n + 3) {
	--duration: 1.5s;
	--pin-color: orangered;
}
#gallery figure:nth-child(7n + 4) {
	--duration: 1.1s;
	--pin-color: darkorchid;
}
#gallery figure:nth-child(7n + 5) {
	--duration: 1.6s;
	--pin-color: deeppink;
}
#gallery figure:nth-child(7n + 6) {
	--duration: 1.2s;
	--pin-color: mediumvioletred;
}
#gallery figure:nth-child(3n) {
	--angle: 3deg;
}
#gallery figure:nth-child(3n + 1) {
	--angle: -3.3deg;
}
#gallery figure:nth-child(3n + 2) {
	--angle: 2.4deg;
}
#gallery figure:nth-child(odd) {
	--direction: alternate;
}
#gallery figure:nth-child(even) {
	--direction: alternate-reverse;
}
#gallery figure {
	--angle: 3deg;
	--count: 5;
	--duration: 1s;
	--delay: calc(-0.5 * var(--duration));
	--direction: alternate;
	--pin-color: red;

	position: relative;
	display: inline-block;
	margin: var(--adjust-size);
	padding: 0.5rem;
	border-radius: 5px;
	box-shadow: 0 7px 8px rgba(0, 0, 0, 0.4);
	width: 100%;
	height: auto;
	text-align: center;
	background-color: ghostwhite;
	background-image: url("https://images.unsplash.com/photo-1629968417850-3505f5180761?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMjM4NDZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTMzMjQ3ODJ8&ixlib=rb-4.0.3&q=80&w=500");
	background-size: cover;
	background-position: center;
	background-blend-mode: multiply;

	transform-origin: center 0.22rem;
	will-change: transform;
	break-inside: avoid;
	overflow: hidden;
	outline: 1px solid transparent;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

#gallery.active figure {
	animation-duration: var(--duration), 1.5s;
	animation-delay: var(--delay),
		calc(var(--delay) + var(--duration) * var(--count));
	animation-timing-function: ease-in-out;
	animation-iteration-count: var(--count), 1;
	animation-direction: var(--direction), normal;
	animation-fill-mode: both;
	animation-name: swing, swingEnd;
}
#gallery figure:after {
	position: absolute;
	top: 0.22rem;
	left: 50%;
	width: 0.7rem;
	height: 0.7rem;
	content: "";
	background: var(--pin-color);
	border-radius: 50%;
	box-shadow: -0.1rem -0.1rem 0.3rem 0.02rem rgba(0, 0, 0, 0.5) inset;
	filter: drop-shadow(0.3rem 0.15rem 0.2rem rgba(0, 0, 0, 0.5));
	transform: translateZ(0);
	z-index: 2;
}
figure img {
	aspect-ratio: 1 /1;
	width: 100%;
	object-fit: cover;
	display: block;
	border-radius: 5px;
	margin-bottom: 10px;
	z-index: 1;
}
.features-1 figure figcaption {
	font-size: 18px;
	font-weight: 400;
	z-index: 1;
}
.features-1 figure h2 {
	color: crimson;
	font-size: 22px;
}
.features-1 figure p {
	font-size: 17px;
}
.features-1 figure small {
	font-size: 12px;
}
.features-1 figure > div {
	width: 100%;
	height: 100%;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
@keyframes swing {
	0% {
		transform: rotate3d(0, 0, 1, calc(-1 * var(--angle)));
	}
	100% {
		transform: rotate3d(0, 0, 1, var(--angle));
	}
}
@keyframes swingEnd {
	to {
		transform: rotate3d(0, 0, 1, 0deg);
	}
}
#info {
	position: relative;
	text-align: center;
	z-index: 1;
}
#info a {
	font-size: 1.1rem;
}
@media (min-width: 800px) {
	#gallery {
		grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
	}
}


</style>



<section class="features-1">
	<div class="body-container">
		
		<div class="amain">
			<h1 class="amain-main">
				<a>등산 관련 동호회 및 연맹<span>| Related</span></a> <span><a
					href="/plus/">home</a> &gt; Related</span>
			</h1>
		</div>


		<div id="gallery">
			
			<figure>
				<div>
					<div>
						<h2>(사)대한산악연맹</h2>
						<p>Korea Alpine Federation</p>
						<p>
							<br> <span>산하단체 &amp; 유관기관(단체)<br> </span>
						</p>
					</div>
				</div>
			</figure>
			<figure>
				<a target="_blank" href="http://www.cac.or.kr/"><img src="${pageContext.request.contextPath}/resources/images/club/한국산악회.png" alt=""></a>
				<figcaption><a target="_blank" href="http://www.cac.or.kr/">한국산악회</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://ksaf.modoo.at/"><img src="${pageContext.request.contextPath}/resources/images/club/한국대학산악연맹.png" alt=""></a>
				<figcaption><a target="_blank" href="https://ksaf.modoo.at/">한국대학산악연맹</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafsma.or.kr/"><img src="${pageContext.request.contextPath}/resources/images/club/대한산악스키협회.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="https://kafsma.or.kr/">대한산악스키협회</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafedu.or.kr/"><img src="${pageContext.request.contextPath}/resources/images/club/대한산악연맹교육원.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafedu.or.kr/">대한산악연맹교육원</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/"><img src="${pageContext.request.contextPath}/resources/images/club/대한산악구조협회.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/">대한산악구조협회</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://www.komount.or.kr/"><img src="${pageContext.request.contextPath}/resources/images/club/한국등산트레킹지원센터.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="https://www.komount.or.kr/">한국등산트레킹지원센터</a></figcaption>
			</figure>
			<figure>
				<div>
					<div>
						<h2>(사)대한산악연맹</h2>
						<p>Korea Alpine Federation</p>
						<p>
							<br> <span>국제 단체<br> </span>
						</p>
					</div>
				</div>
			</figure>
			<figure>
				<a target="_blank" href="https://www.skyrunning.com/"><img src="${pageContext.request.contextPath}/resources/images/club/ISF.png" alt=""></a>
				<figcaption><a target="_blank" href="https://www.skyrunning.com/">ISF</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://www.ifsc-climbing.org/"><img src="${pageContext.request.contextPath}/resources/images/club/iFSC.png" alt=""></a>
				<figcaption><a href="https://www.ifsc-climbing.org/">iFSC</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://www.theuiaa.org/"><img src="${pageContext.request.contextPath}/resources/images/club/UIAA.png" alt=""></a>
				<figcaption><a target="_blank" href="https://www.theuiaa.org/">UIAA</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="http://www.ismf-ski.org/webpages/"><img src="${pageContext.request.contextPath}/resources/images/club/ISMF.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="http://www.ismf-ski.org/webpages/">ISMF</a></figcaption>
			</figure>
			<figure>
				<div>
					<div>
						<h2>기타 등산 조직</h2>
						<p>Other Organizations</p>
						<p>
							<br> <span><br> </span>
						</p>
					</div>
				</div>
			</figure>
			<figure>
				<a target="_blank" href="https://americanalpineclub.org/"><img src="${pageContext.request.contextPath}/resources/images/club/AAC.png" alt=""></a>
				<figcaption><a target="_blank" href="https://americanalpineclub.org/">The American Alpine Club</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://www.mountaineers.org/"><img src="${pageContext.request.contextPath}/resources/images/club/theMountaineers.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="https://www.mountaineers.org/">The Mountaineers</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="http://www.alpine-club.org.uk/"><img src="${pageContext.request.contextPath}/resources/images/club/tac.png" alt=""></a>
				<figcaption><a target="_blank" href="http://www.alpine-club.org.uk/">The Alpine Club</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://www.chaosberkeley.org/"><img src="${pageContext.request.contextPath}/resources/images/club/society.png" alt=""></a>
				<figcaption><a target="_blank" href="https://www.chaosberkeley.org/">Cal Hiking and Outdoor Society</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://www.accessfund.org/"><img src="${pageContext.request.contextPath}/resources/images/club/AF.png" alt=""></a>
				<figcaption><a target="_blank" href="https://www.accessfund.org/">Access Fund</a></figcaption>
			</figure>
			
			
			<figure>
				<div>
					<div>
						<h2>산악구조대</h2>
						<p>Mountain Rescue Team</p>
						<p>
							<br> <span><br> </span>
						</p>
					</div>
				</div>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/12/34"><img src="${pageContext.request.contextPath}/resources/images/club/structure/서울산악조난구조대.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/12/34">서울산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/24/82"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/24/82">부산광역시구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/106/107"><img src="${pageContext.request.contextPath}/resources/images/club/structure/대구산악구조대.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/106/107">대구광역시구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/13/38"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/13/38">인천광역시 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/19/62"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/19/62">광주광역시 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/16/50"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/16/50">대전광역시 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/25/86"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/25/86">울산광역시 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/21/70"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/21/70">세종특별자치 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/14/42"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/14/42">경기도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/22/74"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/22/74">강원도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/15/46"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/15/46">충청북도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/17/54"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/17/54">충청남도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/18/58"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/18/58">전라북도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/20/66"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/20/66">전라남도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/23/78"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/23/78">경상북도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/26/90"><img src="${pageContext.request.contextPath}/resources/images/club/structure/경상남도산악구조대.jpeg" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/26/90">경상남도 산악구조대</a></figcaption>
			</figure>
			<figure>
				<a target="_blank" href="https://kafrescue.or.kr/?c=3/27/94"><img src="${pageContext.request.contextPath}/resources/images/club/structure/산악구조대.png" alt=""></a>
				<figcaption><a target="_blank" href="https://kafrescue.or.kr/?c=3/27/94">제주특별자치도 산악구조대</a></figcaption>
			</figure>
		</div>

	</div>
</section>

<script>
"use strict";
(function () {
    window.onload = () => {
        const obj = document.querySelector("#gallery");
        const time = 10000;
        function animStart() {
            if (obj.classList.contains("active") == false) {
                obj.classList.add("active");
                setTimeout(() => {
                    animEnd();
                }, time);
            }
        }
        function animEnd() {
            obj.classList.remove("active");
            obj.offsetWidth;
        }
        document.addEventListener("scroll", function () {
            animStart();
        });
        window.addEventListener("resize", animStart);
        animStart();
    };
})();
</script>
