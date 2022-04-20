<#macro modalEdit id, name, start, end>
    <div class="modal fade" id="modalEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Изменение программы</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/programs/edit" method="post">
                        <div class="mb-3">
                            <label for="name" class="col-form-label">Наименование:</label>
                            <input type="text" value="${name}" name="name" class="form-control" id="name"
                                   placeholder="Введите название программы">
                        </div>
                        <div class="mb-3">
                            <label for="start" class="col-form-label">Год начала:</label>
                            <input type="text" value="${start}" name="start" class="form-control" id="start"
                                   placeholder="Введите год начала">
                        </div>
                        <div class="mb-3">
                            <label for="end" class="col-form-label">Год конца:</label>
                            <input type="text" value="${end}" name="end" class="form-control" id="end"
                                   placeholder="Введите год конца">
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="hidden" name="id" value="${id}"/>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
                            <button type="submit" class="btn btn-primary">Изменить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</#macro>