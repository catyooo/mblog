var mblog = function() {};
mblog.browser = function() {
   var u = navigator.userAgent;
   return {//移动终端浏览器版本信息 
        trident: u.indexOf('Trident') > -1, //IE内核
        presto: u.indexOf('Presto') > -1, //opera内核
        webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
        gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
        mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端
        ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
        android: u.indexOf('Android') > -1 && !mblog.browser.linuxNotIsAndroid, //android终端或者uc浏览器
        linuxNotIsAndroid: u.indexOf("Android") == -1 && //不是Android
        u.indexOf("Linux") > -1 &&  //但是包含Linux
        (u.indexOf("X11") > -1 || (u.indexOf("X86")>-1 || u.indexOf("AMD")>-1)) //同时是X11桌面,CPU是英特尔或者AMD
        ,
        iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
        iPad: u.indexOf('iPad') > -1, //是否iPad
        webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
    };
}();

this.mblog = mblog;

var numberScale = function (num) {
    var ret = num;

    if (num > 1000) {
        ret = (num / 1000).toFixed(1) + 'k';
    }
    return ret;
}