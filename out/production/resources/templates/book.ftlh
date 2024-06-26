<!DOCTYPE html>
<html>
<head>
    <title>BookShare</title>
</head>
<body>
<h1>BookShare | <a href="/login">Войти</a></h1><hr>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf value="${_csrf.token}"
    <input type="submit" value="Выйти"/>
</form>
<form action="/" method="get">
    Поиск по названию книги: <input type="text" name="title"><br>
    <input type="submit" value="Поиск"/>
</form>
<#list book as book>
    <div>
        <p><b>${book.title}</b> <a href="/book/${book.id}">Подробнее...</a></p>
    </div>
    <#else>
    <h3>Книги с таким названем нет</h3>
</#list>
<hr>
<h3>Добавить новую книгу</h3>
<form action="/book/create" method="post" enctype="multipart/form-data">
    Название книги: <input type="text" name="title"/><br><br>
    Описание: <input type="text" name="description"/><br><br>
    Жанр: <input type="text" name="tag"/><br><br>
    Имя: <input type="text" name="author"/><br><br>
    Первая фотография: <input type="file" name="file1"/><br><br>
    Вторая фотография: <input type="file" name="file2"/><br><br>
    Третья фотография: <input type="file" name="file3"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить книгу"/>
</form>
</body>
</html>