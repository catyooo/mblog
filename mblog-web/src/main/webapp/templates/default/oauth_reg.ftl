<#include "/default/utils/layout_login.ftl"/>

<@layout "注册">
<div class="login">
    <a href="${base}/index">
        <img src="${base}/assets/images/logo/m90.png" height="72" width="72">
    </a>
    <h1>离成功只差一步</h1>
    <hr>
    <form action="${base}/oauth/callback/bind_oauth" method="post">
        <input type="hidden" name="oauthType" value="$!{open.oauthType}"/>

        <input type="hidden" name="code" value="$!{open.oauthCode}"/>
        <input type="hidden" name="oauthUserId" value="$!{open.oauthUserId}"/>
        <input type="hidden" name="accessToken" value="$!{open.accessToken}"/>
        <input type="hidden" name="expireIn" value="$!{open.expireIn}"/>
        <input type="hidden" name="refreshToken" value="$!{open.refreshToken}"/>
        <input type="hidden" name="avatar" value="$!{open.avatar}"/>

        <div id="message">
			<#include "/default/inc/action_message.ftl"/>
        </div>
        <label for="id_email">用户名:</label>
        <div id="id_email">
            <input maxlength="18" class="form-control border" name="username" placeholder="用户名" type="text" value="$!{open.username}" data-required data-conditional="username" data-description="username" data-describedby="message">
        </div>
        <label for="id_name">昵称:</label>
        <div id="id_name">
            <input maxlength="9" class="form-control border" name="nickname" placeholder="昵称" type="text" value="$!{open.nickname}" data-required>
        </div>
        <!--
        <label for="id_name">邮箱:</label>
        <div id="id_name">
            <input maxlength="64" class="form-control border" name="email" placeholder="邮箱地址" type="text" data-required data-conditional="email" data-description="email" data-describedby="message">
        </div>
        -->
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
                username : function() {
                    return /^[a-z][a-z_0-9]{4,18}$/i.test($(this).val());
                }
                /*,
                email : function() {
                    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val());
                }*/
            },
            description : {
                username : {
                    conditional : '<div class="alert alert-danger">只能是字母/字母+数字的组合</div>'
                }
                /*,
                email : {
                    conditional : '<div class="alert alert-danger">邮箱格式不合法</div>'
                }
                */
            }
        });
    })
</script>
</@layout>