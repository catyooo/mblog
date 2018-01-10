<#include "/default/utils/layout_login.ftl"/>

<@layout "重置密码">
<div class="login">
    <a href="${base}/index">
        <img src="${base}/assets/images/logo/m90.png" height="72" width="72">
    </a>
    <h1>重置密码</h1>
    <hr>
    <form action="${base}/forgot/reset" method="post">
        <input type="hidden" name="userId" value="${userId}"/>
        <input type="hidden" name="token" value="${token}"/>
        <div id="message">
            <#include "/default/inc/action_message.ftl"/>
        </div>
        <label for="id_password">密码:</label>
        <div id="id_password">
            <input id="password" class="form-control border" maxlength="18" name="password" placeholder="密码" type="password" data-required>
        </div>
        <label for="id_password2">确认密码:</label>
        <div id="id_password2">
            <input maxlength="18" class="form-control border" name="password2" placeholder="请再输入一次密码" type="password" data-required data-conditional="confirm" data-describedby="message" data-description="confirm">
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
            },
            conditional : {
                confirm : function() {
                    return $(this).val() == $('#password').val();
                }
            },
            description : {
                confirm : {
                    conditional : '<div class="alert alert-danger">两次输入的密码不一致</div>'
                }
            }
        });
    })
</script>
</script>