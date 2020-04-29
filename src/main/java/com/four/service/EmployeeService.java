package com.four.service;

import com.four.domain.Employee;
import com.four.dao.EmployeeMapper;
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
}
