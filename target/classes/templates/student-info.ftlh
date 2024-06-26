<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <#list images as image>
                <li data-target="#myCarousel" data-slide-to="${image_index}" class="<#if image_index == 0>active</#if>"></li>
            </#list>
        </ol>
        <div class="carousel-inner">
            <#list images as image>
                <div class="carousel-item <#if image_index == 0>active</#if>">
                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                         role="img" aria-label="Placeholder: ${image.name}" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#777"/>
                        <text x="50%" y="50%" fill="#777" dy=".3em">${image.name}</text>
                    </svg>
                    <div class="container">
                        <div class="carousel-caption">
                            <a href="/images/${image.id}">
                                <img class="product" style="height: 100px" src="/images/${image.id}" alt="${image.name}">
                            </a>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <hr>
    <h1 style="text-align: center">${student.title}</h1>
    <h1 style="text-align: center">${student.tag}</h1>
    <hr>


    <#if notice?has_content>
        <#list notice as singleNotice>
            <div>
                <p><b>${singleNotice.title}</b><p>  </p><p>${singleNotice.description}</p> <a href="/notice/${singleNotice.id}">Подробнее...</a></p>
            </div>
        </#list>
    <#else>
        <h3>Заметок нет</h3>
    </#if>

    <hr>

    <form action="/notice/create" method="post">
        <div class="form-group">
            <label for="editTitle">Заметка:</label><br>
            <input type="text" id="editTitle" name="title"}><br><br>
        </div>
        <div class="form-group">
            <label for="editDescription">Описание:</label><br>
            <textarea id="editDescription" name="description"></textarea><br><br>
        </div>
        <input type="submit" style="width: 100%" class="btn btn-dark"value="Создать заметку">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>

    <div class="card text-white bg-dark my-3 product">
        <div class="card-top">

            <a href="/student/edit/${student.id}" class="btn btn-primary m-2">Редактировать</a>
            <form action="/student/delete/${student.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-danger m-3">Удалить</button>
                <button class="btn btn-light my-2 my-sm-0" type="button" onclick="window.location.href = '/'">Назад</button>
            </form>
        </div>
    </div>

</@t.template>
