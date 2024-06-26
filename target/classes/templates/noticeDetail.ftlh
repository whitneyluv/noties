<#import "blocks/template.ftlh" as t>
<@t.template user>
<title>${notice.title}</title>
<h2>Заметка: ${notice.title}</h2>
<h1>Описание: ${notice.description}</h1>

<form action="/notice/edit/${notice.id}" method="get">
    <input type="submit" style="width: 100%" class="btn btn-dark"value="Редактировать заметку">
</form>

<hr>
    <button style="width: 100%" class="btn btn-dark" type="button"
            onclick="window.location.href =''">
        Назад к списку заметок
    </button>

    <form action="/notice/delete/${notice.id}" method="post">
        <button type="submit" class="btn btn-danger m-3">Удалить заметку</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
</@t.template>
