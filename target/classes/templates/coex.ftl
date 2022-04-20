<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/addForm.ftl" as a>

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
                <div>
                    <@l.logout/>
                </div>
            </div>
        </div>
    </nav>

    <div>
        <form method="post" action="/coex/add">
<#--            <label>Название программы<input type="text" name="name" placeholder="Введите название программы"/></label>-->
            <label>Программа
                <select name="progName">
                    <#list programs as program>
                        <option value="${program.name}">${program.name}</option>
                    </#list>
                </select>
            </label>
            <label>Исполнитель
                <select name="vedName">
                    <#list vedomstva as vedomstvo>
                        <option value="${vedomstvo.getUsername()}">${vedomstvo.getUsername()}</option>
                    </#list>
                </select>
            </label>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-outline-success" type="submit">Добавить</button>
        </form>
    </div>
    <div>
        <form method="get" action="/coex">
            <label>
                <input type="text" name="filterText" value="${filter}"/>
            </label>
            <button class="btn btn-primary" type="submit">Найти</button>
            <label>
                <select name="filterCry">
                    <option value="Название программы">Название программы</option>
                    <option value="Исполнитель">Исполнитель</option>
                </select>
            </label>
        </form>
    </div>
    <label>Список соисполнителей</label>
    <#list coexs as coex>
        <form method="post" action="/coex/edit">
            <div>
                <b>${coex.id}</b>
                <span>${coex.getProgramName()}</span>
                <strong>${coex.getUserName()}</strong>
                <input type="hidden" value="${coex.id}" name="id"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <#--                <input type="submit" name="edit" value="Изменить"/>-->
                <input type="submit" name="delete" value="Удалить"/>
            </div>
        </form>
    <#else>
        Список пуст
    </#list>
</@c.page>