package com.testXA.demo;

import com.testXA.demo.dao.OrderDao;
import com.testXA.demo.entity.Order;
import com.testXA.demo.service.IOrderService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
class DemoApplicationTests {

	@Autowired
	private IOrderService iOrderService;
	@Test
	void contextLoads() {
		Order order = new Order();
		order.setOrder_no(12142312316L);
		order.setOrder_time(41804123123L);
		iOrderService.saveOrder(order);
	}

}
