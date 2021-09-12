package shop.awesomejump.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONArray;
import shop.awesomejump.domain.CategoryDTO;
import shop.awesomejump.service.ICategoryDAO;

@Controller
public class CategoryController {

   // 상품 등록 카테고리 출력
    @Inject 
    private ICategoryDAO categoryDao;
    
    private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

    @RequestMapping(value="/insertProduct", method=RequestMethod.GET)
    public void selectCategory(Model model) throws Exception {
      logger.info("selectCategory GET !! ");
      
      List<CategoryDTO> category = null;
      category = categoryDao.category();
      
      model.addAttribute("category", JSONArray.fromObject(category));
    }

   
   
}