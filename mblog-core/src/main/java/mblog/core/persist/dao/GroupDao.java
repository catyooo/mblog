/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.persist.dao;

import mblog.core.persist.entity.GroupPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @author langhsu
 *
 */
public interface GroupDao extends JpaRepository<GroupPO, Integer>, JpaSpecificationExecutor<GroupPO> {
	List<GroupPO> findAllByStatus(int status);
	GroupPO findByKey(String key);
}
