package mblog.core.persist.service;

import mblog.core.data.FriendLink;

import java.util.List;

/**
 * @author Beldon
 */
public interface FriendLinkService {

    void save(FriendLink friendLink);

    void delete(long id);

    FriendLink findById(long id);

    List<FriendLink> findAll();
}
