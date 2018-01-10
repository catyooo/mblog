<#include "/default/utils/layout_login.ftl"/>

<@layout "注册">
<div class="login">
    <a href="${base}/index">
        <img src="${base}/assets/images/logo/m90.png" height="72" width="72">
    </a>
    <h1>${site_welcomes}</h1>
    <a href="${base}/login" class="signup-link gapps"><span>已有账号, 登录</span></a>
    <hr>
    <form action="reg" method="post">
        <div id="message">
            <#include "/default/inc/action_message.ftl"/>
        </div>
        <label for="id_email">用户名:</label>
        <div id="id_email">
            <input maxlength="18" class="form-control border" name="username" value="${post.username}" placeholder="用户名" type="text" data-required data-conditional="username" data-description="username" data-describedby="message">
        </div>
        <label for="id_name">昵称:</label>
        <div id="id_name">
            <input maxlength="9" class="form-control border" name="name" value="${post.name}" placeholder="昵称" type="text" data-required>
        </div>
        <label for="id_name">邮箱:</label>
        <div id="id_name">
            <input maxlength="64" class="form-control border" name="email" value="${post.email}" placeholder="邮箱地址" type="text" data-required data-conditional="email" data-description="email" data-describedby="message">
        </div>
        <label for="id_password">密码:</label>
        <div id="id_password">
            <input id="password" class="form-control border" maxlength="18" name="password" placeholder="密码" type="password" data-required>
        </div>
        <label for="id_password2">确认密码:</label>
        <div id="id_password2">
            <input maxlength="18" class="form-control border" name="password2" placeholder="请再输入一次密码" type="password" data-required data-conditional="confirm" data-describedby="message" data-description="confirm">
        </div>
        <input type="submit" class="btn btn-success border" value="注 册">
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
            },
            conditional : {
                confirm : function() {
                    return $(this).val() == $('#password').val();
                },
                email : function() {
                    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val());
                },
                username : function() {
                    return /^[a-z][a-z_0-9]{4,18}$/i.test($(this).val());
                }
            },
            description : {
                confirm : {
                    conditional : '<div class="alert alert-danger">两次输入的密码不一致</div>'
                },
                email : {
                    conditional : '<div class="alert alert-danger">邮箱格式不合法</div>'
                },
                username : {
                    conditional : '<div class="alert alert-danger">只能是字母/字母+数字的组合,不少于5位</div>'
                }
            }
        });
    })
</script>

</@layout>