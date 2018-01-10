<#include "/default/utils/utils.ftl">

<!-- Login dialog BEGIN -->
<div id="loginalert" style="display: none; top: 0px;" class="fade in">
    <div class="pd20 loginpd">
        <h3><i class="closealert fr" data-dismiss="modal" aria-label="Close"></i><div class="clear"></div></h3>
        <div class="loginwrap">
            <div class="loginh">
                <div class="fl">会员登录</div>
                <div class="fr">还没有账号<a id="sigup_now" href="${base}/reg">立即注册</a></div>
            </div>
            <h3><span class="login_warning" id="login_warning" style="display: none;">用户名或密码错误</span><div class="clear"></div></h3>
            <form action="" method="post" id="login_form">
                <div class="logininput">
                    <input type="text" id="alt_un" name="username" class="loginusername" value="" placeholder="用户名">
                    <input type="password" id="alt_pw" name="password" class="loginuserpasswordp" placeholder="密码">
                </div>
                <div class="loginbtn">
                    <div class="loginsubmit fl"><input type="button" value="登录" id="alt_login" class="btn"></div>
                    <!--
                    <div class="fr" style="margin:26px 0 0 0;"><a href="##">忘记密码?</a></div>
                    -->
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>
    <div class="thirdlogin">
        <div class="pd50">
            <h4>用第三方帐号直接登录</h4>
            <ul>
                <li id="sinal"><a href="${base}/oauth/callback/call_weibo">微博帐号注册</a></li>
                <li id="qql" style="margin-right: 0px;"><a href="${base}/oauth/callback/call_qq">QQ帐号注册</a></li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- Login dialog END -->

<!-- Header BEGIN -->
<div class="top-wrap">
    <nav class="navbar navbar-inverse" role="navigation">
    	<#include "/default/inc/browse_tips.ftl"/>
    	<div class="container">
    		<div class="navbar-header">
    			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
    				<span class="sr-only">Toggle navigation</span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    			</button>
    			<a class="navbar-brand logo" href="${base}/index"><img src="${base}/assets/images/logo/logo_full.png"></a>
    		</div>
    		<div id="navbar" class="navbar-collapse collapse">
    			<ul class="nav navbar-nav">
					<#if profile??>
    				<li data="home">
    					<a href="${base}/home" nav="home">我的主页</a>
    				</li>
					</#if>
					<#list groups as row>
					<li>
    					<a href="${base}/g/${row.key}" nav="${row.name}">${row.name}</a>
    				</li>
					</#list>
					
    			</ul>
    			<div id="_search_box" class="search-box navbar-left hidden-xs hidden-sm">
    				<form class="navbar-form" method="get" action="${base}/search">
    					<input type="text" class="form-control" name="q" placeholder="搜索...">
						<button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
    				</form>
    			</div>
    			
    			<ul class="nav navbar-nav navbar-right sign">
    				<#if profile??>
					<li class="dropdown">
                        <a href="${base}/post/new" class="publish"><i class="fa fa-magic"></i> 写文章</a>
					</li>
    				<li class="dropdown">
    					<a href="#" class="ava dropdown-toggle" data-toggle="dropdown">
    						<img class="img-circle" src="${base}${profile.avatar}">
    					</a>
    					<ul class="dropdown-menu" role="menu">
    		                <li>
    		                	<a href="${base}/account/profile" class="ava">
									<@showAva profile.avatar "img-circle" />
    		                		<span>${profile.name}</span>
    		                	</a>
    		               	</li>
    		                <li class="divider"></li>

							<@shiro.hasPermission name="admin">
								<li><a href="${base}/admin">后台管理</a></li>
							</@shiro.hasPermission>

    		                <li><a href="${base}/logout">退出</a></li>
    		              </ul>
    				</li>
    				<#else>
    				<li><a href="${base}/login" class="signin">登录</a></li>
                    
                    <li><a href="${base}/reg" class="signup">注册</a></li>
					</#if>
    			</ul>
    		</div>
    	</div>
    </nav>
</div>
<script type="text/javascript">
$(function () {
	$('a[nav]').each(function(){  
        $this = $(this);
        if($this[0].href == String(window.location)){  
            $this.closest('li').addClass("active");  
        }  
    });
});
</script>
<!-- Header END -->