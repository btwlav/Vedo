<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/modalEdit.ftl" as e>

<@c.page>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <!--            <img src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">-->
                Vedo
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<#--                    <li class="nav-item">-->
<#--                        <a class="nav-link active" aria-current="page" href="#">Home</a>-->
<#--                    </li>-->
<#--                    <li class="nav-item">-->
<#--                        <a class="nav-link" href="#">Link</a>-->
<#--                    </li>-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Справочники
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/programs">Программы</a></li>
                            <li><a class="dropdown-item" href="/vedomstva">Ведомства</a></li>
                            <li><a class="dropdown-item" href="/coex">Соисполнители</a></li>
                            <li><a class="dropdown-item" href="/subs">Подпрограммы</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" method="get" action="/programs">
                    <label>
                        <select class="form-select" name="filterCry">
                            <option selected value="Без фильтров">Без фильтра</option>
                            <option value="Название программы">Название программы</option>
                            <option value="Год начала">Год начала</option>
                            <option value="Год конца">Год конца</option>
                        </select>
                    </label>
                    <#--                    </li>-->
                    <input class="form-control ms-2 me-2" name="filterText" type="text" placeholder="Найти"
                           value="${filter}"
                           aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Найти</button>
                </form>
                <form>
                    <label class="ms-2" style="font-size: 2em; margin-top: -9px">|</label>
                </form>
                <form class="d-flex ms-2" action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <!--<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
                    <button class="btn btn-outline-danger" type="submit">Log out</button>
                </form>
                <#--                        <button type="button" class="btn btn-warning">Sign-up</button>-->

            </div>
        </div>
    </nav>

<#--    ДОДЕЛАТЬ НАВБАР-->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAdd"
            data-bs-whatever="@mdo">Добавить</button>

    <div><label>Список программ</label></div>
    <#list programs as program>
        <form>
            <div>
                <b>${program.id}</b>
                <span>${program.name}</span>
                <span>${program.start}-${program.end}</span>
                <strong>${program.getUserName()}</strong>
                <input type="hidden" value="${program.id}" name="id"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalEdit" data-bs-whatever="@mdo">Изменить</a>
                <@e.modalEdit id="${program.id}" name="${program.name}" start="${program.start}" end="${program.end}"/>
                <a href="/programs/delete">Удалить</a>
            </div>
        </form>
    <#else>
        <div>Список пуст</div>
    </#list>

    <div class="modal fade" id="modalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Новая программа</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/programs/add" method="post">
                        <div class="mb-3">
                            <label for="name" class="col-form-label">Наименование:</label>
                            <input type="text" name="name" class="form-control" id="name"
                                   placeholder="Введите название программы">
                        </div>
                        <div class="mb-3">
                            <label for="start" class="col-form-label">Год начала:</label>
                            <input type="text" name="start" class="form-control" id="start"
                                   placeholder="Введите год начала">
                        </div>
                        <div class="mb-3">
                            <label for="end" class="col-form-label">Год конца:</label>
                            <input type="text" name="end" class="form-control" id="end"
                                   placeholder="Введите год конца">
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@c.page>

<#--<#macro modalEdit id, name, start, end>-->
<#--    <div class="modal fade" id="modalEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">-->
<#--        <div class="modal-dialog">-->
<#--            <div class="modal-content">-->
<#--                <div class="modal-header">-->
<#--                    <h5 class="modal-title" id="exampleModalLabel">Изменение программы</h5>-->
<#--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>-->
<#--                </div>-->
<#--                <div class="modal-body">-->
<#--                    <form action="/programs/edit" method="post">-->
<#--                        <div class="mb-3">-->
<#--                            <label for="name" class="col-form-label">Наименование:</label>-->
<#--                            <input type="text" value="${name}" name="name" class="form-control" id="nameEdit"-->
<#--                                   placeholder="Введите название программы">-->
<#--                        </div>-->
<#--                        <div class="mb-3">-->
<#--                            <label for="start" class="col-form-label">Год начала:</label>-->
<#--                            <input type="text" value="${start}" name="start" class="form-control" id="startEdit"-->
<#--                                   placeholder="Введите год начала">-->
<#--                        </div>-->
<#--                        <div class="mb-3">-->
<#--                            <label for="end" class="col-form-label">Год конца:</label>-->
<#--                            <input type="text" value="${end}" name="end" class="form-control" id="endEdit"-->
<#--                                   placeholder="Введите год конца">-->
<#--                        </div>-->
<#--                        <div class="modal-footer">-->
<#--                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--                            <input type="hidden" name="idEdit" value="${id}"/>-->
<#--                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>-->
<#--                            <button type="submit" class="btn btn-primary">Изменить</button>-->
<#--                        </div>-->
<#--                    </form>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</#macro>-->