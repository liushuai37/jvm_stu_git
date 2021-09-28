package com.testXA.demo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.testXA.demo.entity.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDao extends BaseMapper<Order> {
}

