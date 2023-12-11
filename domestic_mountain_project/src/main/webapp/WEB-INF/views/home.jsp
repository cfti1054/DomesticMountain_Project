<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ================== body ================== -->
<section class="features-1" style="height: 600px;">
	<div class="row">
		<div class="area-1">
			<div class="area1-content">
				<h1 class="area1-h1">
					저희 <strong class="area1-st">'국내산'</strong> 은 국내에 있는 산과 관련 정보를 <br>&nbsp;&nbsp;&nbsp;제공하기
					위한 사이트입니다.
				</h1>
				<h4 class="area1-h4">
					알고계셨나요? <br> <br> 등정(登頂)은 산 따위의 꼭대기까지 오른다는 의미의 단어입니다. <br>
					등산(登山)은 정상을 밟았는지의 여부와는 상관없이 그저 산에 오른다는 의미입니다.
				</h4>
			</div>
			<div class="area1-content video-container">
				<video id="mainVideo" autoplay muted loop>
					<source src="resources/mp4/mainvideo.mp4" type="video/mp4" />
				</video>
			</div>
		</div>
	</div>
</section>
<section class="features-2" style="height: 700px;">
	<div class="row">
		<div class="area-2">

			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/1.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/2.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/3.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/4.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/5.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/6.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/7.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/8.png">
					</div>
					<div class="swiper-slide">
						<img alt="" src="resources/images/mountain/9.png">
					</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
				<div class="autoplay-progress">
					<svg viewBox="0 0 48 48">
                           <circle cx="24" cy="24" r="20"></circle>
                        </svg>
					<span></span>
				</div>
			</div>

			<script>
				const progressCircle = document
						.querySelector(".autoplay-progress svg");
				const progressContent = document
						.querySelector(".autoplay-progress span");
				var swiper = new Swiper(".mySwiper", {
					spaceBetween : 30,
					centeredSlides : true,
					autoplay : {
						delay : 2500,
						disableOnInteraction : false
					},
					pagination : {
						el : ".swiper-pagination",
						clickable : true
					},
					navigation : {
						nextEl : ".swiper-button-next",
						prevEl : ".swiper-button-prev"
					}
				});
			</script>

		</div>
	</div>
</section>

<section class="features-3" style="height: 200px;"></section>

<section class="features-4" style="height: 800px;">
	<div class="row">
		<div class="area-4">


			<div class="area-4-container">
				<div class="post">
					<div class="header_post">
						<img src="resources/images/area_4_2.jpg" alt="">
					</div>

					<div class="body_post">
						<div class="post_content">

							<h1>전국 유명 산책로 / 등산로</h1>
							<p>전국의 산책로 / 등산로 중 유명하고 사람들이 자주 애용하는 것만 담았습니다.</p>

							<div class="container_infos">
								<div class="postedBy"></div>

								<div class="container_tags">
									<div class="tags">
										<ul>
											<li><a href="#">더보기 >></a></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="area-4-container">
				<div class="post">
					<div class="header_post">
						<img src="resources/images/area_4.jpg" alt="">
					</div>

					<div class="body_post">
						<div class="post_content">

							<h1>유저들의 산책로 / 등산로</h1>
							<p>
								저희 '등산로'를 이용해주시는 회원분들이 직접 코스를 짜주신 <br>산책로 / 등산로를 모아봤습니다!
							</p>

							<div class="container_infos">
								<div class="postedBy"></div>

								<div class="container_tags">
									<div class="tags">
										<ul>
											<li><a href="#">더보기 >></a></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="features-5" style="height: 500px;">
	<div class="row">
		<div class="area-5">
			<div class="area-5-imgbox">
				<img src="resources/images/hiking-removebg.png" alt="" />
			</div>
			<div class="area-5-content">
				<h1 class="area-5-h1">
					&nbsp;&nbsp;&nbsp;저희 <strong class="area-5-st">'DM Store'</strong>
					에서는 <br>각종 여러 등산 장비를 구매할 수 있습니다.
				</h1>
				<h4 class="area-5-h4">
					DM Store의 경우 기초 장비부터 전문 장비, 기타 장비 등의 <br>등산객들을 위한 상품들을 구비하고
					있습니다.
				</h4>
				<a class="area-5-button">보러가기 >></a>
			</div>
		</div>
	</div>
