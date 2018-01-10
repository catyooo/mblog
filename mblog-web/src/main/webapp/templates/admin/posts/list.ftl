<#include "/admin/utils/ui.ftl"/>
<@layout>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>文章管理</h2>
                <ul class="nav navbar-right panel_toolbox">
					<@shiro.hasPermission name="posts:edit">
                    <li><a href="javascrit:void(0);" data-action="batch_del">批量删除</a>
                    </li>
					</@shiro.hasPermission>
                </ul>
				<div class="clearfix"></div>
			</div>
            <div class="x_content">
				<form id="qForm" class="form-inline">
					<input type="hidden" name="pn" value="${page.pageNo}" />
					<div class="form-group">
						<input type="text" name="title" class="form-control" value="${title}" placeholder="请输入标题关键字">
					</div>
					<button type="submit" class="btn btn-default">查询</button>
				</form>
			</div>
			<div class="x_content">
                <table id="dataGrid" class="table table-striped table-bordered b-t">
                    <thead>
                    <tr>
                        <th width="50"><input type="checkbox" class="checkall"></th>
                        <th width="360">文章标题</th>
                        <th>作者</th>
                        <th>发表日期</th>
                        <th>访问数</th>
                        <th>推荐</th>
                        <@shiro.hasPermission name="posts:edit">
                        <th width="200"></th>
                        </@shiro.hasPermission>
                    </tr>
                    </thead>
                    <tbody>
					<#list page.content as row>
                    <tr>
                        <td>
                            <input type="checkbox" name="id" value="${row.id}">
                        </td>
                        <td>${row.title}
                            <a href="${base}/view/${row.id}" target="_blank">${row.title}</a>
                        </td>
                        <td>${row.author.username}</td>
                        <td>${row.created?string('yyyy-MM-dd')}</td>
                        <td>${row.views}</td>
                        <td>
                            <#if (row.featured > 0)>
                            <span class="label label-info">置顶</span>
							</#if>
                        </td>
						<@shiro.hasPermission name="posts:edit">
                        <td class="text-center" align="left">
                            <a href="${base}/admin/posts/update?id=${row.id}" class="btn btn-xs btn-info">
                                <i class="fa fa-edit"></i>编辑
                            </a>

                            <#if (row.featured == 0)>
                            <a href="javascript:void(0);" class="btn btn-xs btn-danger" data-id="${row.id}" rel="featured">
                                <i class="fa fa-edit"></i>推荐
                            </a>
                            <#elseif (row.featured > 0)>
                            <a href="javascript:void(0);" class="btn btn-xs btn-primary" data-id="${row.id}" rel="unfeatured">
                                <i class="fa fa-edit"></i>撤销
                            </a>
							</#if>
                            <a href="javascript:void(0);" class="btn btn-xs btn-default" data-id="${row.id}" rel="delete">
                                <i class="fa fa-bitbucket"></i> 删除
                            </a>
                        </td>
						</@shiro.hasPermission>
                    </tr>
					</#list>
                    </tbody>
                </table>
				<@pager "list" page 5 />
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var J = jQuery;

function ajaxReload(json){
    if(json.code >= 0){
        if(json.message != null && json.message != ''){
			layer.msg(json.message, {icon: 1});
        }
        $('#qForm').submit();
    }else{
		layer.msg(json.message, {icon: 2});
    }
}

function doDelete(ids) {
	J.getJSON('${base}/admin/posts/delete', J.param({'id': ids}, true), ajaxReload);
}

function doUpdateFeatured(id, featured) {
    J.getJSON('${base}/admin/posts/featured', J.param({'id': id, 'featured': featured}, true), ajaxReload);
}

$(function() {
	// 删除
    $('#dataGrid a[rel="delete"]').bind('click', function(){
        var that = $(this);
		layer.confirm('确定删除此项吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			doDelete(that.attr('data-id'));
        }, function(){
        });
        return false;
    });

    // 推荐
    $('#dataGrid a[rel="featured"]').bind('click', function(){
        var that = $(this);
        layer.confirm('确定推荐吗?推荐后将显示在Banner位上', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
            doUpdateFeatured(that.attr('data-id'), 1);
        }, function(){
        });
        return false;
    });

    // 撤销
    $('#dataGrid a[rel="unfeatured"]').bind('click', function(){
        var that = $(this);
        layer.confirm('确定撤销吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
            doUpdateFeatured(that.attr('data-id'), 0);
        }, function(){
        });
        return false;
    });
    
    $('a[data-action="batch_del"]').click(function () {
		var check_length=$("input[type=checkbox][name=id]:checked").length;
		
		if (check_length == 0) {
			layer.msg("请至少选择一项", {icon: 2});
			return false;
		}
		
		var ids = [];
		$("input[type=checkbox][name=id]:checked").each(function(){
			ids.push($(this).val());
		});
		
		layer.confirm('确定删除此项吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			doDelete(ids);
        }, function(){
        });
    });
})
</script>
</@layout>
