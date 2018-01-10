/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.web.controller.admin;

import mblog.base.data.Data;
import mblog.base.lang.Consts;
import mblog.core.data.Group;
import mblog.core.persist.service.GroupService;
import mblog.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author langhsu
 *
 */
@Controller("mng_group_ctl")
@RequestMapping("/admin/group")
public class GroupController extends BaseController {
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/list")
	public String list(ModelMap model) {
		model.put("list", groupService.findAll(Consts.IGNORE));
		return "/admin/group/list";
	}
	
	@RequestMapping("/view")
	public String view(Integer id, ModelMap model) {
		if (id != null) {
			Group view = groupService.getById(id);
			model.put("view", view);
		}
		return "/admin/group/view";
	}
	
	@RequestMapping("/update")
	public String update(Group view) {
		if (view != null) {
			groupService.update(view);
		}
		return "redirect:/admin/group/list";
	}
	
	@RequestMapping("/delete")
	public @ResponseBody Data delete(Integer id) {
		Data data = Data.failure("操作失败");
		if (id != null) {
			try {
				groupService.delete(id);
				data = Data.success("操作成功", Data.NOOP);
			} catch (Exception e) {
				data = Data.failure(e.getMessage());
			}
		}
		return data;
	}
	
}
