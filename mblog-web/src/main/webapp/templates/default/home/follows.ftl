<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">

<div class="shadow-box">
	<div class="filter">
		<ul class="">
			<li><a class="active" href="${base}/home/follows">我的关注</a></li>
			<li><a href="${base}/home/fans">我的粉丝</a></li>
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
						<div class="pull-right hidden-xs">
							<a class="btn btn-success btn-xs" href="javascript:void(0);" data-id="${row.id}" rel="unfollow" style="color: #fff;">取消关注</a>
						</div>
					</div>
				</div>
			</div>
		</#list>

		<#if page.content?size == 0>
		<div class="stream-item">
			<i class="fa fa-info-circle fa-lg"></i> 您还没关注过任何人!
		</div>
		</#if>

	</div>
</div>
<div class="text-center clr">
	<@pager "follows" page 5 />
</div>

<script type="text/javascript">
$(function() {
	$('a[rel=unfollow]').click(function () {
		var id = $(this).attr('data-id');

		layer.confirm('确定取消关注TA吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			jQuery.getJSON('${base}/account/unfollow.json',{'id': id},  function (ret) {
				layer.msg(ret.message, {icon: 1});
				if (ret.code >=0) {
					$('#loop-' + id).fadeOut();
					$('#loop-' + id).remove();
				}
			});

        }, function(){

        });
	});
})
</script>
</@ui_home>