<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/features.css" />
<section class="movie-list">
	<div>
		<h5>筛选条件</h5>
		<ul class="property-list">

		</ul>
	</div>
	<div class="property-div button-group filters-button-group">
		<h5>语言</h5>
		<ul class="property-list button-lang-group">
			<li>
				<button class="button is-checked" data-filter="*">全部</button>
			</li>
			<li>
				<button class="button" data-filter="lang">国语</button>
			</li>
			<li><button class="button" data-filter="lang">英语</button></li>
		</ul>
	</div>
	<div class="property-div button-group filters-button-group">
		<h5>影片类型</h5>
		<ul class="property-list button-type-group">
			<li><button class="button is-checked" data-filter="*">全部</button></li>
			<li><button class="button" data-filter="type">动作</button></li>
			<li><button class="button" data-filter="type">喜剧</button></li>
			<li><button class="button" data-filter="type">爱情</button></li>
			<li><button class="button" data-filter="type">科幻</button></li>
			<li><button class="button" data-filter="type">魔幻</button></li>
			<li><button class="button" data-filter="type">灾难</button></li>
			<li><button class="button" data-filter="type">恐怖</button></li>
			<li><button class="button" data-filter="type">纪录</button></li>
			<li><button class="button" data-filter="type">犯罪</button></li>
			<li><button class="button" data-filter="type">战争</button></li>
			<li><button class="button" data-filter="type">冒险</button></li>
		</ul>
	</div>
	<div class="search-div">
		<h5>影片查询</h5>
		<input type="text" placeholder="请输入搜索关键字" />
		<button>
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
	</div>
	<ul class="grid">
		<li class="grid-item" style="display: block;">
			<div class="ui_media">
				<div class="ui_pic">
					<a href="/movie/215806087" class="ui_movieType" target="_blank"
						title="小时代4：灵魂尽头"> <img
						src="http://img6.gewara.com/cw120h160/images/movie/201506/s_45b116a_14de7bf0b57__7b19.jpg"
						alt="小时代4：灵魂尽头" height="160" width="120">
					</a>
					<p class="mt10">
						<a class="btn btn-primary btn-select" href="/movie/215806087"
							target="_blank"><span>选座购票</span></a>
					</p>
				</div>
				<div class="ui_text">
					<div class="title">
						<h2>
							<a href="/movie/215806087" title="小时代4：灵魂尽头" target="_blank"
								class="color3 movie-name">小时代4：灵魂尽头</a>
						</h2>
					</div>
					<p>
						类型：<span class="movie-type">爱情,剧情,喜剧</span>
					</p>
					<p>
						语言：<span class="movie-lang">国语</span>
					</p>
					<p>
						片场 ： <span class="movie-duration-num">1小时56分钟</span>
					</p>
					<p>
						导演：<span class="movie-director">郭敬明</span>
					</p>
					<p class="movie-actor-list">主演：杨幂 郭采洁 陈学冬 郭碧婷 谢依霖 李贤宰 锦荣 王琳 商侃</p>
				</div>
			</div>
		</li>
		<li class="grid-item" style="display: block;">
			<div class="ui_media">
				<div class="ui_pic">
					<a href="/movie/218860078" class="ui_movieType" target="_blank"
						title="横冲直撞好莱坞"> <img
						src="http://img5.gewara.com/cw120h160/images/movie/201503/s_752b69d4_14c34a5872b__7ff6.jpg"
						alt="横冲直撞好莱坞" height="160" width="120">
					</a>
					<p class="mt10">
						<a class="btn btn-primary btn-select" href="/movie/218860078"
							target="_blank"><span>选座购票</span></a>
					</p>
				</div>
				<div class="ui_text">
					<div class="title">
						<h2>
							<a href="/movie/218860078" title="横冲直撞好莱坞" target="_blank"
								class="color3 movie-name">横冲直撞好莱坞</a>
						</h2>


					</div>
					<p class="ui_summary">
						<span class="first"></span>佟大为太美，好莱坞群星输了<span></span>
					</p>
					<p>
						类型：<span class="movie-type">爱情,喜剧,动作</span>
					</p>
					<p>
						语言：<span class="movie-lang">国语</span>
					</p>
					<p>
						片场 ： <span class="movie-duration-num">1小时58分钟</span>
					</p>
					<p>导演：蒂姆·肯德尔</p>
					<p class="movie-actor-list">主演：赵薇 黄晓明 佟大为 姜成镐 瑞斯·考罗 西蒙·赫尔伯格
						凯特·戴琳斯 罗伯特·帕特里克 斯蒂芬·托布罗斯基 米西·派勒 瑞克·福克斯</p>
				</div>
			</div>
		</li>
		<li class="grid-item" style="display: block;">
			<div class="ui_media">
				<div class="ui_pic">
					<a href="/movie/222714207" class="ui_movieType" target="_blank"
						title="我是路人甲"> <img
						src="http://img5.gewara.com/cw120h160/images/movie/201504/s_103437ab_14cb8185076__7f5c.jpg"
						alt="我是路人甲" height="160" width="120">
					</a>
					<p class="mt10">
						<a class="btn btn-primary btn-select" href="/movie/222714207"
							target="_blank"><span>选座购票</span></a>
					</p>
				</div>
				<div class="ui_text">
					<div class="title">
						<h2>
							<a href="/movie/222714207" title="我是路人甲" target="_blank"
								class="color3 movie-name">我是路人甲</a>
						</h2>

					</div>
					<p class="ui_summary">
						<span class="first"></span>等你老了，影坛就是我的<span></span>
					</p>
					<p>
						类型：<span class="movie-type">爱情,喜剧</span>
					</p>
					<p>
						语言：<span class="movie-lang">国语</span>
					</p>
					<p>
						片场 ： <span class="movie-duration-num">2小时14分钟</span>
					</p>
					<p>导演：尔冬升</p>
					<p class="movie-actor-list">主演：万国鹏 王婷 沈凯 徐小琴 姜涛 林晨 魏星 寇骏</p>
				</div>
			</div>
		</li>
		<li class="grid-item" style="display: block;">
			<div class="ui_media">
				<div class="ui_pic">
					<a href="/movie/251661103" class="ui_movieType" target="_blank"
						title="三只小猪与神灯"> <img
						src="http://img6.gewara.com/cw120h160/images/movie/201506/s587808e9_14e1a96573a__7ebf.jpg"
						alt="三只小猪与神灯" height="160" width="120">
					</a>
					<p class="mt10">
						<a class="btn btn-primary btn-select" href="/movie/251661103"
							target="_blank"><span>选座购票</span></a>
					</p>
				</div>
				<div class="ui_text">
					<div class="title">
						<h2>
							<a href="/movie/251661103" title="三只小猪与神灯" target="_blank"
								class="color3 movie-name">三只小猪与神灯</a>
						</h2>

					</div>
					<p>
						类型：<span class="movie-type">动画,喜剧</span>
					</p>
					<p>
						语言：<span class="movie-lang">国语</span>
					</p>
					<p>
						片场 ： <span class="movie-duration-num">1小时30分钟</span>
					</p>
					<p>导演：刘炜</p>
					<p class="movie-actor-list">主演：李晔 洪海天 王燕华 符冲</p>

				</div>
			</div>
		</li>
		<li class="grid-item" style="display: block;">
			<div class="ui_media">
				<div class="ui_pic">
					<a href="/movie/256733461" class="ui_movieType" target="_blank"
						title="再次出发"> <img
						src="http://img6.gewara.com/cw120h160/images/movie/201506/s1add9e57_14e1e87987b__7fd2.jpg"
						alt="再次出发" height="160" width="120">
					</a>
					<p class="mt10">
						<a class="btn btn-primary btn-select" href="/movie/256733461"
							target="_blank"><span>选座购票</span></a>
					</p>
				</div>
				<div class="ui_text">
					<div class="title">
						<h2>
							<a href="/movie/256733461" title="再次出发" target="_blank"
								class="color3 movie-name">再次出发</a>
						</h2>

					</div>
					<p class="ui_summary">
						<span class="first"></span>城市，就是我们的录音棚<span></span>
					</p>
					<p>
						类型：<span class="movie-type">爱情,喜剧</span>
					</p>
					<p>
						语言：<span class="movie-lang">英语</span>
					</p>
					<p>
						片场 ： <span class="movie-duration-num">1小时44分钟</span>
					</p>
					<p>导演：约翰·卡尼</p>
					<p class="movie-actor-list">主演：马克·鲁法洛 凯拉·奈特莉 詹姆斯·柯登 海莉·斯坦菲尔德
						亚当·莱文 凯瑟琳·基纳 茅斯·达夫</p>

				</div>
			</div>
		</li>
		<c:forEach items="${movieList }" var="movie">
			<li class="grid-item">
				<div class="ui_media">
					<div class="ui_pic">
						<img src="${movie.cover }" alt="${movie.name }" height="160"
							width="120">
						<p class="mt10">
							<a class="btn btn-primary btn-select" href="#" target="_blank"><span>选座购票</span></a>
						</p>
					</div>
					<div class="ui_text">
						<div class="title">
							<h2>
								<a href="#" title="${movie.name }" target="_blank"
									class="color3 movie-name">${movie.name }</a>
							</h2>
						</div>
						<p>类型：${movie.type }</p>
						<p>语言：${movie.language }</p>
						<p>
							片场 ： <span class="movie-duration-num">${movie.duration }分钟</span>
						</p>
						<p>导演：${movie.director }</p>
						<p>主演：${movie.actor }</p>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</section>
<script type="text/javascript" src="js/features.js"></script>

