<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">

<div class="shadow-box">
    <div class="filter">
        <ul class="">
            <li><a class="active" href="$base/home">动态</a></li>
        </ul>
    </div>
    <!-- tab panes -->
    <div class="stream-list p-stream">
        <#list page.content as row>
            <#if row.post??>
                <@showBlog row.post />
            </#if>
        </#list>

        <#if page.content?size == 0>
            <div class="stream-item">
                <i class="fa fa-info-circle fa-lg"></i> 没有动态,赶紧去关注几个屌丝吧!
            </div>
        </#if>
    </div>
</div>
<div class="text-center clr">
    <@pager "home" page 5 />
</div>
</@ui_home>