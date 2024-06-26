<!DOCTYPE html>
<html>
<head>
    <title>BookShare</title>
</head>
<body>
<h1>BookShare</h1><hr>
<h4>Описание:</h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${book.title}<br>
<b>Описание товара: </b>${book.description}<br>
<b>Жанр: </b>${book.tag}<br>
<b>Автор: </b>${book.author}<br>
<hr>
<form action="/book/delete/${book.id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Удалить товар"/>
</form>
</body>
</html>