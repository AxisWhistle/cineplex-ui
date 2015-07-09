<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<link rel="stylesheet" type="text/css" href="css/features.css" />
<section class="movie-list">
	<header class="property-header">
		<div class="property-div button-group filters-button-group">
			<h5>语言</h5>
			<ul class="property-list button-lang-group">
				<li><a class="btn button is-checked" data-filter="*">全部</a></li>
				<li><a class="btn button" data-filter="lang">国语</a></li>
				<li><a class="btn button" data-filter="lang">英语</a></li>
			</ul>
		</div>
		<div class="property-div button-group filters-button-group">
			<h5>影片类型</h5>
			<ul class="property-list button-type-group">
				<li><a class="btn button is-checked" data-filter="*">全部</a></li>
				<li><a class="btn button" data-filter="type">动作</a></li>
				<li><a class="btn button" data-filter="type">喜剧</a></li>
				<li><a class="btn button" data-filter="type">爱情</a></li>
				<li><a class="btn button" data-filter="type">科幻</a></li>
				<li><a class="btn button" data-filter="type">魔幻</a></li>
				<li><a class="btn button" data-filter="type">灾难</a></li>
				<li><a class="btn button" data-filter="type">恐怖</a></li>
				<li><a class="btn button" data-filter="type">纪录</a></li>
				<li><a class="btn button" data-filter="type">犯罪</a></li>
				<li><a class="btn button" data-filter="type">战争</a></li>
				<li><a class="btn button" data-filter="type">冒险</a></li>
			</ul>
		</div>
		<div class="search-div">
			<h5>影片查询</h5>
			<s:form action="search">
				<input type="text" placeholder="请输入搜索关键字" id="search-name-input" name="name" />
				<a class="btn btn-primary button" data-filter="name"><span
					class="glyphicon glyphicon-search search-span-btn"
					aria-hidden="true"></span>
				</a>
			</s:form>
		</div>
	</header>
	<ul class="grid">
		<c:forEach items="${movielist }" var="movie">
			<li class="grid-item" style="display: block;"><c:url
					var="dayMovieScheduleUrl" value="dayMovieSchedule_${movie.id }">
				</c:url>
				<div class="ui_media">
					<div class="ui_pic">
						<a href="${dayMovieScheduleUrl }" class="ui_movieType"
							target="_blank" title="${movie.name }"> <img
							src="${movie.cover }" alt="${movie.name }" height="160"
							width="120">
						</a>
						<p class="mt10">
							<a class="btn btn-primary btn-select"
								href="${dayMovieScheduleUrl }" target="_blank"><span>选座购票</span></a>
						</p>
					</div>
					<div class="ui_text">
						<div class="title">
							<h2>
								<a href="${dayMovieScheduleUrl }" title="${movie.name }"
									target="_blank" class="color3 movie-name">${movie.name }</a>
							</h2>
						</div>
						<p>
							类型：<span class="movie-type">${movie.type }</span>
						</p>
						<p>
							语言：<span class="movie-lang">${movie.language }</span>
						</p>
						<p>
							片长：<span class="movie-duration-num">${movie.duration }</span>
						</p>
						<p>
							导演：<span class="movie-director">${movie.director }</span>
						</p>
						<p class="movie-actor-list">主演：${movie.actor }</p>
					</div>
				</div></li>
		</c:forEach>
	</ul>
</section>
<script type="text/javascript" src="js/features.js"></script>

