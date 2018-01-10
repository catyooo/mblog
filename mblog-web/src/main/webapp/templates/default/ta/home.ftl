<#include "/default/utils/utils.ftl"/>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${user.name} 的Mtons</title>
	<#include "/default/inc/include.ftl"/>
</head>
<body>
	<#include "/default/inc/header.ftl"/>

	<!--.site-main -->
	<div class="wrap">
		<div class="profile">
			<div class="container">
				<div class="avatar animated fadeInDown">
					<@showAva user.avatar "img-circle"/>
				</div>
				<h1>${user.name}</h1>

				<h2>${user.signature}</h2>
				<a class="btn btn-white" href="javascript:void(0);" data-id="${user.id}" rel="follow">+ 关注</a>
			</div>
		</div>

		<nav id="profile-navigation" class="profile-navbar">
			<div class="container">
				<div class="content">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="javascript:void(0);)">TA的文章</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="row">
				<div class="main clearfix">
					<div class="col-xs-12 col-md-12">
						<div class="shadow-box mt20">
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
													<a title="${row.title}" href="<@resource src=alb.original/>">
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
													<a class="tag tag-sm" href="${base}/tag/${tag}/">${tag}</a>
												</li>
												</#list>
											</ul>
											<div class="pull-right hidden-xs">
												<span class="act">浏览 (<i>${row.views}</i>)</span>
												<span class="act">喜欢 (<i>${row.favors}</i>)</span>
											</div>
										</div>
									</div>
								</div>
								</#list>

								<#if page.content?size == 0>
								<div class="stream-item">
									<i class="fa fa-info-circle fa-lg"></i> TA还没发表过文章!
								</div>
								</#if>
							</div>
						</div>

						<div class="text-center clr">
						<@pager "${base}/ta/${user.id}" page 5 />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<#include "/default/inc/footer.ftl"/>
</body>
</html>