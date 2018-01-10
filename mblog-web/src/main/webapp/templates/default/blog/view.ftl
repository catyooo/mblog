<#include "/default/utils/utils.ftl"/>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${ret.title?default(site_name)}</title>
    <meta name="keywords" content="mtons, ${ret.tags?default(site_keywords)}">
    <meta name="description" content="${ret.summary?default(site_description)}">
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
                    <div class="shadow-box">
                        <h1 class="post-title">${ret.title}</h1>
                        <div class="clearfix post-other">
            <span class="pull-left author">
                <a class="author-name" href="${base}/ta/${ret.author.id}" target="_blank">${ret.author.name}</a>
            </span>
                            <time class="pull-left time">${ret.created?string('yyyy-MM-dd')}</time>
                            <span class="pull-left time">浏览: ${ret.views}</span>
                            <ul class="tags">
                            <#list ret.tagsArray as tag>
                                <li>
                                    <a class="tag tag-sm" href="${base}/tag/${tag}/">${tag}</a>
                                </li>
                            </#list>
                            </ul>
                            <span class="pull-right action-box"></span>
                        </div>
                        <div class="post-frame">
                            <div class="post-content">
                            ${ret.content}
                            </div>
                            <div class="post-footer">
                                <div class="tip">分享到：</div>
                                <div class="shares">
                                    <!-- Share Button BEGIN -->
                                    <div class="bdsharebuttonbox bdshare-button-24">
                                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                                        <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                    </div>
                                    <script>window._bd_share_config = {
                                        "common": {
                                            "bdSnsKey": {"tsina": "3554307689"},
                                            "bdText": "",
                                            "bdMini": "2",
                                            "bdMiniList": false,
                                            "bdPic": "",
                                            "bdStyle": "1",
                                            "bdSize": "24"
                                        }, "share": {}
                                    };
                                    with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
                                    <style>
                                        .bdshare-button-24 a, .bdshare-button-24 .bds_more {
                                            background-image: url("${base}/assets/images/btn/icons_0_24.png");
                                            border-radius: 4px;
                                        }

                                        .bdshare-button-style1-24 a, .bdshare-button-style1-24 .bds_more {
                                            padding-left: 24px;
                                        }
                                    </style>
                                    <!-- Share Button END -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- post/end -->

                    <div id="chat" class="chats shadow-box">
                        <div class="chat_other">
                            <h4>全部评论: <i id="chat_count">0</i> 条</h4>
                        </div>
                        <ul id="chat_container" class="its"></ul>
                        <div id="pager" class="text-center"></div>
                        <div class="cbox-wrap">
                            <div class="cbox-title">我有话说: <span id="chat_reply" style="display:none;">@<i
                                    id="chat_to"></i></span>
                            </div>
                            <div class="cbox-post">
                                <div class="cbox-input">
                                    <textarea id="chat_text" rows="3" placeholder="请输入评论内容"></textarea>
                                    <input type="hidden" value="0" name="chat_pid" id="chat_pid"/>
                                </div>
                                <div class="cbox-ats clearfix">
                                    <div class="ats-func">
                                        <ul class="func-list">
                                            <li class="list-b">
                                                <a href="javascript:void(0);" class="join" id="c-btn"><i
                                                        class="fa fa-smile-o fa-2"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="ats-issue">
                                        <button id="btn-chat" class="btn btn-success btn-sm bt">发送</button>
                                    </div>
                                </div>
                            </div>
                            <div class="phiz-box" id="c-phiz" style="display:none">
                                <div class="phiz-list" view="c-phizs"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- right sidebar-->
                <div class="col-xs-12 col-md-3 side-right hidden-xs hidden-sm">
                    <ul class="list-group about-user">
                        <li class="list-group-item user-card" >
                            <div class="ava">
                                <a href="${base}/ta/${ret.author.id}">
                                    <@showAva ret.author.avatar "img-circle"/>
                                </a>
                            </div>
                            <div class="user-info">
                                <div class="nk mb10">${ret.author.name}</div>
                                <div class="mb6">
                                    <a class="btn btn-success btn-xs" href="javascript:void(0);" data-id="${ret.author.id}" rel="follow">+ 关注</a>
                                </div>
                            </div>
                        </li>

                        <li class="list-group-item">
                            <div class="user-datas">
                                <ul>
                                    <li><strong>${ret.author.posts}</strong><span>发布</span></li>
                                    <li class="noborder"><strong>${ret.author.comments}</strong><span>评论</span></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a class="btn btn-success btn-sm" href="javascript:void(0);" data-id="${ret.id}" rel="favor">喜欢</a>
                            <strong id="favors">${ret.favors}</strong> 喜欢
                        </li>
                    </ul>
                <#include "/default/inc/right.ftl"/>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/default/inc/footer.ftl"/>

<script type="text/plain" id="chat_template">
    <li id="chat{5}">
        <a class="avt fl" target="_blank" href="${base}/ta/{0}">
            <img src="${base}{1}">
        </a>
        <div class="chat_body">
            <h5>
                <div class="fl"><a class="chat_name" href="${base}/ta/{0}">{2}</a><span>{3}</span></div>
                <div class="fr reply_this"><a href="javascript:void(0);" onclick="goto('{5}', '{2}')">[回复]</a></div>
                <div class="clear"></div>
            </h5>
            <div class="chat_p">
                <div class="chat_pct">{4}</div> {6}
            </div>
        </div>
        <div class="clear"></div>
        <div class="chat_reply"></div>
    </li>
</script>

<script type="text/javascript">
    function goto(pid, user) {
        document.getElementById('chat_text').scrollIntoView();
        $('#chat_text').focus();
        $('#chat_text').val('');
        $('#chat_to').text(user);
        $('#chat_pid').val(pid);

        $('#chat_reply').show();
    }
    var container = $("#chat_container");
    var template = $('#chat_template')[0].text;

    seajs.use('comment', function (comment) {
        comment.init({
            load_url: '${base}/comment/list/${ret.id}',
            post_url: '${base}/comment/submit',
            toId: '${ret.id}',
            onLoad: function (i, data) {

                var content = ContentRender.wrapItem(data.content);

                var quoto = '';
                if (data.pid > 0 && !(data.parent === null)) {
                    var pat = data.parent;
                    var pcontent = ContentRender.wrapItem(pat.content);
                    quoto = '<div class="quote"><a href="${base}/ta/' + pat.author.id + '">@' + pat.author.name + '</a>: ' + pcontent + '</div>';
                }
                var item = jQuery.format(template,
                        data.author.id,
                        data.author.avatar,
                        data.author.name,
                        data.created,
                        content,
                        data.id, quoto);
                return item;
            }
        });
    });

    seajs.use('phiz', function (phiz) {
        $("#c-btn").jphiz({
            base: '${base}/assets',
            textId: 'chat_text',
            lnkBoxId: 'c-lnk',
            phizBoxId: 'c-phiz'
        });
    });

</script>
</body>
</html>
