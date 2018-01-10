<div class="widget-box shadow-box">
	<div class="title">
		<h3><i class="fa fa-users "></i> 热门用户</h3>
	</div>
	<ul id="hotuser" class="hotusers">

        <img src="${base}/assets/images/spinner.gif">

	</ul>
</div>

<div class="widget-box shadow-box">
	<div class="title">
		<h3>
		<i class="fa fa-area-chart"></i> 热门文章
			<a href="" class="rrh-refresh"><i class="fa fa-refresh"></i>换一批</a>
		</h3>
		
	</div>
	<ul class="box-list" id="hots">
		<li class="text-center"><img src="${base}/assets/images/spinner.gif"></li>
	</ul>
</div>

<div class="widget-box shadow-box">
	<div class="title">
		<h3><i class="fa fa-bars"></i> 最新发布
		<a href="" class="rrh-refresh">查看更多</a></h3>
	</div>
	<ul class="box-list" id="latests">
        <li class="text-center"><img src="${base}/assets/images/spinner.gif"></li>
	</ul>
</div>


<script type="text/javascript">
var hot_li_template = '<li><div class="li-out"><span class="last"><i>{0}</i></span><span class="name"><a  href="{1}">{2}</a></span><span class="nums">{3}</span></div></li>'
var latest_li_template = '<li><div class="li-out"><span class="name"><a  href="{1}">{2}</a></span><span class="nums">{3}</span></div></li>'

var hotUser_li_template = '<li class=""><a  href="{1}"><img src="${base}{0}" class="imguser"/></a></li>'

seajs.use('sidebox', function (sidebox) {
	sidebox.init({
        latestUrl : '${base}/api/latests.json',
    	hotUrl : '${base}/api/hots.json',
		hotTagUrl : '${base}/api/hot_tags.json',
		hotUserUrl:'${base}/api/hotusers.json',

    	maxResults :10,
        // callback
        onLoadHot : function (i, data) {
        	var url = '${base}/view/' + data.id;
      		var item = jQuery.format(hot_li_template, i + 1, url, data.title, numberScale(data.views));
      		return item;
        },
        onLoadLatest : function (i, data) {
        	var url = '${base}/view/' + data.id;
      		var item = jQuery.format(latest_li_template, i + 1, url, data.title, numberScale(data.views));
      		return item;
        },
        onLoadHotUser : function (i, data) {
        var url = '${base}/ta/' + data.id;
      		var item = jQuery.format(hotUser_li_template,data.avatar,url,data.name, data.fans);
      		return item;
        }
	});
});
</script>