/**
 * 
 */
package mblog.base.lang;

public enum EnumOauthType {
	TYPE_QQ("QQ登录", 2),
	TYPE_SINA("微博登陆", 1);
	
	private String description;
	private int value;
	
	private EnumOauthType(String desc, int value) {
		this.description = desc;
		this.value = value;
	}

	public String getDescription() {
		return description;
	}

	public int getValue() {
		return value;
	}
	
	public static EnumOauthType getEnumStatus(int type) {
		EnumOauthType[] status = EnumOauthType.values();
		for(int i = 0; i < status.length; i++) {
			if(status[i].getValue() == type) {
				return status[i];
			}
		}
		
		throw new MtonsException("unsupported enum code!");
	}
}
