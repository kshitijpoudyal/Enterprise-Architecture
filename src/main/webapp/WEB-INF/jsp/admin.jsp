<%--
  Created by IntelliJ IDEA.
  User: kcp
  Date: 8/7/17
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
    <title>IMDB - Admin</title>
</head>
<body>
<nav class="navbar navbar-toggleable-md navbar-light bg-faded">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#">IMDB</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link active" href="/admin">Admin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user">User</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container">
    <%--<div class="jumbotron">--%>
    <%--${data}--%>
    <%--</div>--%>
    <div class="jumbotron">
        <h2>Add Series</h2>
        <form action="/admin/series/add" method="POST">
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">Series Name</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="name" placeholder="..." id="example-text-input">
                </div>
            </div>

            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">Genre</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="genre" placeholder="...">
                </div>
            </div>

            <div class="form-group row">
                <label for="example-number-input" class="col-2 col-form-label">Rating</label>
                <div class="col-10">
                    <input class="form-control" type="number" placeholder="0" name="rating" id="example-number-input">
                </div>
            </div>

            <div class="form-group row">
                <label for="example-number-input" class="col-2 col-form-label">Director</label>
                <div class="col-10">
                    <input class="form-control" type="text" placeholder="..." name="director">
                </div>
            </div>

            <div class="form-group row">
                <label for="example-number-input" class="col-2 col-form-label">Description</label>
                <div class="col-10">
                    <input class="form-control" type="text" placeholder="..." name="description">
                </div>
            </div>

            <div class="form-group row">
                <label for="exampleInputFile" class="col-2 col-form-label">Poster</label>
                <div class="col-10">
                    <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
                    <small id="fileHelp" class="form-text text-muted">Series Poster</small>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
    <div class="jumbotron">
        <h2>Add Season</h2>
        <form action="/admin/series/season/add" method="POST">

            <div class="form-group row">
                <label class="col-2 col-form-label">Series</label>
                <div class="col-10">
                    <select name="tvSeries_id" class="form-control">
                        <c:forEach var="tvSeries" items="${series}">
                            <option value="${tvSeries.id}">${tvSeries.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Name</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="name" placeholder="...">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Description</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="description" placeholder="...">
                </div>
            </div>

            <div class="form-group row">
                <label for="example-number-input" class="col-2 col-form-label">Released Date</label>
                <div class="col-10">
                    <input class="form-control" type="date" name="releasedDate" placeholder="...">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Poster</label>
                <div class="col-10">
                    <input type="file" class="form-control-file" aria-describedby="fileHelp">
                    <small class="form-text text-muted">Series Poster</small>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>

    <div class="jumbotron">
        <h2>Add Episode</h2>
        <form action="/admin/series/episode/add" method="POST">
            <div class="form-group row">
                <label class="col-2 col-form-label">Series</label>
                <div class="col-10">
                    <select name="tvSeries_id" class="form-control">
                        <c:forEach var="tvSeries" items="${series}">
                            <option value="${tvSeries.id}">${tvSeries.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Season</label>
                <div class="col-10">
                    <select name="season_id" class="form-control">
                        <c:forEach var="tvSeries" items="${series}">
                            <c:forEach var="season" items="${tvSeries.seasons}">
                                <option value="${season.id}">${season.name}</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Name</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="name" placeholder="...">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
    <div class="jumbotron">
        <h2>Add Casts</h2>
        <form action="/admin/series/cast/add" method="POST">

            <div class="form-group row">
                <label for="example-number-input" class="col-2 col-form-label">Series</label>
                <div class="col-10">
                    <select name="tvSeries_id" class="form-control" id="exampleSelect1">
                        <c:forEach var="tvSeries" items="${series}">
                            <option value="${tvSeries.id}">${tvSeries.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Name</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="name" placeholder="...">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Biography</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="biography" placeholder="...">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label">Place of Birth</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="placeOfBirth" placeholder="...">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>

    <h1>List of series</h1>
    <c:forEach var="tvSeries" items="${series}">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-3">
                    <img src="http://lorempixel.com/250/300?random=1" alt="${tvSeries.name}"
                         class="rounded img-responsive">
                </div>
                <div class="col-md-9">
                    <form action="/admin/series/delete" method="post" class="float-right">
                        <input type="hidden" name="tvSeries_id" value="${tvSeries.id}"/>
                        <input type="submit" class="btn btn-danger" value="Delete"/>
                    </form>
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
                                <img src="http://lorempixel.com/40/40?random=2" alt="${actor.name}"
                                     class="rounded-circle"> ${actor.name} -
                                <small>Born in ${actor.placeOfBirth}</small>
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
                        <img style="width: 100%" src="http://lorempixel.com/400/200?random=3" alt="${season.name}"
                             class="img-responsive">
                        <c:forEach var="episode" items="${season.episodes}">

                            <a onclick="show('${tvSeries.id}-${season.id}-${episode.id}-content')"
                               class="list-group-item list-group-item-action list-group-item-info">${episode.name} - ${episode.id}</a>
                            <div id="${tvSeries.id}-${season.id}-${episode.id}-content"
                                 style="display: none">
                            <c:forEach var="comment" items="${episode.comments}">
                                <a class="list-group-item list-group-item-action">${comment.comment}</a>
                            </c:forEach>
                                <a class="list-group-item list-group-item-action"></a>
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
