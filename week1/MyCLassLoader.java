package com.jvm.stu;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class MyCLassLoader extends ClassLoader{
    //定义文件路径
    String filePath = "D:\\Hello.xlass";
    @Override
    public Class findClass(String name) {
        byte[] b = loadClassData(name);
        return defineClass(name, b, 0, b.length);
    }

    private byte[] loadClassData(String name) {
        // load the class data from the connection
        //包村还原字节码的buteBuffer
        ByteBuffer resultByteBuffer = ByteBuffer.allocate(1);
        try(RandomAccessFile randomAccessFile = new RandomAccessFile(filePath,"rw")){
            FileChannel channel = randomAccessFile.getChannel();
            ByteBuffer byteBuffer = ByteBuffer.allocate(1024*2);
            channel.read(byteBuffer);
            byteBuffer.flip();
            //根据读取文件大小的实际大小重新申请缓存
            resultByteBuffer = ByteBuffer.allocate(byteBuffer.limit());
            while (byteBuffer.hasRemaining()){
                //将转换后的字节码还原
                resultByteBuffer.put((byte) (255-byteBuffer.get()));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultByteBuffer.flip();
        return resultByteBuffer.array();
    }

    public static void main(String[] args) throws IllegalAccessException, InstantiationException, ClassNotFoundException, NoSuchMethodException, InvocationTargetException {
        Class helloClass = new MyCLassLoader().findClass("Hello");//通过自定义类加载器加载Hello
        Method helloMethod = helloClass.getDeclaredMethod("hello");//获取类的方法
        helloMethod.invoke(helloClass.newInstance(), args);//反射执行
    }
}
