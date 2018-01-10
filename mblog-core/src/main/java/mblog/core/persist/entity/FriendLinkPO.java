package mblog.core.persist.entity;

import javax.persistence.*;

/**
 * 友情链接
 * @author Beldon
 */
@Entity
@Table(name = "mto_friend_link")
public class FriendLinkPO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    /**
     * 站点名称
     */
    @Column(name = "site_name", nullable = false)
    private String siteName;

    /**
     * 站点链接
     */
    @Column(name = "url", nullable = false)
    private String url;

    /**
     * 站点备注，title文字描述
     */
    private String remark;

    /**
     * 站点logo
     */
    private String logo;

    /**
     * 排序
     */
    private int sort;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }
}
