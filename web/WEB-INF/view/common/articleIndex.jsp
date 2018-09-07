<%--
  Created by IntelliJ IDEA.
  User: tao.zhang
  Date: 2018/8/17
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>blogIndex</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="<c:url value="/static/assetsLogin/ico/favicon.png"/>">
    <link href="<c:url value="/static/assetsIndex/css/base.css"/>" rel="stylesheet">
    <link href="<c:url value="/static/assetsIndex/css/index.css"/>" rel="stylesheet">
    <link href="<c:url value="/static/assetsIndex/css/m.css"/>" rel="stylesheet">
    <script src="<c:url value="/static/assetsIndex/js/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/static/assetsIndex/js/jquery/jquery.easyfader.min.js"/>"></script>
    <script src="<c:url value="/static/assetsIndex/js/scrollReveal.js"/>"></script>
    <script src="<c:url value="/static/assetsIndex/js/common.js"/>"></script>
    <%--调用函数跳转Controller--%>
    <script src="<c:url value="/static/assetsIndex/js/manage/indexPageManage.js"/>"></script>
    <!--[if lt IE 9]>
    <script src="<c:url value="/static/assetsIndex/js/modernizr.js"/>"></script>
    <![endif]-->

</head>

<body>
    <header>
        <%--主菜单--%>
        <div class="menu">
            <nav class="nav" id="topnav">
                <h1 class="logo" style="color: white">${blogUser.userName}的博客</h1>
                <li><a onclick="jumpToIndex('${blogUser.userId}')">首页推荐</a></li>
                <li><a onclick="jumpToArticleManage('${blogUser.userId}')">博文管理</a> </li>
                <li><a onclick="jumpToMessageBoard('${blogUser.userId}')">留言板</a></li>
                <li><a onclick="jumpToTraceTimeline('${blogUser.userId}')">时间轴</a></li>
                <li><a onclick="jumpToAccountManage('${blogUser.userId}')">账号管理</a></li>
            </nav>
        </div>
    </header>

    <article>
        <%--blogsbox begin--%>
        <div class="blogsbox">
            <%--推荐的博文--%>
            <div class="picsbox">
                <div class="banner">
                    <div id="banner" class="fader">
                        <li class="slide" ><a href="/" target="_blank"><img src="<c:url value="/static/assetsIndex/images/banner01.jpg"/>"><span class="imginfo">别让这些闹心的套路，毁了你的网页设计!</span></a></li>
                        <li class="slide" ><a href="/" target="_blank"><img src="<c:url value="/static/assetsIndex/images/banner02.jpg"/>"><span class="imginfo">网页中图片属性固定宽度，如何用js改变大小</span></a></li>
                        <li class="slide" ><a href="/" target="_blank"><img src="<c:url value="/static/assetsIndex/images/banner03.jpg"/>"><span class="imginfo">个人博客，属于我的小世界！</span></a></li>
                        <div class="fader_controls">
                            <div class="page prev" data-target="prev">&lsaquo;</div>
                            <div class="page next" data-target="next">&rsaquo;</div>
                            <ul class="pager_list">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--空白格--%>
            <div class="blank"></div>

            <%--博文列表--%>
            <c:forEach items="${blogArticles}" var="blogArticle">
                <div class="blogs" data-scroll-reveal="enter bottom over 1s" >
                    <h3 class="blogtitle"><a onclick="jumpToView('${blogArticle.articleId}')" target="_blank">${blogArticle.articleTitle}</a></h3>
                    <p class="blogtext">${blogArticle.articleContent}</p>
                    <div class="bloginfo">
                        <ul>
                            <li class="author">${blogArticle.articleAuthor}</li>
                            <li class="lmname" name="articleBelongBranch">${blogArticle.articleBelongBranch}</li>
                            <li class="timer"><fmt:formatDate value='${blogArticle.articleDate}' type='date' pattern='yyyy-MM-dd'/></li>
                            <%--阅读数量显示--%>
                            <c:if test="${blogArticle.articleReaded < 999}">
                                <li class="view"><span>${blogArticle.articleReaded}</span>已阅读</li>
                            </c:if>
                            <c:if test="${blogArticle.articleReaded > 999 and blogArticle.articleReaded < 100000}">
                            <li class="view"><span>999+</span>已阅读</li>
                            </c:if>
                            <c:if test="${blogArticle.articleReaded > 100000}">
                                <li class="view"><span>10W+</span>已阅读</li>
                            </c:if>
                            <%--点赞数量显示--%>
                            <c:if test="${blogArticle.articleLiked < 999}">
                                <li class="like">${blogArticle.articleLiked}</li>
                            </c:if>
                            <c:if test="${blogArticle.articleLiked > 999 and blogArticle.articleLiked < 100000}">
                                <li class="like">999+</li>
                            </c:if>
                            <c:if test="${blogArticle.articleLiked >100000}">
                                <li class="like">10W+</li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
        <%--blogsbox end--%>

        <div class="sidebar">
            <%--个人简介--%>
            <div class="about">
                <p class="avatar"> <img src="<c:url value="/static/assetsIndex/images/avatar.jpg"/>" alt=""> </p>
                <p class="abname">blogUser|${blogUser.userName}</p>
                <p class="abposition">${blogUser.userWork}</p>
                <p class="abtext">${blogUser.userIntroduce}</p>
            </div>
            <%--特别推荐等插件--%>
            <div class="zhuanti">
                <h2 class="hometitle">特别推荐</h2>
                <ul>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/banner03.jpg"/>"></i>
                        <p>帝国cms调用方法 <span><a href="/">阅读</a></span> </p>
                    </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/b04.jpg"/>"></i>
                        <p>5.20 我想对你说 <span><a href="/">阅读</a></span></p>
                    </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/b05.jpg"/>"></i>
                        <p>个人博客，属于我的小世界！ <span><a href="/">阅读</a></span></p>
                    </li>
                </ul>
            </div>
            <div class="tuijian">
                <h2 class="hometitle">推荐文章</h2>
                <ul class="tjpic">
                    <i><img src="<c:url value="/static/assetsIndex/images/toppic01.jpg"/>"></i>
                    <p><a href="/">别让这些闹心的套路，毁了你的网页设计</a></p>
                </ul>
                <ul class="sidenews">
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/toppic01.jpg"/>"></i>
                        <p><a href="/">别让这些闹心的套路，毁了你的网页设计</a></p>
                        <span>2018-05-13</span> </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/toppic02.jpg"/>"></i>
                        <p><a href="/">给我模板PSD源文件，我给你设计HTML！</a></p>
                        <span>2018-05-13</span> </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/v1.jpg"/>"></i>
                        <p><a href="/">别让这些闹心的套路，毁了你的网页设计</a></p>
                        <span>2018-05-13</span> </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/v2.jpg"/>"></i>
                        <p><a href="/">给我模板PSD源文件，我给你设计HTML！</a></p>
                        <span>2018-05-13</span> </li>
                </ul>
            </div>
            <div class="tuijian">
                <h2 class="hometitle">点击排行</h2>
                <ul class="tjpic">
                    <i><img src="<c:url value="/static/assetsIndex/images/toppic01.jpg"/>"></i>
                    <p><a href="/">别让这些闹心的套路，毁了你的网页设计</a></p>
                </ul>
                <ul class="sidenews">
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/toppic01.jpg"/>"></i>
                        <p><a href="/">别让这些闹心的套路</a></p>
                        <span>2018-05-13</span> </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/toppic02.jpg"/>"></i>
                        <p><a href="/">给我模板PSD源文件，我给你设计HTML！</a></p>
                        <span>2018-05-13</span> </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/v1.jpg"/>"></i>
                        <p><a href="/">别让这些闹心的套路，毁了你的网页设计</a></p>
                        <span>2018-05-13</span> </li>
                    <li> <i><img src="<c:url value="/static/assetsIndex/images/v2.jpg"/>"></i>
                        <p><a href="/">给我模板PSD源文件，我给你设计HTML！</a></p>
                        <span>2018-05-13</span> </li>
                </ul>
            </div>
        </div>
    </article>

</body>

</html>
