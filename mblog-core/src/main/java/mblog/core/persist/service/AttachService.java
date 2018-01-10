/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.persist.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import mblog.core.data.Attach;

/**
 * @author langhsu
 *
 */
public interface AttachService {
	/**
	 * 查询文章的附件列表
	 * @param toId
	 * @return
	 */
	List<Attach> findByTarget(long toId);
	
	/**
	 * 批量查询附件
	 * 
	 * @param toIds 目录对象Id列表
	 * @return Map<toId, List<Attach>>
	 */
	Map<Long, List<Attach>> findByTarget(Set<Long> toIds);
	
	/**
	 * 批量查询
	 * @param ids
	 * @return Map<attachId, List<Attach>>
	 */
	Map<Long, Attach> findByIds(Set<Long> ids);
	
	/**
	 * 添加附件
	 * @param album
	 * @return
	 */
	long add(Attach album);
	
	/**
	 * batch add
	 * @param albums
	 * @return last id
	 */
	long batchPost(long toId, List<Attach> albums);
	
	/**
	 * 删除文章附件
	 * @param toId
	 */
	void deleteByToId(long toId);

	void delete(long id);
}
