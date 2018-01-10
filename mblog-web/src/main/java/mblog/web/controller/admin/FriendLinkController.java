package mblog.web.controller.admin;

import mblog.core.data.FriendLink;
import mblog.core.persist.service.FriendLinkService;
import mblog.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author Beldon
 */
@Controller("mng_friend_link_ctl")
@RequestMapping("/admin/friendLink")
public class FriendLinkController extends BaseController {

    @Autowired
    private FriendLinkService friendLinkService;

    @RequestMapping("/list")
    public String list(ModelMap model) {
        List<FriendLink> list = friendLinkService.findAll();
        model.put("list", list);
        return "/admin/friendLink/list";
    }

    @RequestMapping("/delete")
    public String delete(Long id){
        friendLinkService.delete(id);
        return "redirect:/admin/friendLink/list";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam(value = "id",required = false,defaultValue = "0") long id, Model model) {
        if (id != 0) {
            FriendLink friendLink = friendLinkService.findById(id);
            model.addAttribute("friendLink", friendLink);
        }
        return "/admin/friendLink/edit";
    }

    @RequestMapping("/save")
//    @ResponseBody
    public String save(@ModelAttribute(value = "friendLink") FriendLink friendLink) {
//        if (friendLink == null || friendLink.getSiteName() == null) {
//            return Data.failure(-1, "请输入友情链接站点名称");
//        }
        try {
            friendLinkService.save(friendLink);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/friendLink/list";
    }
}
