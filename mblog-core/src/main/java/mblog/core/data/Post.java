/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.data;

import com.fasterxml.jackson.annotation.JsonIgnore;
import mblog.base.lang.Consts;
import mblog.core.persist.entity.PostAttribute;
import mblog.core.persist.entity.PostPO;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.List;

/**
 * @author langhsu
 * 
 */
public class Post extends PostPO implements Serializable {
	private static final long serialVersionUID = -1144627551517707139L;

	private String content;

	// extends
	private List<Attach> albums;
	private Attach album;
	private User author;
	
	@JsonIgnore
	private PostAttribute attribute;
	
	public String[] getTagsArray() {
		if (StringUtils.isNotBlank(super.getTags())) {
			return super.getTags().split(Consts.SEPARATOR);
		}
		return null;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public List<Attach> getAlbums() {
		return albums;
	}

	public void setAlbums(List<Attach> albums) {
		this.albums = albums;
	}

	public Attach getAlbum() {
		return album;
	}

	public void setAlbum(Attach album) {
		this.album = album;
	}

	public PostAttribute getAttribute() {
		return attribute;
	}

	public void setAttribute(PostAttribute attribute) {
		this.attribute = attribute;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
