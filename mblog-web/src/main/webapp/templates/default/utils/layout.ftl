<#-- layout simple -->
<#macro ui_simple title keywords description>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${title?default(site_name)}</title>
    <meta name="keywords" content="mtons, ${keywords?default(site_keywords)}">
    <meta name="description" content="${description?default(site_description)}">

    <#include "/default/inc/include.ftl"/>
</head>
<body>
    <#include "/default/inc/header.ftl"/>

    <!--.site-main -->
    <div class="wrap" id="wrap">
        <div class="container">
            <div class="row">
                <div class="main clearfix">
                    <div class="col-xs-12 col-md-12">
                    <#nested>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/default/inc/footer.ftl"/>
</body>
</html>
</#macro>

<#-- layout user home -->
<#macro ui_home title>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${title} - ${site_name}</title>
    <meta name="keywords" content="mtons,${site_keywords}"/>
    <meta name="description" content="${site_description}"/>
    <#include "/default/inc/include.ftl"/>
</head>
<body>
    <#include "/default/inc/header.ftl"/>

    <!--.site-main -->
    <div class="wrap" id="wrap">
        <div class="container">
            <div class="row">
                <div class="main clearfix">
                    <!-- left -->
                    <div class="col-xs-12 col-md-3 side-left">
                        <#include "/default/home/right.ftl"/>
                    </div>

                    <div class="col-xs-12 col-md-9 side-right">
                        <#nested>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/default/inc/footer.ftl"/>
</body>
</html>
</#macro>

<#-- layout left to right -->
<#macro ui_ltr title keywords description>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${title?default(site_name)}</title>
    <meta name="keywords" content="mtons, ${keywords?default(site_keywords)}">
    <meta name="description" content="${description?default(site_description)}">
    <#include "/default/inc/include.ftl"/>
</head>
<body>
    <#include "/default/inc/header.ftl"/>

    <!--.site-main -->
    <div class="wrap" id="wrap">
        <div class="container">
            <div class="row">
                <div class="main clearfix">
                    <!-- left -->
                    <div class="col-xs-12 col-md-9 side-left">
                        <#nested>
                    </div>
                    <!-- right sidebar-->
                    <div class="col-xs-12 col-md-3 side-right hidden-xs hidden-sm">
                        <#include "/default/inc/right.ftl"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/default/inc/footer.ftl"/>
</body>
</html>
</#macro>