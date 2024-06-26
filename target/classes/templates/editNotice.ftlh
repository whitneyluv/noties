<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1>Редактировать заметку - ${notice.title}</h1>

<form action="/notice/edit/${notice.id}" method="post">
    <label for="editTitle">Дата:</label><br>
    <input type="text" id="editTitle" name="title" value="${notice.title}"><br><br>

    <label for="editDescription">Заметка:</label><br>
    <textarea id="editDescription" name="description">${notice.description}</textarea><br><br>

    <button type="submit" class="btn btn-primary">Сохранить изменения</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
</form>

<hr>
    <button style="width: 100%" class="btn btn-dark" type="button"
            onclick="window.location.href = '/notice/${notice.id}'">
        Отмена
    </button>
</@t.template>
