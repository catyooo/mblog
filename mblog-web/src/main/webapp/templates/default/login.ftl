<#include "/default/utils/layout_login.ftl"/>

<@layout "登录">
<div class="login">
    <!--
    <div class="vegas-overlay" style="opacity: 0.2; margin: 0px; padding: 0px; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; background-image: url(${base}/assets/images/overlay.png); z-index: -1;"></div>
    -->

    <a href="${base}/index">
        <img src="${base}/assets/images/logo/m90.png" height="72" width="72">
    </a>
    <h1>${site_welcomes}</h1>
    <hr>
    <form action="login" method="post">
        <div id="message">
            <#if message??>
            <div class="alert alert-danger">${message}</div>
            </#if>
        </div>
        <label for="id_email">登录名:</label>
        <div id="id_email">
            <input name="username" class="form-control border" placeholder="用户名" type="text" data-required>
        </div>
        <label for="id_password">密码:</label>
        <div id="id_password">
            <input name="password" class="form-control border" placeholder="密码" type="password" data-required>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="rememberMe" value="1"> 记住登录？
            </label>
        </div>

        <div style="margin-top: 15px;">
            <input type="submit" class="btn btn-success border" value="登录 Use it">

            <div class="forgot">
                <a href="${base}/reg">
                    注册
                </a>
                <a href="${base}/forgot/apply">
                    忘记密码
                </a>
            </div>
        </div>
    </form>
    <div class="with-line">使用第三方帐号登录</div>
    <div class="buttons">
        <a href="${base}/oauth/callback/call_weibo" title="微博帐号登录" rel="nofollow" class="weibo"></a>
        <a href="${base}/oauth/callback/call_qq" title="QQ帐号登录" rel="nofollow" class="qzone"></a>
        <a href="${base}/oauth/callback/call_douban" title="豆瓣帐号登录" rel="nofollow" class="douban"></a>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('form').validate({
            onKeyup: true,
            onChange: true,
            eachValidField: function () {
                $(this).closest('div').removeClass('has-error').addClass('has-success');
            },
            eachInvalidField: function () {
                $(this).closest('div').removeClass('has-success').addClass('has-error');
            },
            description: {
                message: {
                    required: '<div class="alert alert-danger">请先输入用户名/密码再进行登录操作</div>'
                }
            }
        });
    })
</script>

</@layout>

