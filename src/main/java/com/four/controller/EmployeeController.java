package com.four.controller;


import com.four.domain.Employee;
import com.four.domain.Msg;
import com.four.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理CRUD请求
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;




    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value="pn", defaultValue = "1") Integer pn){
        //引入PageHelper 分页插件
        PageHelper.startPage(pn,5);
        List<Employee> emps =  employeeService.getAll();
        //将pageinfo交给页面,5连续显示页面
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo", page);
    }

//    /**
//     * 查询员工数据（分页查询）
//     * @return
//     */
//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value="pn", defaultValue = "1") Integer pn, Model model){
//
//        //引入PageHelper 分页插件
//        PageHelper.startPage(pn,5);
//        List<Employee> emps =  employeeService.getAll();
//        //将pageinfo交给页面,5连续显示页面
//        PageInfo pageInfo = new PageInfo(emps,5);
//        model.addAttribute("pageInfo", pageInfo);
//
//        return "list";
//    }
}
