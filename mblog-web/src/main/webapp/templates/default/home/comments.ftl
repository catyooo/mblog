<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">

<div class="shadow-box no-bg">
	<div class="filter">
		<ul class="">
			<li><a class="active" href="${base}/home?method=comments">我的评论</a></li>
		</ul>
	</div>
	<!-- tab panes -->
	<div class="stream-list p-stream no-bg">
		<#list page.content as row>
			<div class="stream-item comment-item" el="loop-${row.id}">
				<h2 class="title" style="color:#F36C52">我说：${row.content}</h2>
				<div class="foot-block clearfix">
					<div class="author">
						<time>${timeAgo(row.created)}</time>
					</div>
					<div class="pull-right hidden-xs">
						<a class="act" href="javascript:void(0);" data-evt="trash" data-id="${row.id}">删除</a>
					</div>
				</div>
				<div class="arrow"></div>
			</div>
			<#if row.post??>
				<@showBlog row.post/>
			<#else>
				<div class="stream-item">文章已删除</div>
			</#if>

			<#if row_index < page.content?size>
                <div class="stream-blank"></div>
			</#if>
		</#list>

		<#if page.content?size == 0>
		<div class="stream-item">
			<i class="fa fa-info-circle fa-lg"></i> 您还没发表过评论!
		</div>
		</#if>

	</div>
</div>
<div class="text-center clr">
	<@pager "home?method=comments" page 5 />
</div>

<script type="text/javascript">
$(function() {
	$('a[data-evt=trash]').click(function () {
		var id = $(this).attr('data-id');

		layer.confirm('确定删除此项吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			jQuery.getJSON('${base}/comment/delete.json', {'id':id }, function (ret) {
				layer.msg(ret.message, {icon: 1});
				if (ret.code >=0) {
					var el = $('div[el=loop-' + id + ']');
                    el.next().remove();
                    el.next().remove();
                    el.remove();
				}
			});
            
        }, function(){
			
        });
	});
})
</script>
</@ui_home>