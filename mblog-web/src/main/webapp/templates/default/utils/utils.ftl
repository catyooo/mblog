<#-- 用户头像显示 -->
<#macro showAva avatar clazz>
    <#if avatar?starts_with("http:")>
    <img class="${clazz}" src="${avatar}"/>
    <#else>
    <img class="${clazz}" src="<@resource src=avatar />"/>
    </#if>
</#macro>

<#macro showGroup row>
    <#if (row.featured > 0 )>
    <span class="label label-danger">推荐</span>
    </#if>
</#macro>

<#macro albShow att>
    <#if att.store == 1>
        <img src="${base}/assets/images/spinner-overlay.png" data-original="${att.preview}"/>
    <#else>
        <img src="${base}/assets/images/spinner-overlay.png" data-original="<@resource src=att.preview />"/>
    </#if>
</#macro>

<#-- 博文列表显示 -->
<#macro showBlog row>
<div class="stream-item" id="loop-${row.id}">
    <div class="summary">
        <a href="${base}/view/${row.id}">
            <div class="title"><@showGroup row/><h2>${row.title}</h2></div>
            <!--<div class="excerpt wordbreak hidden-xs">$!{row.summary} </div>-->
        </a>
        <!--前端图片显示样式-->
        <#if row.albums??>
        <!--Start-->
        <div class="thumbs clearfix">
            <#list row.albums as alb>
                <#if (alb_index < 4) >
                <div class="media col-xs-3 col-sm-3 col-md-3">
                    <a title="${row.title}" href="<@resource src=alb.original/>">
                        <@albShow alb/>
                    </a>
                </div>
                </#if>
            </#list>
        </div>
        <!--End-->
        </#if>

    </div>
    <div class="p-rank clearfix">
        <div class="users">
            <a href="${base}/ta/${row.author.id}">
                <div class="ava">
                    <@showAva row.author.avatar "img-circle"/>
                </div>
            </a>
            <div class="info">
                <strong> ${row.author.name}</strong>
                <time> ${row.created?string('MM月dd日')}</time>
                <time> ${timeAgo(row.created)}</time>
            </div>

        </div>
        <div class="counts">
            <span class="act"><i class="praise_icon"></i>${row.favors}</span>
            <span class="act"><i class="comment_icon"></i>${row.comments}</span>
        </div>

        <div class="foot-block clearfix">
            <ul class="tags">
                <#list row.tagsArray as tag>
                <li>
                    <a class="tag tag-sm" href="${base}/tag/${tag}/">${tag}</a>
                </li>
                </#list>
            </ul>
        </div>

    </div>
</div>
</#macro>

<#macro pager url p spans>
    <#local span = (spans - 3)/2 />
    <#local pageNo = p.number + 1 />
    <#if (url?index_of("?") != -1)>
        <#local cURL = (url + "&pn=") />
    <#else>
        <#local cURL = (url + "?pn=") />
    </#if>

<ul class="pagination">
    <#if (pageNo > 1)>
        <#local prev = pageNo - 1 />
        <li><a class="prev" href="${cURL}${prev}" pageNo="1">&nbsp;<i class="fa fa-angle-left"></i>&nbsp;</a></li>
    </#if>

    <#local totalNo = span * 2 + 3 />
    <#local totalNo1 = totalNo - 1 />
    <#if (p.totalPages > totalNo)>
        <#if (pageNo <= span + 2)>
            <#list 1..totalNo1 as i>
                <@pagelink pageNo, i, cURL/>
            </#list>
            <@pagelink 0, 0, "#"/>
            <@pagelink pageNo, p.totalPages, cURL />
        <#elseif (pageNo > (p.totalPages - (span + 2)))>
            <@pagelink pageNo, 1, cURL />
            <@pagelink 0, 0, "#"/>
            <#local num = p.totalPages - totalNo + 2 />
            <#list num..p.totalPages as i>
                <@pagelink pageNo, i, cURL/>
            </#list>
        <#else>
            <@pagelink pageNo, 1, cURL />
            <@pagelink 0 0 "#" />
            <#local num = pageNo - span />
            <#local num2 = pageNo + span />
            <#list num..num2 as i>
                <@pagelink pageNo, i, cURL />
            </#list>
            <@pagelink 0, 0, "#"/>
            <@pagelink pageNo, p.totalPages, cURL />
        </#if>
    <#elseif (p.totalPages > 1)>
        <#list 1..p.totalPages as i>
            <@pagelink pageNo, i, cURL />
        </#list>
    <#else>
        <@pagelink 1, 1, cURL/>
    </#if>

    <#if (pageNo lt p.totalPages)>
        <#local next = pageNo + 1/>
        <li><a href="${cURL}${next}" pageNo="${next}">&nbsp;<i class="fa fa-angle-right"></i>&nbsp;</a></li>
    </#if>
</ul>
</#macro>

<#macro pagelink pageNo idx url>
    <#if (idx == 0)>
    <li><span>...</span></li>
    <#elseif (pageNo == idx)>
    <li class="active"><a href="javascript:void(0);"><span>${idx}</span></a></li>
    <#else>
    <li><a href="${url}${idx}">${idx}</a></li>
    </#if>
</#macro>