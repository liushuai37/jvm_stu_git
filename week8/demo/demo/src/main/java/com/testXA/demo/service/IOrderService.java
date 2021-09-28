package com.testXA.demo.service;

import com.testXA.demo.entity.Order;

public interface IOrderService {
    void saveOrder(Order order);

    void updateOrder(Order order);

    void deleteOrder(Order order);

    Order selectOrderById(Order order);
}
