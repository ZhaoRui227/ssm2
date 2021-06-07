package com.example.crud.bean;

import com.github.pagehelper.PageInfo;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Msg {

    //状态码
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String,Object> extend =  new HashMap<String,Object>();

    public  static  Msg success(){
        Msg result  =  new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }



    public  static  Msg fail(){
        Msg result  =  new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    /*想要进行链式添加 这个地方返回的还是Msg*/
    public Msg add(String key,Object value) {
        this.getExtend().put(key,value);
        return this;
    }
}
