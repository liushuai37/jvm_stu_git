package service;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.Transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class TestConnection {
    public static void main(String[] args) {
//        Jedis jedis = new Jedis("8.131.50.19",6379);
//        String pong = jedis.ping();
//        System.out.println(pong);
//        Set<String> keys = jedis.keys("*");
//        for (String keyItem:keys) {
//            System.out.println("keyItem:"+keyItem);
//        }
//        Map<String,String> hash = new HashMap(5);
//        hash.put("h1","1");
//        hash.put("h2","2");
//        hash.put("h3","3");
//        hash.put("h4","4");
//        hash.put("h5","5");
//        jedis.hmset("hash1",hash);
//        Map<String, String> hash1 = jedis.hgetAll("hash1");
//        for (Map.Entry<String, String> stringStringEntry : hash1.entrySet()) {
//            System.out.println(stringStringEntry.getKey()+"--"+stringStringEntry.getValue());
//        }
        //开启redis监听
//        String k1 = jedis.watch("k1");
//        //开启redis事务
//        Transaction multi = jedis.multi();
//        //向事务内添加操作
//        multi.decr(k1);
//        //执行事务
//        List<Object> execResult = multi.exec();
//        if(null == execResult ||execResult.isEmpty()){
//            System.out.println("redis监听事务执行失败");
//        }
//        for (Object objectItem : execResult) {
//            System.out.println(String.valueOf(objectItem));
//        }
//        jedis.close();

        HostAndPort hostAndPort = new HostAndPort("8.131.50.19",6379);
        JedisCluster jedisCluster = new JedisCluster(hostAndPort);
//        String set = jedisCluster.set("k2", "v2");
        String k2 = jedisCluster.get("k1");
        System.out.println("k1-----"+k2);
//        jedisCluster.close();
    }
}
