/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.web.controller.desk;

/**
 * 
 * 返回页面配置
 * 
 * @author langhsu
 *
 */
public interface Views {
	String REDIRECT_HOME = "redirect:/home";

	String LOGIN = "/login";
	String REG = "/reg";
	String REG_RESULT = "/reg_result";
	String OAUTH_REG = "/oauth_reg";

	String FORGOT_APPLY = "/forgot/apply";
	String FORGOT_RESET = "/forgot/reset";

	String INDEX = "/index";

	String HOME_FEEDS = "/home/feeds";
	String HOME_POSTS = "/home/posts";

	String REDIRECT_HOME_POSTS = "redirect:/home?method=posts";
	String REDIRECT_POSTS_UPDATE = "redirect:/view/%s";
	String HOME_COMMENTS = "/home/comments";
	String HOME_FOLLOWS = "/home/follows";
	String HOME_FAVORS = "/home/favors";
	String HOME_FANS = "/home/fans";
	String HOME_NOTIFIES = "/home/notifies";

	String TA_HOME = "/ta/home";
	String ACCOUNT_AVATAR = "/account/avatar";
	String ACCOUNT_PASSWORD = "/account/password";
	String ACCOUNT_PROFILE = "/account/profile";
	String ACCOUNT_EMAIL = "/account/email";

	String TAGS_TAG = "/tag";
	
	String BROWSE_SEARCH = "/search";

	String ROUTE_POST_PUBLISH = "/blog/post";
	String ROUTE_POST_INDEX = "/blog/index";
	String ROUTE_POST_VIEW = "/blog/view";
	String ROUTE_POST_UPDATE = "/blog/update";
}
