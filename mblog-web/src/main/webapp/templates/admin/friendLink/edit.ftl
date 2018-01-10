<#include "/admin/utils/ui.ftl"/>
<@layout>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>友情链接<#if friendLink??>修改<#else>添加</#if></h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <br>
                <#include "/admin/message.ftl">
                <form id="qForm" class="form-horizontal form-label-left" method="post" action="save">
                    <#if friendLink??>
                        <input type="hidden" name="id" value="${friendLink.id}" />
                    </#if>

                    <div class="form-group">
                        <label class="col-lg-2 control-label">站点名称</label>
                        <div class="col-lg-5">
                            <input type="text" name="siteName" class="form-control" value="${friendLink.siteName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">LOGO</label>
                        <div class="col-lg-5">
                            <input type="text" name="logo" class="form-control" value="${friendLink.logo}">
                            <p class="help-block">示例：http://mtons.com/logo.png</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">网址</label>
                        <div class="col-lg-8">
                            <input type="text" name="url" class="form-control" value="${friendLink.url}">
                            <p class="help-block">示例: http://mtons.com</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label">站点描述</label>
                        <div class="col-lg-8">
                            <textarea rows="3" class="form-control" name="remark" class="form-control" placeholder="站点描述">${friendLink.remark}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">排序</label>
                        <div class="col-lg-2">
                            <input type="text" name="sort" class="form-control {digits:true}" value="${friendLink.sort!'0'}">
                        </div>
                    </div>

                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button type="submit" class="btn btn-success">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        $("#qForm").validate();
    })
</script>
</@layout>