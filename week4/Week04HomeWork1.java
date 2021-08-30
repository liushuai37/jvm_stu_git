package com.jvm.stu;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;

public class Week04HomeWork1 {
    public static void main(String[] args) {

        long start=System.currentTimeMillis();
        // 在这里创建一个线程或线程池，
        ExecutorService executorService = Executors.newCachedThreadPool();
        // 异步执行 下面方法
        //1.方法1
        Future<Integer> submit = executorService.submit(new Callable<Integer>() {
            @Override
            public Integer call() throws Exception {
                return Week04HomeWork1.sum();
            }
        });
        executorService.shutdown();
        try {
            int result = submit.get();
            // 确保  拿到result 并输出
            System.out.println("异步计算结果为："+result);
            System.out.println("使用时间："+ (System.currentTimeMillis()-start) + " ms");
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        // 然后退出main线程
        System.exit(0);
    }

    private static int sum() {
        return fibo(13);
    }

    private static int fibo(int a) {
        if ( a < 2)
            return 1;
        return fibo(a-1) + fibo(a-2);
    }
}
