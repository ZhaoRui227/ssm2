<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<head>
    <title>员工列表页面</title>
</head>
<body>
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
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>

            </div>
        </div>
         <%--第三行 显示表格数据 --%>
        <div class="row">
            <div class="col-md-12">
                  <table class="table table-hover">
                      <tr>
                          <th>#</th>
                          <th>empName</th>
                          <th>gender</th>
                          <th>email</th>
                          <th>depName</th>
                          <th>操作</th>
                      </tr>
                      <c:forEach items="${pageInfo.list}" var="emp">
                      <tr>
                          <td>${emp.empId}</td>
                          <td>${emp.empName }</td>
                          <td>${emp.gender=="M"?"男":"女" }</td>
                          <td>${emp.email }</td>
                          <td>${emp.department.deptName}</td>
                          <td>
                              <button class="btn btn-primary btn-sm">
                                  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                  修改
                              </button>
                              <button class="btn btn-danger btn-sm">
                                  <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                  删除
                              </button>
                          </td>
                      </tr>
                      </c:forEach>
                  </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                当前第${pageInfo.pageNum}页,共${pageInfo.pages}页,共${pageInfo.total}条数据


            </div>
            <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="pagenum">
                        <c:if test="${pageInfo.pageNum==pagenum}">
                            <li class="active">
                            <a href="#" >${pagenum}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=pagenum}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pagenum}" >${pagenum}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
            </div>
        </div>
    </div>
</body>
</html>
