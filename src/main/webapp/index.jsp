<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>


<head>
    <title>员工列表页面</title>
</head>
<body>

<%--员工添加模态框 --%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addempform">
                        <div class="form-group">
                                <label for="inputempNAme" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="empName" id="inputempNAme" placeholder="empName">
                                <span id="empNamehelp" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control"  name="email" id="inputEmail" placeholder="Email">
                                <span id="emailhelp" class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender01" value="M" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender02" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">department</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId"  id="selectdept">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="empSave">保存</button>
            </div>
        </div>
    </div>
</div>

<%--员工修改模态框--%>
<div class="modal fade" id="myeditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="editempform">
                    <div class="form-group">
                        <label for="inputempNAme" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p  class="form-control-static"  id="editempNAme" ></p>
                            <span id="deitNamehelp" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control"  name="email" id="editEmail" placeholder="Email">
                            <span id="edithelp" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender03" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender04" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId"  id="editselectdept">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="empedit">修改</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--第一行 标题列--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--第二行 新增和删除按钮--%>
    <div class="row">
        <div class="col-md-offset-9">
            <button class="btn btn-primary" id="newEmployee">新增</button>
            <button class="btn btn-danger" id="deleteAll">删除</button>

        </div>
    </div>
    <%--第三行 显示表格数据 --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="checkAll">
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>depName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody >

                </tbody>

            </table>
        </div>
    </div>
        <%--第四行 显示提示信息和跳转条--%>
    <div class="row">
        <div class="col-md-4">
            <span id="table_info">

            </span>
            <div class="col-sm-3">
                <div class="input-group">
                    <input type="text" class="input-sm"   id="topagenum"  placeholder="跳转到">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default btn-sm " id="topagebt">GO!</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-8">
            <nav aria-label="Page navigation" id="nav">


            </nav>
        </div>
    </div>

</div>


<script type="text/javascript">
    //保存标志位
     var saveflagempName=false;
    var saveflagemail=false;
    //更新标志位
    var updateflagemail = false;
    //当前页面
    var  current = 1;
    //200默认是已被占用 100是未被占用
    var code;

    //入口函数
   $(function() {
       //去首页的第一页
       topage(1);
   });

   //抽取出来的ajax请求
   function  topage(pn){
        //先把一些状态给清空
       //先把全选按钮选中状态取消
       $("#checkAll").prop("checked",false);

       $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function(result) {
                //当前页
                current=result.extend.pageInfo.pageNum;
              /*console.log(result);*/
                //解析并显示员工数据
                build_emps_teble(result);
                //解析并显示分页信息
                build_page_info(result);
                //显示分页条数据
                build_page_nave(result);
            }

        });
   }

   //tbody显示信息
   function build_emps_teble(result){
       //先进行清空上一次的数据
       $("#table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){

            /*我发现在给写部门为空的话会显示错误  然后一页五个都会不显示  这个可能会被找出破绽  这个需要解决  有地段为空的话就会
             所以可以判断一下是否为空*/

            var checkbox = $("<td><input type='checkbox' class='check_item'/></td>")
            var empId  = $("<td></td>").append(item.empId);
            var empName =$("<td></td>").append(item.empName);
            var gender  = $("<td></td>").append(item.gender=="M"?"男":"女");
            var email =  $("<td></td>").append(item.email);
            var deptName = $("<td></td>").append(item.department.deptName);
            var editbutton = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" ").append("修改").attr("edit_id",item.empId);  //修改按钮上绑定的id的值是用来获取员工信息和提交员工信息
            var deletebutton = $("<button></button>").addClass("btn btn-danger btn-sm delete_bt").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" ").append("删除").attr("dele_id",item.empId);
            var button = $("<td></td>").append(editbutton).append(" ").append(deletebutton);