</section>

<section class="features-6">
	<div class="row area-6">
		<div class="area-6">
			<div class="cards">
				<article class="card-1 information [ card ]">
					<div class="div-tag">
						<span class="tag"> classification</span>
					</div>
					<h2 class="title">지역별 커뮤니티</h2>
					<p class="info">추천 코스, 유저가 만든 코스의 정보와 함께 동행 산행 신청 할 수 있는
						커뮤니티입니다.</p>
					<button class="area-6-button" type="button" onclick="">
						<span>Learn more</span>
						<svg xmlns="http://www.w3.org/2000/svg" height="24px"
							viewBox="0 0 24 24" width="24px" fill="none">
                           <path d="M0 0h24v24H0V0z" fill="none" />
                           <path
								d="M16.01 11H4v2h12.01v3L20 12l-3.99-4v3z" fill="currentColor" />
                        </svg>
					</button>
				</article>
			</div>
			<div class="cards">
				<article class="card-2 information [ card ]">
					<div class="div-tag">
						<span class="tag"> classification</span>
					</div>
					<h2 class="title">유용한 정보</h2>
					<p class="info">유저들 각자의 꿀팁 혹은 공유하고 싶은 정보를 담은 커뮤니티입니다.</p>
					<button class="area-6-button" type="button" onclick="">
						<span>Learn more</span>
						<svg xmlns="http://www.w3.org/2000/svg" height="24px"
							viewBox="0 0 24 24" width="24px" fill="none">
                           <path d="M0 0h24v24H0V0z" fill="none" />
                           <path
								d="M16.01 11H4v2h12.01v3L20 12l-3.99-4v3z" fill="currentColor" />
                        </svg>
					</button>
				</article>
			</div>
			<div class="cards">
				<article class="card-3 information [ card ]">
					<div class="div-tag">
						<span class="tag"> classification</span>
					</div>
					<h2 class="title">회원들의 모습</h2>
					<p class="info">유저들이 추천 코스, 유저가 만든 코스를 직접 다녀와 보고 후기나 리뷰를 블로그
						형식으로 작성한 커뮤니티입니다.</p>
					<button class="area-6-button" type="button" onclick="">
						<span>Learn more</span>
						<svg xmlns="http://www.w3.org/2000/svg" height="24px"
							viewBox="0 0 24 24" width="24px" fill="none">
                           <path d="M0 0h24v24H0V0z" fill="none" />
                           <path
								d="M16.01 11H4v2h12.01v3L20 12l-3.99-4v3z" fill="currentColor" />
                        </svg>
					</button>
				</article>
			</div>
			<div class="cards">
				<article class="card-4 information [ card ]">
					<div class="div-tag">
						<span class="tag"> classification</span>
					</div>
					<h2 class="title">Look & Style</h2>
					<p class="info">다른 유저의 각자 개성을 드러낸 등산복 착상을 확인할 수 있습니다. ootd 형식으로
						룩을 둘러보고 가세요!</p>
					<button class="area-6-button" type="button" onclick="">
						<span>Learn more</span>
						<svg xmlns="http://www.w3.org/2000/svg" height="24px"
							viewBox="0 0 24 24" width="24px" fill="none">
                           <path d="M0 0h24v24H0V0z" fill="none" />
                           <path
								d="M16.01 11H4v2h12.01v3L20 12l-3.99-4v3z" fill="currentColor" />
                        </svg>
					</button>
				</article>
			</div>
		</div>
	</div>
</section>