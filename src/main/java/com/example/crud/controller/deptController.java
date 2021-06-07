package com.example.crud.controller;


import com.example.crud.bean.Department;
import com.example.crud.bean.Msg;
import com.example.crud.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class deptController {

    @Autowired
    DeptService deptService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getdepts(){
        List<Department> depts = deptService.getAll();

        return    Msg.success().add("depts",depts);

    }
}
