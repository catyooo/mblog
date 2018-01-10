<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">
<div class="shadow-box">
    <div class="filter">
        <ul class="">
            <li><a href="${base}/home/follows">我的关注</a></li>
            <li><a class="active" href="${base}/home/fans">我的粉丝</a></li>
        </ul>
    </div>
    <!-- tab panes -->
    <div class="stream-list">
        <#list page.content as row>
            <div class="stream-item" id="loop-${row.id}">
                <div class="blog-rank">
                    <div class="user" title="${row.name}">
                        <a href="${base}/ta/${row.id}">
                            <@showAva row.avatar "img-circle"/>
                        </a>
                    </div>
                </div>
                <div class="summary">
                    <h2 class="title">${row.name}</h2>
                    <div class="foot-block clearfix">
                        <div class="author">
                            <span>文章数 ${row.posts}</span>
                            <span>评论数 ${row.comments}</span>
                        </div>
                    </div>
                </div>
            </div>
        </#list>

        <#if page.content?size == 0>
        <div class="stream-item">
            <i class="fa fa-info-circle fa-lg"></i> 还没有人关注您!
        </div>
        </#if>

    </div>
</div>
<div class="text-center clr">
    <@pager "fans" page 5 />
</div>
</@ui_home>