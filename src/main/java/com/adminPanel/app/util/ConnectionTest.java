package com.adminPanel.app.util;

import org.hibernate.Session;

import org.hibernate.SessionFactory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ConnectionTest {

    public static void main(String[] args) {
        try {

            ApplicationContext context = new ClassPathXmlApplicationContext("application-context.xml");

            SessionFactory sessionFactory = context.getBean("sessionFactory",SessionFactory.class);
            System.out.println("open Hibernate session");
            Session session = sessionFactory.openSession();

            if (session != null) {
                System.out.println("connection to database success");
            }
            session.close();
            System.out.println("connection to database closed ");

        } catch (Exception e) {
            System.out.println(" Could not connect to database");
            e.printStackTrace();
        }
//


    }
}
