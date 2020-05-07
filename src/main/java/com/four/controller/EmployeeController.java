package com.four.controller;


import com.four.domain.Employee;
import com.four.domain.Msg;
import com.four.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理CRUD请求
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;


    /**
     * 员工删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids") String  ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> del_ids = new ArrayList<>();
            for (String string:str_ids) {
                del_ids.add(Integer.parseInt(string)) ;
            }
            employeeService.deleteBatch(del_ids);
        }else{
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }
        return Msg.success();

    }



    /**
     * 修改员工
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){

        employeeService.updateEmp(employee);
        return Msg.success();
    }






    /**
     * 按员工id查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee =  employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * 检验是否已有用户
     * @param empName
     * @return
     */

    @ResponseBody
    @RequestMapping("/checkUser")
    public Msg checkUser(@RequestParam("empName")   String empName){

        String regx =  "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是6-16位数字和字母组合或2-5中文");
        }

        Boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }


    /**
     * /emp post请求为保存
     * @return
     */

    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){

        if(result.hasErrors()){
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError: errors) {
                System.out.println("错误字段名"+fieldError.getField());
                System.out.println("错误信息"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }


    }





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
