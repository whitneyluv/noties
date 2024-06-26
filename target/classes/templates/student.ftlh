<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Список студентов</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group">
                <label for="title">Поиск студентов:</label>
            </div>
            <div class="form-group col-md-2">
                 <input type="text" name="title"><br>
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <div class="card-columns">
        <#list student as student>
            <a href="/student/${student.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${student.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${student.title}</h5>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Студент не найден</h1>
        </#list>
    </div>

    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить нового студента в список
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/student/create" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label for="studentName">Имя</label>
                <input type="text" required class="form-control"
                       id="studentName" name="title">
            </div>

            <div class="form-group">
                <label for="tagStudent">Фамилия</label>
                <input type="text" required class="form-control"
                       id="tagStudent" name="tag">
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>

</@t.template>