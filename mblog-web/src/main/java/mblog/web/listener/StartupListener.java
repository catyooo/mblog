/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.web.listener;

import mblog.base.context.AppContext;
import mblog.base.lang.Consts;
import mblog.base.print.Printer;
import mblog.base.utils.PropertiesLoader;
import mblog.core.data.Config;
import mblog.core.persist.service.ConfigService;
import mblog.core.persist.service.FriendLinkService;
import mblog.core.persist.service.GroupService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.util.*;

/**
 * @author langhsu
 *
 */
@Component
public class StartupListener implements InitializingBean, ServletContextAware {
	@Autowired
	private ConfigService configService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private AppContext appContext;
	@Autowired
	private FriendLinkService friendLinkService;
	
	private ServletContext servletContext;

	/**
	 * 加载参数到系统
	 *
	 */
	private void loadParams() {
		Printer.info("加载配置文件...");
		// 初始化配置文件
		try {
			PropertiesLoader p = new PropertiesLoader(Consts.MTONS_CONFIG);
			System.setProperty(Consts.SYSTEM_VERSION, p.getProperty(Consts.SYSTEM_VERSION));

		} catch (Exception e) {
			Printer.error("说实话, 我也不知道啥错, 你自己看吧", e);
			System.exit(0);
		}

		Printer.info("加载配置文件 OK !");
	}

	/**
	 * 加载配置信息到系统
	 * 
	 */
	private void loadConfig() {
        Timer timer = new Timer("loadConfig", true);
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
				Printer.info("站点信息初始化...");
            	
            	List<Config> configs = configService.findAll();
            	Map<String, String> configMap = new HashMap<>();

            	if (configs.isEmpty()) {
					Printer.error("配置信息加载失败,我猜,可能是没有导入初始化数据(db_init.sql)导致的");
					System.exit(1);
            	} else {

					if (configs.size() < 13) {
						Printer.warn("嗯哼,系统检测到'系统配置'有更新,而你好像错过了什么, 赶紧去后台'系统配置'里检查下吧!");
					}
            		configs.forEach(conf -> {
//						servletContext.setAttribute(conf.getKey(), conf.getValue());
						configMap.put(conf.getKey(), conf.getValue());
					});
            	}

				appContext.setConfig(configMap);
            	
            	servletContext.setAttribute("groups", groupService.findAll(Consts.STATUS_NORMAL));
				servletContext.setAttribute("friendLinks", friendLinkService.findAll());

				Printer.info("OK, mblog 加载完了");
            }
        }, 3 * Consts.TIME_MIN);
    }

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		loadParams();
		loadConfig();
	}

}
