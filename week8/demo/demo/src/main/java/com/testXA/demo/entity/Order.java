package com.testXA.demo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName(value = "tb_order")
public class Order implements Serializable {
    private Long order_no;
    private Long order_time;
}
