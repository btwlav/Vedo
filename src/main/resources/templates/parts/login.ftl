<#macro login path username password>
    <form action="${path}" method="post">
        <div><label> User Name : <input type="text" name="username" value="${username}"/> </label></div>
        <div>
            <label> Password:
                <input id="pass" type="password" name="password" value="${password}"/>
                <input type="button" value="Показать" id="passVisible" onclick="passBtn()"/>
            </label>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="Sign In"/></div>
    </form>
    <script type="text/javascript">
        function passBtn() {
            var pass = document.getElementById("pass");
            if (pass.type === "password") {
                pass.type = "text";
                document.getElementById("passVisible").value = "Скрыть";
            } else {
                pass.type = "password";
              document.getElementById("passVisible").value = "Показать";
            }
        }
    </script>
</#macro>

<#macro logout>

    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>