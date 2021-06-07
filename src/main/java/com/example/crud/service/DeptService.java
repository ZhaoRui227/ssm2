package com.example.crud.service;

import com.example.crud.bean.Department;
import com.example.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department>  getAll(){
        return  departmentMapper.selectByExample(null);
    }


}
