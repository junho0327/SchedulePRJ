package poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalenderController {
	
	@RequestMapping(value="index")
	public String Calender() {
		return "index";
	}
}