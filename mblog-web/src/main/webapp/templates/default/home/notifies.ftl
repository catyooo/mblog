<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">
<div class="shadow-box">
    <div class="filter">
        <ul class="">
            <li><a class="active" href="${base}/home/notifies">通知</a></li>
        </ul>
    </div>
    <!-- tab panes -->
    <div class="stream-list">
        <#list page.content as row>
            <div class="stream-item" id="loop-${row.id}">
                <div class="blog-rank">
                    <div class="user" title="${row.from.name}">
                        <a href="${base}/ta/${row.from.id}">
                            <@showAva row.from.avatar "img-circle"/>
                        </a>
                    </div>
                </div>
                <div class="summary">
                    <h2 class="title">${row.from.name}</h2>
                    <div class="excerpt wordbreak">
                        <#if (row.event == 1)>
                            喜欢了你的文章 - <a href="${base}/view/${row.postId}">${row.post.title}</a>
                        <#elseif (row.event == 2)>
                            关注了你, 你的粉丝+1
                        <#elseif (row.event == 3)>
                            评论了你的文章 - <a href="${base}/view/${row.postId}">点击查看详情</a>
                        <#elseif (row.event == 4)>
                            回复了你的评论 - <a href="${base}/view/${row.postId}">点击查看详情</a>
                        </#if>
                    </div>
                    </h2>
                    <div class="foot-block clearfix">
                        <div class="author">
                            <time>${timeAgo(row.created)}</time>
                        </div>
                    </div>
                </div>
            </div>
        </#list>

        <#if page.content?size == 0>
            <div class="stream-item">
                <i class="fa fa-info-circle fa-lg"></i> 您还没有收到通知!
            </div>
        </#if>

    </div>
</div>
<div class="text-center clr">
    <@pager "home/notifies" page 5 />
</div>
</@ui_home>