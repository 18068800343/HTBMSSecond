package hs.bm.constant;

import java.util.Random;

public class ThreadLocalTest implements Runnable{
    //创建一个线程局部变量
    ThreadLocal<Student> studentThreadLocal=new ThreadLocal<Student>();

    @Override
    public void run() {
        //获取当前线程的名字
        String currentThreadName=Thread.currentThread().getName();
        System.out.println(currentThreadName+" is running ....");
        
        //随机生成一个整数
        Random random=new Random();
        int age=random.nextInt(100);
        
        System.out.println(currentThreadName+" is set age:"+age);
        //通过这个方法为每一个线程都设置一个独立的student对象
        Student student=getStudent();
        student.setAge(age);
        
        System.out.println(currentThreadName+" is first get age:"+student.getAge());
        
        //线程沉睡
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        //线程第二次获取年纪
        System.out.println(currentThreadName+" is second get age:"+student.getAge());
    }

    private Student getStudent() {
        //先获取studnet对象
        Student student=studentThreadLocal.get();
        //判断对象是否为空,是空的话表示没有给局部变量设置,如果是空的话就在给局部变量重新设置一个值
        if(student==null) {
            student=new Student();
            studentThreadLocal.set(student);
        }
        return student;
    }
    
    
    public static void main(String[] args) {
        ThreadLocalTest test=new ThreadLocalTest();
        
        Thread t1=new Thread(test,"线程1");
        Thread t2=new Thread(test,"线程2");
        
        t1.start();
        t2.start();
    }
    
    
}
class Student{
    int age;
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age=age;
    }
}
