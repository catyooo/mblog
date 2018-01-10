<#include "/default/utils/layout_login.ftl"/>

<@layout "注册成功">

<div class="login">
	<div class="vegas-overlay" style="opacity: 0.2; margin: 0px; padding: 0px; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; background-image: url(${base}/assets/images/overlay.png); z-index: -1;"></div>
	
	<a href="${base}/index">
		<img src="${base}/assets/images/logo/m90.png" height="72" width="72">
	</a>
	<hr>
	<form action="login" method="post">
		<div id="message"><#include "/default/inc/action_message.ftl"/></div>
		<div class="text-center">
			<#list data.links as row>
                <a href="${base}/${row.link}" class="btn btn-success">${row.text}</a>
			</#list>
		</div>
	</form>
</div>

</@layout>