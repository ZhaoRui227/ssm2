package com.example.crud.service;

import com.example.crud.bean.Employee;
import com.example.crud.bean.EmployeeExample;
import com.example.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;



    public List<Employee> getAll() {

        return  employeeMapper.selectByExampleWithDept(null);

    }


    public int saveemp(Employee employee) {
        int i = employeeMapper.insertSelective(employee);
        return i;
    }

    public  boolean checkusername(String username){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(username);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /*按照员工id查询*/
    public  Employee getEmp(Integer id){

        //调用按照主键查询
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    //更新员工信息
    public  void  updateEmp(Employee employee){
        //按照主键有选择的更新
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    //员工删除
    public  void  deleteEmp(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    //批量删除
    public  void deletebatch(List<Integer>ids){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);

          employeeMapper.deleteByExample(employeeExample);

    }
}
