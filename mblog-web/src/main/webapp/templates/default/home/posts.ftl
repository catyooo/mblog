<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">

<div class="shadow-box">
	<div class="filter">
		<ul class="">
			<li><a class="active" href="${base}/home?method=posts">我的文章</a></li>
		</ul>
	</div>
	<!-- tab panes -->
	<div class="stream-list">
		<#list page.content as row>
		<div class="stream-item" id="loop-${row.id}">
			<div class="blog-rank">
				<div class="votes #if(${row.favors} > 0) plus #end">
					${row.favors}<small>喜欢</small>
				</div>
				<div class="views hidden-xs">
					${row.comments}<small>评论</small>
				</div>
			</div>
			<div class="summary">
				<h2 class="title"><a href="${base}/view/${row.id}">${row.title}</a></h2>
				<div class="excerpt wordbreak hidden-xs">${row.summary} &nbsp;</div>

				<!--前端图片显示样式-->
				<#if row.albums??>
				<!--Start-->
				<div class="thumbs clearfix">
					<#list row.albums as alb>
						<#if (alb_index < 3)>
						<div class="media col-xs-4 col-sm-4 col-md-4">
							<a title="${row.title}" href="#resource(${alb.original})">
								<@albShow alb/>
							</a>
						</div>
						</#if>
					</#list>
				</div>
				<!--End-->
				</#if>

				<div class="foot-block clearfix">
					<div class="author">
						<time>${timeAgo(row.created)}</time>
					</div>
					<ul class="tags">
						<#list row.tagsArray as tag>
						<li>
							<a class="tag tag-sm" href="${base}/tag/${tag}">${tag}</a>
						</li>
						</#list>
					</ul>
					<div class="pull-right hidden-xs">
						<a class="act_edit" href="javascript:void(0);" data-evt="edit" data-id="${row.id}">修改</a>
						<a class="act_delete" href="javascript:void(0);" data-evt="trash" data-id="${row.id}">删除</a>
					</div>
				</div>
			</div>
		</div>
		</#list>

		<#if page.content?size == 0>
		<div class="stream-item">
			<i class="fa fa-info-circle fa-lg"></i> 您还没发表过文章!
		</div>
		</#if>

	</div>
</div>
<div class="text-center clr">
	<@pager "home?method=posts" page 5 />
</div>

<script type="text/javascript">
$(function() {
	// delete
	$('a[data-evt=trash]').click(function () {
		var id = $(this).attr('data-id');

		layer.confirm('确定删除此项吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			jQuery.getJSON('${base}/post/delete/' + id, function (ret) {
				layer.msg(ret.message, {icon: 1});
				if (ret.code >=0) {
					$('#loop-' + id).fadeOut();
					$('#loop-' + id).remove();
				}
			});

        }, function(){

        });
	});
	
	// edit
	$('a[data-evt=edit]').click(function () {
		var id = $(this).attr('data-id');
		window.location.href='${base}/post/to_update/' + id;
	});
})
</script>
</@ui_home>