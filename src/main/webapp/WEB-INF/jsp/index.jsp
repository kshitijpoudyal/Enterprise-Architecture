<%--
  Created by IntelliJ IDEA.
  User: kcp
  Date: 8/7/17
  Time: 6:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
    <title>IMDB</title>
</head>
<body>
<nav class="navbar navbar-toggleable-md navbar-light bg-faded">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#">IMDB</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/admin">Admin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/user">User</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container">
    <h1>List of series</h1>
    <c:forEach var="tvSeries" items="${series}">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-3">
                    <img src="http://lorempixel.com/250/300?random=1" alt="${tvSeries.name}" class="rounded img-responsive">
                </div>
                <div class="col-md-9">
                    <h3> ${tvSeries.name}
                        <small> Genre: ${tvSeries.genre}</small>
                    </h3>
                    <p>Directed by: ${tvSeries.director}</p>
                    <p>${tvSeries.description}</p>

                    <p class="lead">Casts:</p>
                    <ul style="list-style: none">
                        <c:forEach var="actor" items="${tvSeries.artists}">
                            <li data-toggle="collapse"
                                data-target="#actor-${tvSeries.id}-${actor.id}-content">
                                <img src="http://lorempixel.com/40/40?random=2" alt="${actor.name}" class="rounded-circle"> ${actor.name} - <small>Born in  ${actor.placeOfBirth}</small>
                                <div id="actor-${tvSeries.id}-${actor.id}-content" class="collapse">
                                       <small>Biography: ${actor.biography}</small>
                                </div>
                            </li>
                            <br>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <br>
            <div class="list-group">
                <c:forEach var="season" items="${tvSeries.seasons}">
                    <a data-toggle="collapse"
                       data-target="#${tvSeries.id}-${season.id}-content"
                       class="list-group-item list-group-item-action active"
                    style="color: white">${season.name} - ${season.releasedDate} - ${season.description}
                    </a>
                    <span id="${tvSeries.id}-${season.id}-content" class="collapse">
                        <img style="width: 100%" src="http://lorempixel.com/400/200?random=3" alt="${season.name}" class="img-responsive">
                        <c:forEach var="episode" items="${season.episodes}">

                            <a onclick="show('${tvSeries.id}-${season.id}-${episode.id}-content')" class="list-group-item list-group-item-action list-group-item-info">${episode.name} - ${episode.id}</a>
                            <div id="${tvSeries.id}-${season.id}-${episode.id}-content"
                                 style="display: none">
                            <c:forEach var="commentOne" items="${episode.comments}">
                                <a style="padding-left: 40px;"class="list-group-item list-group-item-action">${commentOne.comment}</a>
                            </c:forEach>
                                <a class="list-group-item list-group-item-action">
                                <form class="clearfix" style="width: 100%" action="/admin/series/episode/comment" method="POST">
                                    <input type="hidden" name="episode_id" value="${episode.id}"/>
                                    <textarea class="form-control" name="comment" type="text" placeholder="Comment..."></textarea>
                                    <br>
                                    <input class="btn btn-outline-primary float-right" type="submit" value="Post"/>
                            </form>
                            </a>
                            </div>
                        </c:forEach>
                    </span>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    function show(id) {
        var x = document.getElementById(id);
        if (x.style.display === 'none') {
            x.style.display = 'block';
        } else {
            x.style.display = 'none';
        }
    }
</script>
</body>
</html>
