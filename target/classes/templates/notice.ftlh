<#import "blocks/template.ftlh" as t>
<@t.template user>
<#if notice?has_content>
    <#list notice as singleNotice>
        <div>
            <p><b>${singleNotice.title}</b> <a href="/notice/${singleNotice.id}">Подробнее...</a></p>
        </div>
    </#list>
<#else>
    <h3>Заметок нет</h3>
</#if>


<hr>
<h3>Создать заметку</h3>

    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/notice/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="studentName">Дата</label>
                <input type="text" required class="form-control"
                       id="data" name="title">
            </div>
            <div class="form-group">
                <label for="tagStudent">Заметка</label>
                <input type="text" required class="form-control"
                       id="description" name="description">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>

    <form action="/notice/create" method="post">
        <div class="form-group">
        <label for="editTitle">Дата:</label><br>
        <input type="text" id="editTitle" name="title"}><br><br>
        </div>
        <div class="form-group">
        <label for="editDescription">Заметка:</label><br>
        <textarea id="editDescription" name="description"></textarea><br><br>
        </div>
        <input type="submit" style="width: 100%" class="btn btn-dark"value="Создать заметку">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>

</@t.template>