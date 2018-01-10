/**
 *
 */
package mblog.template.directive;

import mblog.base.lang.Consts;
import mblog.core.biz.PostBiz;
import mblog.core.data.Post;
import mblog.template.DirectiveHandler;
import mblog.template.TemplateDirective;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

/**
 * 文章内容查询
 *
 * 示例：
 * 	请求：http://mtons.com/index?ord=newest&pn=2
 *  使用：#contents(groupId, 'paging')
 *  解析： ord, pn 等参数从request中获取 , groupId 从标签中获取
 *
 * @author langhsu
 *
 */
@Component
public class ContentsDirective extends TemplateDirective {
	@Autowired
    private PostBiz postPlanet;

    @Override
    public String getName() {
        return "contents";
    }

    @Override
    public void execute(DirectiveHandler handler) throws Exception {
        Integer pn = handler.getInteger("pn", 1);
        Integer group = handler.getInteger("group", 0);
        String order = handler.getString("ord", Consts.order.NEWEST);

        Pageable pageable = new PageRequest(pn - 1, 10);
        Page<Post> result = postPlanet.paging(pageable, group, order);

        handler.put(RESULTS, result).render();
    }
}
