package kr.co.sist.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.domain.Menu;
import kr.co.sist.domain.MenuInfo;
import kr.co.sist.service.MenuService;

@Controller
public class MenuController {

	@RequestMapping(value="menu/menu.do", method=GET)
	public String searchMenu(@RequestParam(required=false,defaultValue="커피") String categoryName, Model model) {
		
		MenuService ms=new MenuService();
		List<Menu> list=ms.searchMenu(categoryName);
		model.addAttribute("menuData",list);
		
		return "menu/menu";
	}//searchMenu
	
	@RequestMapping(value="menu/menu_detail.do", method=GET)
	public String searchDetail(@RequestParam(required=false,defaultValue="에스프레소") String gdName, Model model) {
		
		MenuService ms=new MenuService();
		List<MenuInfo> menuInfoList=ms.showMenuDetail(gdName);		
		model.addAttribute("menuInfoData",menuInfoList);
		
		//List<String> gdInfoList=ms.gdInfo(menuInfoList);
		//model.addAttribute("gdInfoData", gdInfoList);
		
		return "menu/menu_detail";
	}//searchMenu
	
}//class
