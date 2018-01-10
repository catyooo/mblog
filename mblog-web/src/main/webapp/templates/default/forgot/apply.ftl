<#include "/default/utils/layout_login.ftl"/>

<@layout "密码找回">

<div class="login">
    <a href="${base}/index">
        <img src="${base}/assets/images/logo/m90.png" height="72" width="72">
    </a>
    <h1>通过邮箱找回密码</h1>
    <hr>
    <form action="apply" method="post">
        <div id="message">
            <#include "/default/inc/action_message.ftl"/>
        </div>
        <label for="id_name">用户名:</label>
        <div id="id_name">
            <input maxlength="64" class="form-control border" name="username" placeholder="用户名" type="text" data-required>
        </div>
        <input type="submit" class="btn btn-success border" value="提 交">
    </form>
</div>

<script type="text/javascript">
    $(function(){
        $('form').validate({
            onKeyup : true,
            onChange : true,
            eachValidField : function() {
                $(this).closest('div').removeClass('has-error').addClass('has-success');
            },
            eachInvalidField : function() {
                $(this).closest('div').removeClass('has-success').addClass('has-error');
            }
        });
    })
</script>
</@layout>