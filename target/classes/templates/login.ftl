<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    Login page
    <@l.login path="/login" username="" password=""/>
    <label for="floatingPassword">New to BInq? <a href="/registration">Create an account</a></label>
</@c.page>