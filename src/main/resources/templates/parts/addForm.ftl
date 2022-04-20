<#macro addForm>
    <div>
        <form method="post" action="/programs/add">
            <label>Наименование<input type="text" name="name" placeholder="Введите название программы"/></label>
            <label>Год начала<input type="text" name="start" placeholder="Введите год начала"/></label>
            <label>Год конца<input type="text" name="end" placeholder="Введите год конца"/></label>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-outline-success" type="submit">Добавить</button>
        </form>
    </div>
</#macro>