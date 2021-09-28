package com.testXA.demo.service.impl;

import com.testXA.demo.dao.OrderDao;
import com.testXA.demo.entity.Order;
import com.testXA.demo.service.IOrderService;
import org.apache.shardingsphere.transaction.annotation.ShardingTransactionType;
import org.apache.shardingsphere.transaction.core.TransactionType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderDao orderDao;

    @Transactional
    @ShardingTransactionType(TransactionType.XA)
    @Override
    public void saveOrder(Order order) {
        int insertNum = orderDao.insert(order);
        System.out.println("插入成功"+insertNum);
    }
}
