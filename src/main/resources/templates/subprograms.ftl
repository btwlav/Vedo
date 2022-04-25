<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

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
                    <#--                    <li class="nav-item">-->
                    <#--                        <a class="nav-link disabled">Disabled</a>-->
                    <#--                    </li>-->
                </ul>
                <form class="d-flex" method="get" action="/subs">
                    <label>
                        <select class="form-select" name="filterCry">
                            <option selected value="Без фильтров">Без фильтра</option>
                            <option value="Название подпрограммы">Название подпрограммы</option>
                            <option value="Название программы">Название программы</option>
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
            </div>
        </div>
    </nav>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
            data-bs-whatever="@mdo">Добавить
    </button>
    <div>
        <form method="post" action="/subs/add">
            <label>Название подпрограммы<input type="text" name="name"
                                               placeholder="Введите название подпрограммы"/></label>
            <label>Программа
                <select name="progName">
                    <#list programs as program>
                        <option value="${program.name}">${program.name}</option>
                    </#list>
                </select>
            </label>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-outline-success" type="submit">Добавить</button>
        </form>
    </div>

    <label>Список подпрограмм</label>
    <#list subs as sub>
        <form method="post" action="/subs/edit">
            <div>
                <b>${sub.id}</b>
                <span>${sub.name}</span>
                <strong>${sub.programName}</strong>
                <input type="hidden" value="${sub.id}" name="id"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <#--                <input type="submit" name="edit" value="Изменить"/>-->
                <input type="submit" name="delete" value="Удалить"/>
            </div>
        </form>
    <#else>
        Список пуст
    </#list>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Новая программа</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="mb-3">
                            <label for="name" class="col-form-label">Название программы:</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="mb-3">
                            <label for="start" class="col-form-label">Год начала:</label>
                            <input type="text" class="form-control" id="start">
                        </div>
                        <div class="mb-3">
                            <label for="end" class="col-form-label">Год конца:</label>
                            <input type="text" class="form-control" id="end">
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Send message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@c.page>