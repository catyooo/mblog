package mblog.core.persist.dao;

import mblog.core.persist.entity.FriendLinkPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @author Beldon
 */
public interface FriendLinkDao extends JpaRepository<FriendLinkPO, Long>, JpaSpecificationExecutor<FriendLinkPO> {
    List<FriendLinkPO> findAllByOrderBySortDesc();
}
