#set($title = "$!{tag}")

<div class="shadow-box">
	<div class="filter">
		<div class="alert" style="margin-bottom:0">
			<i class="fa fa-tag fa-lg"></i> $!{tag}
		</div>
	</div>
	<div class="stream-list p-stream">
		#foreach($row in $page.content)
			#showBlog($row)
		#end
		#if($page.content.size() == 0)
            <div class="stream-item">
                <i class="fa fa-info-circle fa-lg"></i> 该标签下没发表过文章!
            </div>
		#end
	</div>
</div>

<div class="text-center clr">
	#page("$base/tag/$!{tag}" $page 5)
</div>
