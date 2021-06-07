package com.example.crud.controller;

import com.example.crud.bean.Employee;
import com.example.crud.bean.Msg;
import com.example.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class employeeController {


    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/emp" ,method = RequestMethod.POST)
    @ResponseBody
    public Msg saveemp(@Valid Employee employee, BindingResult result){     //BindingResult携带的是校验失败或者成功的信息

        //如果后端验证有错误  返回错误信息发送到前台
        if (result.hasErrors()){
            Map<String,Object> map  = new HashMap<>();
            //返回失败，在模态框中显示错误信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError:fieldErrors){
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFileds",map);
        }else{
            int i = employeeService.saveemp(employee);
            return Msg.success().add("saveFlag",i);
        }

    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //引入分页查询
        //传入页码以及每页的大小
        PageHelper.startPage(pn,5);
        //startpage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps =  employeeService.getAll();

        //使用pageInfo包装查询的结果   连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);
    }


    //检查用户名是否可用
    @ResponseBody
    @RequestMapping("/checkuser")
    public  Msg checkusername(@RequestParam("empName") String username){
        boolean check = employeeService.checkusername(username);
        if(check){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }


    //按照id查询信息
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public  Msg getEmp(@PathVariable("id") Integer id){

       Employee employee=  employeeService.getEmp(id);
       return Msg.success().add("emp",employee);
    }


    //更新员工信息
/*
如果直接发送ajax=put的请求    tomact是收不到这个数据的
可以配置一个springmvc支持的拦截器  HttpPutFormContentFilter

* */
    @ResponseBody    //请求路径上的参数只要与bean的名字一样也是可以封装到数据传过来的参数里面
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public  Msg  updateEmp(Employee employee){


        employeeService.updateEmp(employee);
        return Msg.success();

    }


    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public  Msg delete(@PathVariable("ids")String ids){

        if (ids.contains("-")){

            List<Integer> del_ids =  new ArrayList<Integer>();

            String[] split = ids.split("-");
            for (String string :split){
                del_ids.add(Integer.parseInt(string));
            }
            employeeService.deletebatch(del_ids);
            return Msg.success();
        }else{
            employeeService.deleteEmp(Integer.parseInt(ids));
            return Msg.success();
        }
    }

//这是用jsp展示页面  这个不注释是走到list.jsp页面的  也要把index.jsp改回来
/*    @RequestMapping("/emps")
    public  String  getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

      //引入分页查询
        //传入页码以及每页的大小
        PageHelper.startPage(pn,5);
        //startpage后面紧跟的这个查询就是一个分页查询
      List<Employee> emps =  employeeService.getAll();

      //使用pageInfo包装查询的结果   连续显示的页数
      PageInfo page = new PageInfo(emps,5);
      model.addAttribute("pageInfo",page);
        return  "list";
    }*/



}
