package com.example.test;

import com.example.crud.bean.Department;
import com.example.crud.bean.Employee;
import com.example.crud.dao.DepartmentMapper;
import com.example.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/*先导入单元测试的包*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class mappertest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public  void testCRUD(){

        System.out.println(departmentMapper);
       /* departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));*/

        //测试插入员工数据
        /*employeeMapper.insertSelective(new Employee(null,"jerry","","jerry.com",1));*/
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i=0;i<10000;i++){
            String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,uuid,"M",uuid+".@com",1));
        }
        System.out.println("批量完成");
    }

}
