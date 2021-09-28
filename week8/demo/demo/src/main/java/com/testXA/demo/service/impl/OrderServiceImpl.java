package com.testXA.demo.service.impl;

import com.testXA.demo.dao.OrderDao;
import com.testXA.demo.entity.Order;
import com.testXA.demo.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrder(Order order) {
        int insertNum = orderDao.insert(order);
        System.out.println("插入成功"+insertNum);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrder(Order order) {
        int insertNum = orderDao.updateById(order);
        System.out.println("更新成功"+insertNum);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrder(Order order) {
        int insertNum = orderDao.deleteById(order);
        System.out.println("删除成功"+insertNum);
    }

    @Override
    public Order selectOrderById(Order order) {
        return orderDao.selectById(order);
    }

}
