<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Редактирование студента</h1><hr>
    <form action="/student/edit/${student.id}" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">Имя</label>
            <input type="text" class="form-control" id="title" name="title" value="${student.title}" required>
        </div>
        <div class="form-group">
            <label for="tag">Фамилия</label>
            <input type="text" class="form-control" id="tag" name="tag" value="${student.tag}" required>
        </div>
        <div class="form-group">
            <label for="file1">Первая фотография</label>
            <input type="file" class="form-control-file" id="file1" name="file1">
        </div>
        <div class="form-group">
            <label for="file2">Вторая фотография</label>
            <input type="file" class="form-control-file" id="file2" name="file2">
        </div>
        <div class="form-group">
            <label for="file3">Третья фотография</label>
            <input type="file" class="form-control-file" id="file3" name="file3">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@t.template>
