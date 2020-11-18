package com.spring.view;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.biz.SampleService;

@Controller
public class SampleController2 {
	@Resource(name = "sampleService")
	SampleService sampleService;
	
	@RequestMapping(value = "/sample2.do")
	public String manageBuy() {
		return "sample/sample";
	}
	
}










