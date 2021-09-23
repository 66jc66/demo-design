<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 19041
  Date: 2021/8/19
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专辑</title>
</head>
<style>
    body {
        margin: 0;
    }
    /*最外层盒子*/
    .songRanking_content {
        width: 1400px;
        height: auto;
        margin: 0 auto;
        padding: 20px;    }

    /*右侧，显示每种导航下的MV信息*/

    .songRanking_rihgt_songList {
        width: 100%;
        height: auto;
        float: left;
    }
    .mv{
        background-color: #C0C0C0;
    }
    .nav{
        height: 80px;
    }
    .nav li {
        padding: 6px 14px;
        float: left;
        list-style: none;
        margin: 20px;
    }
    .all{
        border: 1px solid #000000;
        background-color: #99BDF9 ;
    }
</style>
<script src="${pageContext.request.contextPath}/index/js/jquery-3.2.1.js" type="text/javascript"></script>

<body>
<div class="songRanking_content">
    <div class="songRanking_rihgt_songList">
        <div class="mv">
            <ul class=nav>
                <li>地区：</li>
                <li class="all"><a href="${pageContext.request.contextPath}/index?key=queryAllCd">全部</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryByCity&city=华语">华语</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryByCity&city=英语">英语</a></li>
            </ul>
            <ul class=nav>
                <li>热门：</li>
                <li class="all"><a href="${pageContext.request.contextPath}/index?key=queryAllCd">全部</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCpopular&popular=1">是</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCpopular&popular=0">否</a></li>
            </ul>
            <ul class=nav>
                <li>年代：</li>
                <li class="all"><a href="${pageContext.request.contextPath}/index?key=queryAllCd">全部</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCyear&cyear=2020">2020</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCyear&cyear=2019">2019</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCyear&cyear=2018">2018</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCyear&cyear=2017">2017</a></li>
                <li><a href="${pageContext.request.contextPath}/index?key=queryCyear&cyear=2016">2016</a></li>
            </ul>
        </div>
        <div>
            <p>全部专辑</p>
            <c:forEach items="${cdList}" var="cd" varStatus="v">
                <div>
                    <div style="width: 220px ;height: 200px; float: left;margin:0 30px 10px 30px ;">
                        <img src="/imgs/${cd.cphoto}" style="width: 220px ;height: 160px;">
                        <div style="width: 220px ;height: 20px; text-align: center; float: left;">
                            <p style="font-size: 15px">${cd.cdName}-${cd.singer}</p></div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <div style="clear: both;"></div>
</div>
</body>

</html>
