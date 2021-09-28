package com.testXA.demo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "tb_order")
public class Order {
    private Long order_no;
    private Long order_time;
}
