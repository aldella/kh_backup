package com.morning.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.morning.biz.InventoryBiz;
import com.morning.biz.ProductBiz;
import com.morning.biz.SalesBiz;
import com.morning.domain.IamPortClient;
import com.morning.domain.Product;
import com.morning.domain.ProductVO;
import com.morning.domain.Sales;
import com.morning.domain.SalesVO;

@Controller
@RequestMapping("/sales/")
public class SalesController {
	
	private static final Logger log = LoggerFactory.getLogger(SalesController.class);
	
	@Autowired
	private SalesBiz salesService;
	
	@Autowired
	private ProductBiz productService;
	
	@Autowired
	private InventoryBiz inventoryService;

	@Autowired
	private HttpSession session;
	
	@GetMapping("salesList.do")
	public String getSalesList(Model model) {
		String id = (String) session.getAttribute("sid");
		List<Sales> list = salesService.getSalesList(id);
		List<SalesVO> list2 = new ArrayList<>();
		for(Sales sales : list) {
			SalesVO salesVO = new SalesVO();
			salesVO.setAddr(sales.getAddr());
			salesVO.setDelcom(sales.getDelcom());
			salesVO.setDelno(sales.getDelno());
			salesVO.setDelstatus(sales.getDelstatus());
			salesVO.setDeltel(sales.getDeltel());
			salesVO.setGtid(sales.getGtid());
			salesVO.setPaymethod(sales.getPaymethod());
			salesVO.setPaynum(sales.getPaynum());
			salesVO.setResdate(sales.getResdate());
			salesVO.setRname(sales.getRname());
			salesVO.setSt(sales.getSt());
			salesVO.setTel(sales.getTel());
			salesVO.setPno(sales.getPno());
			salesVO.setAmount(sales.getAmount());
			salesVO.setSno(sales.getSno());
			salesVO.setTot(sales.getTot());
			
			ProductVO pro = productService.getProduct(sales.getPno());
			salesVO.setPname(pro.getPname());
			salesVO.setCate(pro.getCate());
			salesVO.setCom(pro.getCom());
			salesVO.setImg(pro.getImg());
			salesVO.setImg2(pro.getImg2());
			salesVO.setImg3(pro.getImg3());
			
			list2.add(salesVO);
		}
		model.addAttribute("list", list2);
		return "sales/list";
	}

	@GetMapping("sales.do")
	public String getSales(@RequestParam("sno") int sno, Model model) {
		Sales sales = salesService.getSales(sno);
		model.addAttribute("dto", sales);
		model.addAttribute("product", salesService.getSales(sales.getPno()));
		return "sales/get";
	}
	
	@RequestMapping("inSales.do")
	public String insSales(@RequestParam("pno") int pno, Model model) {
		log.info("Before Sales");
		IamPortClient imPort = new IamPortClient(); 
		model.addAttribute("code", IamPortClient.CODE);
		model.addAttribute("key", IamPortClient.KEY);
		model.addAttribute("secret", IamPortClient.SECRET);
		model.addAttribute("gtid", imPort.getRandChar());
		model.addAttribute("product", productService.getProduct(pno));
		model.addAttribute("inventory", inventoryService.getInventory(pno));
		log.info("After Sales");
		return "sales/insert";
	}
	
	@PostMapping("inSalesPro.do")
	public String insSalesPro(Sales sales, Model model) {
		salesService.insSales(sales);
		return "redirect:/product/listAll.do";
	}
	
	@GetMapping("upSales.do")
	public String upSales(@RequestParam("sno") int sno, Model model) {
		model.addAttribute("dto", salesService.getSales(sno));
		return "sales/edit";
	}
	
	@PostMapping("upSalesPro.do")
	public String upSalesPro(Sales sales, Model model) {
		salesService.upSales(sales);
		return "redirect:salesList.do";
	}
}
