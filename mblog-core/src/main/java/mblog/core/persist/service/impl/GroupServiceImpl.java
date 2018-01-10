/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.core.persist.service.impl;

import java.util.ArrayList;
import java.util.List;

import mblog.base.lang.Consts;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mblog.core.data.Group;
import mblog.core.persist.dao.GroupDao;
import mblog.core.persist.entity.GroupPO;
import mblog.core.persist.service.GroupService;
import mblog.core.persist.utils.BeanMapUtils;

/**
 * @author langhsu
 *
 */
@Service
@Transactional(readOnly = true)
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao groupDao;

	@Override
	public List<Group> findAll(int status) {
		List<GroupPO> list;
		if (status > Consts.IGNORE) {
			list = groupDao.findAllByStatus(status);
		} else {
			list = groupDao.findAll();
		}
		List<Group> rets = new ArrayList<>();
		list.forEach(po -> rets.add(BeanMapUtils.copy(po)));
		return rets;
	}

	@Override
	@Cacheable(value = "groupsCaches", key = "'g_' + #id")
	public Group getById(int id) {
		return BeanMapUtils.copy(groupDao.findOne(id));
	}

	@Override
	@Cacheable(value = "groupsCaches", key = "'g_' + #key")
	public Group getByKey(String key) {
		return BeanMapUtils.copy(groupDao.findByKey(key));
	}

	@Override
	@Transactional
	public void update(Group group) {
		GroupPO po = groupDao.findOne(group.getId());
		if (po != null) {
			BeanUtils.copyProperties(group, po);
		} else {
			po = new GroupPO();
			BeanUtils.copyProperties(group, po);
			groupDao.save(po);
		}
	}

	@Override
	@Transactional
	public void delete(int id) {
		groupDao.delete(id);
	}

}
