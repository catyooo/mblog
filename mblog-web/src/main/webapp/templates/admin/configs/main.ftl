<#include "/admin/utils/ui.ftl"/>
<@layout>

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>系统配置</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <div class="col-xs-3">
                    <!-- required for floating -->
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs tabs-left">
                        <li class="active"><a href="#sites" data-toggle="tab" aria-expanded="true">站点配置</a>
                        </li>
                        <li class=""><a href="#settings" data-toggle="tab" aria-expanded="false">系统配置</a>
                        </li>
                    </ul>
                </div>

                <div class="col-xs-9">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="sites">
                            <#include "/admin/configs/sites.ftl">
                        </div>
                        <div class="tab-pane" id="settings">
                            <#include "/admin/configs/settings.ftl">
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
var J = jQuery;

function ajaxReload(json){
    if(json.code >= 0){
        if(json.message != null && json.message != ''){
            alert(json.message);
        }
        $('#qForm').submit();
    }else{
        alert(json.message);
    }
}

$(function() {
	// 刷新缓存
    $('a[data-action="flush_cache"]').bind('click', function(){
        if(confirm('确定要刷新Ehcache的缓存吗？')){
            J.getJSON('${base}/admin/config/flush_cache.json', ajaxReload);
        }
        return false;
    });

    // 刷新系统变量
    $('a[data-action="flush_conf"]').bind('click', function(){
        if(confirm('确定要刷新系统变量的缓存吗？')){
            J.getJSON('${base}/admin/config/flush_conf.json', ajaxReload);
        }
        return false;
    });

    // 重建索引
    $('a[data-action="flush_indexs"]').bind('click', function(){
        if(confirm('确定要重建文章索引吗？')){
            J.getJSON('${base}/admin/config/flush_indexs.json', ajaxReload);
        }
        return false;
    });
})
</script>
</@layout>