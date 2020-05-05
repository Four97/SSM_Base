package com.four.service;

import com.four.dao.EmployeeMapper;
import com.four.domain.Employee;
import com.four.domain.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }


    public void saveEmp(Employee employee) {

        employeeMapper.insertSelective(employee);

    }


    public Boolean checkUser(String empName) {


        EmployeeExample emp = new EmployeeExample();
        EmployeeExample.Criteria criteria = emp.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(emp);

        return count==0;
    }
}
