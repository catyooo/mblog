<#include "/default/utils/layout.ftl"/>
<@ui_ltr group.name>

<@contents group=group.id>
<div class="shadow-box">
	<!-- tab -->
	<div class="filter">
		<ul class="">
			<li><a <#if ord == 'newest'> class="active" </#if> href="?ord=newest"><i class="fa fa-newspaper-o"></i>最新的</a></li>
			<li><a <#if ord == 'hottest'> class="active" </#if> href="?ord=hottest"><i class="fa fa-fire"></i>热门的</a></li>
			<!--
			<li><a href="/blogs/hottest">全部的</a></li>
			-->
		</ul>
	</div>
	<!-- tab end -->
	<!-- tab panes -->
	<div class="stream-list p-stream">
		<#list results.content as row>
			<@showBlog row/>
		</#list>

		<#if  results.content?size == 0>
            <div class="stream-item">
                该目录下还没有内容!
            </div>
		</#if>

	</div>
</div>
<div class="text-center clr">
	<#assign url = group.key + "?ord=" + ord>
	<@pager url results 5 />
</div>
</@contents>

</@ui_ltr>