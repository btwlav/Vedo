<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    Add new user
    <div>
        ${message}
    </div>
    <@l.login path="/registration" username="${login}" password="${password}"/>
    <label for="floatingPassword">Already have an account? Please, <a href="/login">Sign in</a></label>
</@c.page>