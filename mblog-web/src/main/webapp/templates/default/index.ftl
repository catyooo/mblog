<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_ltr site_name>
<!--推荐展示-->
<div class="content">
    <div class="recommend hidden-xs hidden-sm"">
        <ul>
			<@banner>
				<#list results as row>
                    <li <#if row_index == 0> class="large" </#if>>
                        <a href="${base}/view/${row.id}">
							<@albShow row.albums[0]/>
                            <h4>${row.title}</h4>
                        </a>
                    </li>
				</#list>
			</@banner>
        </ul>
    </div>
</div>

<@contents group=0>
    <div class="shadow-box">
    	<!-- tab -->
    	<div class="filter">
    		<ul class="">
    			<li><a <#if ord == 'newest'> class="active" </#if> href="${base}/?ord=newest">最新的</a></li>
    			<li><a <#if ord == 'hottest'> class="active" </#if> href="${base}/?ord=hottest">热门的</a></li>
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
    	<#assign url = "index?ord=" + ord>
    	<@pager url results 5 />
    </div>
</@contents>

</@ui_ltr>