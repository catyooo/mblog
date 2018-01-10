/**
 * 
 */
package mblog.base.lang;

/**
 * @author langhsu
 * 
 */
public enum EnumRole {
	USER(0, "user", "普通用户"), ADMIN(1, "admin", "管理员");

	private EnumRole(int index, String key, String text) {
		this.index = index;
		this.key = key;
		this.text = text;
	}

	private int index;
	private String key;
	private String text;

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
	public static EnumRole getEnum(int index) {
		for (EnumRole r : EnumRole.values()) {
			if (r.getIndex() == index) {
				return r;
			}
		}
		return USER;
	}

}
