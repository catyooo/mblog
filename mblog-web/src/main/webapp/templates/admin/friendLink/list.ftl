<#include "/admin/utils/ui.ftl"/>
<@layout>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>友情链接管理</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <@shiro.hasPermission name="friendLink:edit">
                        <li><a href="${base}/admin/friendLink/edit">添加链接</a>
                        </li>
                    </@shiro.hasPermission>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <table id="treeTable" class="table table-striped table-bordered b-t text-small">
                    <tr>
                        <th class="col-lg-1">#</th>
                        <th>网站名称</th>
                        <th>logo</th>
                        <th>URL</th>
                        <th>描述</th>
                        <th class="col-lg-1">排序</th>
                        <@shiro.hasPermission name="friendLink:edit">
                            <th width="300" class="col-lg-2">操作</th>
                        </@shiro.hasPermission>
                    </tr>
                    <#list list as row>
                        <td>${velocityCount}</td>
                        <td>${row.siteName}</td>
                        <td>${row.logo}</td>
                        <td>${row.url}</td>
                        <td>${row.remark}</td>
                        <td>${row.sort}</td>
                        <@shiro.hasPermission name="friendLink:edit">
                            <td class="text-center">
                                <a href="${base}/admin/friendLink/edit?id=${row.id}" class="btn btn-xs btn-primary">
                                    <i class="fa fa-check-square-o"></i> 修改
                                </a>
                                <a href="${base}/admin/friendLink/delete?id=${row.id}" class="btn btn-xs btn-default"><i
                                        class="fa fa-check-square-o"></i> 删除</a>
                            </td>
                        </@shiro.hasPermission>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>

</@layout>
