<#include "/default/utils/layout.ftl"/>
<@ui_ltr group.name>

    <div class="shadow-box">
        <!-- tab -->
        <div class="filter">
            <div class="alert" style="margin-bottom:0">
                <li><span>搜索 <strong>${q}</strong>, 共 ${page.totalElements} 个结果.</span></li>
            </div>
        </div>
        <!-- tab end -->
        <!-- tab panes -->
        <div class="stream-list p-stream">
			<#list page.content as row>
				<@showBlog row/>
			</#list>

			<#if  page.content?size == 0>
                <div class="stream-item">
                    该目录下还没有内容!
                </div>
			</#if>

        </div>
    </div>
    <div class="text-center clr">
		<#assign url = "search?q=" +q />
		<@pager url page 5 />
    </div>

	<script>
		$(function () {
			$('input[name=q]', $('#_search_box')).val('${q}');
		});
	</script>

</@ui_ltr>