//           qppend方法执行完成之后还是返回原来的元素
            $("<tr></tr>").append(checkbox).append(empId).append(empName).append(gender).append(email).append(deptName).append(button).appendTo("#table tbody");

        });
   }

   //显示页数信息
   function  build_page_info(result){
       //先把上个页面的信息清空
       $("#table_info").empty();
       $("#table_info").append("当前第"+result.extend.pageInfo.pageNum+"页,共"+result.extend.pageInfo.pages+"页,共"+result.extend.pageInfo.total+"条数据").attr("pages",result.extend.pageInfo.pages);
   }

   //分页栏跳转
   function build_page_nave(result){
        $("#nav").empty();
       var ul =$("<ul></ul>").addClass("pagination");
       var  firstpageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("首页"));
       var  prepageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("&laquo;"));

       if(result.extend.pageInfo.hasPreviousPage==false){
           firstpageLi.addClass("disabled");
           prepageLi.addClass("disabled");
       }else{
           //设置上一页下一页的请求
              firstpageLi.click(function (){ topage(1)});
              prepageLi.click(function (){ topage(result.extend.pageInfo.prePage)});
       }
       ul.append(firstpageLi).append(prepageLi);
       $.each(result.extend.pageInfo.navigatepageNums,function (index,item){

           if (item==result.extend.pageInfo.pageNum){
               var li  = $("<li></li>").append($("<a></a>").attr("href","#").append(item)).addClass("active");
           }else{
               var li  = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
           }
           //发送去哪一页的ajax请求
           li.click(function (){
               topage(item);
           })
           ul.append(li);
       })
       var  nextpageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("&raquo;"));
       var  lastpageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<span></span>").append("尾页"));
       if(result.extend.pageInfo.hasNextPage==false){
           nextpageLi.addClass("disabled");
           lastpageLi.addClass("disabled");
       }else{
            //设置首页尾页的请求
           nextpageLi.click(function (){ topage(result.extend.pageInfo.nextPage)});
           lastpageLi.click(function (){ topage(result.extend.pageInfo.pages)});
       }
       ul.append(nextpageLi).append(lastpageLi).appendTo($("#nav"));
   }


   //新建employee点击
   $("#newEmployee").click(function (){

       //先把上一次在表单里的数据清除
       $("#myModal form")[0].reset();
       //弹出模态框之前先把部门信息获取出来 每次弹窗之前都要获取一次   传入模态窗的的部门id
       getdept($("#selectdept"));
       $("#myModal").modal({
           backdrop:"static"
       })


       //先把上一次校验的提示信息或者效果清空
       $("#inputempNAme").parent().removeClass("has-error has-success");
       $("#empNamehelp").empty();
       $("#inputEmail").parent().removeClass("has-error has-success");
       $("#emailhelp").empty();

   })

    //获取部门信息
    function getdept(ele){

       //先清空控件的数据
       ele.empty();

       $.ajax({
          url: "${APP_PATH}/depts",
           type: "GET",
           success:function (result){
               $("#selectdept").empty();
              $.each(result.extend.depts,function (){

                  var deptid  = $("<option></option>").attr("value",this.deptId).append(this.deptName);
                  ele.append(deptid);
              })

              /*{"code":100,"msg":"处理成功","extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}*/
           }
       });
    }

    //保存新建用户信息
    $("#empSave").click(function (){
        //在保存员工信息之前首先进行数据校验  应该是在离焦校验  而不应该在这里校验 saveflagemail和saveflagempName是前端校验成功标志位
            if (saveflagempName && saveflagemail){
                //发送post请求
                $.ajax({
                    url: "${APP_PATH}/emp",
                    type:"POST",
                    data:$("#addempform").serializeArray(),
                    success:function (result){
                        //先判断返回状态码是否是成功 因为加入了后端校验   所以耦合度有点高  前端校验是使用的离焦自动检测  后端使用离焦对服务器的负荷就有点大
                        if (result.code==100){
                            //先关闭这个弹窗
                            $('#myModal').modal('hide')
                            //再直接跳转到最后一页  直接写死是最后一页
                            topage(999999);
                        }else{
                            //显示后端返回的错误信息  其实应该和前端校验信息抽取出来合在一起的
                            showError(result);
                        }
                    }
                });
            }else{
                return false;
            }
    })

    //检查用户名是否可用

    function  checkuser(username){
       $.ajax({
          url:"${APP_PATH}/checkuser",
           type:"get",
           data:"empName="+username,
           success:function (result){
              code  = result.code;
           }
       });

    }

    //显示后端返回的错误信息
    function  showError(result){
        //先把上一次校验的提示信息或者效果清空
        $("#inputempNAme").parent().removeClass("has-error has-success");
        $("#empNamehelp").empty();
        $("#inputEmail").parent().removeClass("has-error has-success");
        $("#emailhelp").empty();

        //用户经过了前端的校验数据到达后端是不通过的   显示失败信息  这个验证信息防小人 肯定是搭配前端用
        if (result.extend.errorFileds.empName!=undefined){
            //显示empname的错误信息
            $("#inputempNAme").parent().addClass("has-error");
            $("#empNamehelp").append("用户名可以是2-5位中文或者6-16位英文的组合");
        }
        if (result.extend.errorFileds.email!=undefined){
            //显示email的错误信息
            $("#inputEmail").parent().addClass("has-error");
            $("#emailhelp").append("不符合邮箱规范");
        }
    }


    //离焦进行校验empname  保存
    $("#inputempNAme").blur(function (){

        //先把上一次校验的提示信息或者效果清空
        $("#inputempNAme").parent().removeClass("has-error has-success");
        $("#empNamehelp").empty();
        //拿到需要校验的数据  使用正则表达式进行校验
        var empName= $("#inputempNAme").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            $("#inputempNAme").parent().addClass("has-error");
            $("#empNamehelp").append("用户名可以是2-5位中文或者6-16位英文的组合");
            saveflagempName=false;
            return false;
        } else{

            //检查用户名是否可用
            checkuser(empName);
            if(code != 100){
                $("#inputempNAme").parent().addClass("has-error");
                $("#empNamehelp").append("用户名已被占用");

                saveflagempName=false;
                return false;
            }else{
            $("#inputempNAme").parent().addClass("has-success");
            $("#empNamehelp").append("姓名可用");

            saveflagempName=true;
            return  true;
            }
        };
    });

    //离焦进行校验email  保存
    $("#inputEmail").blur(function (){

        //先把上一次校验的提示信息或者效果清空
        $("#inputEmail").parent().removeClass("has-error has-success");
        $("#emailhelp").empty();

        //校验邮箱
        var email  = $("#inputEmail").val();
        var regemail= /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if(!regemail.test(email)){
            $("#inputEmail").parent().addClass("has-error");
            $("#emailhelp").append("不符合邮箱规范");
            saveflagemail=false;
            return  false;
        }else{
            $("#inputEmail").parent().addClass("has-success");
            $("#emailhelp").append("符合邮箱规范");
            saveflagemail=true;
            return  true;
        }
    });

    //离焦进行校验email  更新
    $("#editEmail").blur(function (){

        //先把上一次校验的提示信息或者效果清空
        $("#editEmail").parent().removeClass("has-error has-success");
        $("#edithelp").empty();

        //校验邮箱
        var email  = $("#editEmail").val();
        var regemail= /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if(!regemail.test(email)){
            $("#editEmail").parent().addClass("has-error");
            $("#edithelp").append("不符合邮箱规范");
            updateflagemail=false;
            return  false;
        }else{
            $("#editEmail").parent().addClass("has-success");
            $("#edithelp").append("符合邮箱规范");
            updateflagemail=true;
            return  true;
        }
    });

    //弹出修改模态框
    $(document).on("click",".edit_btn",function (){

        //先把上次的模态框错误提示信息清空
        $("#editEmail").parent().removeClass("has-error has-success");
        $("#edithelp").empty();
        //查出部门信息 并绑定到修改模态窗的部门选择器上
        getdept($("#editselectdept"));
        //先查出员工信息   获取员工id我们可以给修改按钮绑上一个自定义的属性  属性里面是id值
        getEmp($(this).attr("edit_id"));
        //把员工的id传递给模态框的更新按钮
        $("#empedit").attr("edit_id",$(this).attr("edit_id"));

        $("#myeditModal").modal({
            backdrop:"static"
        });
    })

    //查员工信息
    function  getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result){

                //回显信息
                var emp =  result.extend.emp;
                $("#editempNAme").text(emp.empName);
                $("#editEmail").val(emp.email);
                $("#myeditModal input[name=gender]").val([emp.gender]);
                $("#myeditModal select").val([emp.dId]);
            }
        })
    }


    //点击更新 更新员工信息
    $("#empedit").click(function (){
        //离焦判断是否符合邮箱规范再进行发送请求
       if(updateflagemail){
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
                type:"PUT",
                data:$("#editempform").serialize(),
                success:function(result){
                    if (result.code == 100){
                        //关闭模态框
                        $("#myeditModal").modal('hide');
                        //成功以后先跳转到指定的页面
                        topage(current);
                    }else {
                        alert("修改失败哦！！！");
                    }
                    }
            })


       }else{
           return false;
       }
    })

    //发送删除请求
    $(document).on("click",".delete_bt",function (){
        //弹出是否确认删除对话框
        var empname   = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除【"+empname+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("dele_id"),
                type:"DELETE",
                success:function (result){

                    //跳转到当前页面
                    topage(current);
                }
            })
        }
    })

    //全选全不选
    $("#checkAll").click(function (){
        //属性为check_item的选中属性的值就是id为checkAll是否选中的值
        $(".check_item").prop("checked",$(this).prop("checked"));

    })

    //给所有的单选框绑定事件
    $(document).on("click",".check_item",function (){
        $("#checkAll")
        //判断当前选中的值是不是页面上有的单选框的个数
       var checkedflag   = $(".check_item:checked").length==$(".check_item").length;
       $("#checkAll").prop("checked",checkedflag);
    })

    //全选点击事件
     $("#deleteAll").click(function (){
         var empNames="";
         var del_ids = "";
         $.each($(".check_item:checked"),function (){
          empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
          del_ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
         })
         empNames.substring(0,empNames.length-1);
         del_ids.substring(0,del_ids.length-1);
         if (confirm("确认删除【"+empNames+"】吗？")){
             $.ajax({
                 url:"${APP_PATH}/emp/"+del_ids,
                 type:"DELETE",
                 success:function (result){

                     //跳转到当前页面
                     topage(current);
                 }

             })
         }

     })

    //跳转到指定页面点击
    $("#topagebt").click(function (){

        var reg=/^\d{1,10}$/;
        //要跳转的页码   输入框获取的都是string类型的
        var pagenum = parseInt($("#topagenum").val());
        //总页码
        var pages  =parseInt($("#table_info").attr("pages"));
        //校验不通过  包括有除数字外的其他字符或者无输入
        if (!reg.test(($("#topagenum").val()))){
            alert("你输入的页码有误");
            $("#topagenum").val("");
        } else if(pagenum > pages){
            alert("你输入的页码过大,请重新输入");
            $("#topagenum").val("");
        }else {
            topage(pagenum);
        }
    })

    //跳转页面输入框按回车
    $("#topagenum").keydown(function (event){
        if(event.keyCode==13){
            $("#topagebt").click();
        }
    })
/*
*
* 待改进的地方  显示前端校验错误信息和后端校验错误信息可以抽取出来一个方法
* 我把前端后端提示信息写在两个方法里面了
*
*
* 用attr来传递id
*
*
*
*
*
*
* */


</script>


</body>


</html>
