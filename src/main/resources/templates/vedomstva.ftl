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
                <div>
                    <@l.logout/>
                </div>
            </div>
        </div>
    </nav>

    <div>
        <form method="get" action="/vedomstva">
            <label>
                <input type="text" name="filterText" value="${filter}"/>
            </label>
            <button class="btn btn-primary" type="submit">Найти</button>
        </form>
    </div>
    <div><label>Список ведомств</label></div>
    <#list vedomstva as vedomstvo>
        <form method="post" action="/vedomstva/edit">
            <div>
                <b>${vedomstvo.username}</b>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
            </div>
        </form>
    <#else>
        Список пуст
    </#list>
</@c.page>