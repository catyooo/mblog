/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.event;

import org.springframework.context.ApplicationEvent;

import mblog.base.lang.EnumLog;

/**
 * @author langhsu
 * 
 */
public class LogEvent extends ApplicationEvent {
	private static final long serialVersionUID = -8660668451824808768L;

	private EnumLog type;
	private long userId;
	private long targetId;
	private String ip;

	public LogEvent(Object source) {
		super(source);
	}

	public EnumLog getType() {
		return type;
	}

	public void setType(EnumLog type) {
		this.type = type;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getTargetId() {
		return targetId;
	}

	public void setTargetId(long targetId) {
		this.targetId = targetId;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
