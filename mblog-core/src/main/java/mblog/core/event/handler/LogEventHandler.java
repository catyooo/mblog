/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.event.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import mblog.base.lang.EnumLog;
import mblog.core.event.LogEvent;
import mblog.core.persist.service.LogService;

/**
 * @author langhsu
 *
 */
@Component
public class LogEventHandler implements ApplicationListener<LogEvent> {
	@Autowired
	private LogService logService;
	
	@Override
	public void onApplicationEvent(LogEvent event) {
		EnumLog type = event.getType();
		
		switch (type) {
			case FAVORED:
				logService.add(type.getIndex(), event.getUserId(), event.getTargetId(), event.getIp());
				break;
			case BROWSE:
				break;
			default:
				break;
		}
	}


}
