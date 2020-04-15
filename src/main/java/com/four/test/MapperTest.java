package com.four.test;

import com.four.bean.Employee;
import com.four.dao.DepartmentMapper;
import com.four.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @ContextConfiguration spring测试
 */

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;


    @Test
    public void testCRUD(){
        //ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//        System.out.println(departmentMapper);
//
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));
//
//
//        employeeMapper.insertSelective(new Employee(null,"jerry","M","123@163.com",1));
//
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);

        for (int i = 11; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5);
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@163.com",1));

        }

    }
}
