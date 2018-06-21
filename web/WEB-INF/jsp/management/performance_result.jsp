<%-- 
    Document   : performance_result
    Created on : Jun 19, 2018, 11:25:12 PM
    Author     : WIN 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <c:if test="${sessionScope.admin_account_id <= 0}">
        <%
            String redirectURL = "http://localhost:8080/corp_management_webapp/management/";
            response.sendRedirect(redirectURL);
        %>
    </c:if>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <spring:url var="css_components" value="/assets/css/components.css" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="css_side_menu" value="/assets/css/side_menu.css" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="js_myeffects" value="/assets/js/my_effects.js" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="js_jquery" value="/assets/js/jquery_3.3.1.js" context="${pageContext.servletContext.contextPath}"></spring:url>


        <spring:url var="img_avatar" value="/assets/images/test_avatar.jpg" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_dashboard" value="/assets/images/icons/side_menu/dashboard.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_department" value="/assets/images/icons/side_menu/department.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_account" value="/assets/images/icons/side_menu/user.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_employee" value="/assets/images/icons/side_menu/employee.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_performance_rate" value="/assets/images/icons/side_menu/performance_rate.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_performance_result" value="/assets/images/icons/side_menu/performance_result.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_chart" value="/assets/images/icons/side_menu/chart.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_export" value="/assets/images/icons/side_menu/export.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_logout" value="/assets/images/icons/side_menu/logout.png" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="img_close" value="/assets/images/icons/general/close.png" context="${pageContext.servletContext.contextPath}"></spring:url>

            <link rel="stylesheet" href="${css_components}">
        <link rel="stylesheet" href="${css_side_menu}">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">

        <style>
            body{margin:0;padding:0;width:100%;min-height:768px;height:100%;font-family:Roboto,sans-serif}.style_main_container{float:right;display:grid;grid-template-columns:30px auto 30px;grid-template-rows:80px 50px auto 50px;width:calc(100% - 260px);min-height:768px;height:auto;background-color:#eee;transition:.35s ease}.style_main_container_expand{width:calc(100% - 80px);transition:.35s ease}.style_performance_result_tabs_wrapper{grid-column:2/3;grid-row:2/3;display:grid;grid-template-columns:120px 120px auto;grid-template-rows:auto}.style_performance_result_tabs_button{font-size:14px;border:none;outline:0;box-shadow:0 0 10px 0 rgba(0,0,0,.05);cursor:pointer;background-color:#f9f9f9;border-right:1px solid #eee;transition:.2s ease}.style_performance_result_tabs_button_toggle{background-color:#fff;transition:.2s ease}#id_performance_result_employee_tabs{grid-column:1/2;grid-row:1/2;border-top-left-radius:6px}#id_performance_result_department_tabs{grid-column:2/3;grid-row:1/2;border-top-right-radius:6px}.style_performance_result_search_form_wrapper{grid-column:2/3;grid-row:3/4;background-color:#fff;padding-top:20px;padding-bottom:60px;border-bottom-left-radius:6px;border-bottom-right-radius:6px;box-shadow:1px 1px 4px 0 rgba(0,0,0,.14);visibility:hidden;opacity:0;transition:.2s ease}.style_performance_result_search_form_wrapper_toggle{visibility:visible;opacity:1;transition:.2s ease}.style_performance_result_search_form{display:grid;grid-template-columns:auto;grid-template-rows:80px 20px;width:90%;margin-left:5%}.style_performance_result_search_form_search_field_wrapper{grid-row:1/2;display:grid;grid-template-columns:auto 50px}.style_performance_result_search_form_input_text_wrapper{grid-column:1/2;width:100%;height:60px;align-self:center}.style_performance_result_search_form_button{grid-column:2/3;justify-self:right;align-self:center}.style_performance_result_search_form_table_wrapper{grid-row:2/3;width:90%;margin-left:5%;display:grid;grid-template-rows:60px auto 25px;grid-template-columns:20px auto 20px;background-color:#fff;border-top-left-radius:6px;border-top-right-radius:6px;box-shadow:0 1px 4px 0 rgba(0,0,0,.14)}.style_performance_result_search_form_table_result{grid-row:1/2;grid-column:2/3;font-size:18px;color:#3c4858;align-self:center}.style_performance_result_search_form_table{grid-row:2/3;grid-column:2/3;border-collapse:collapse;font-size:1em}.style_performance_result_search_form_table tr{height:50px;border-bottom:1px solid #d3d3d3}.style_performance_result_search_form_table tr:last-child{border:none}.style_performance_result_search_form_table td,th{padding:5px 10px 10px 5px}.style_performance_result_search_form_table th:first-child,td:first-child{width:15px}.style_performance_result_search_form_table th{color:rgba(0,0,0,.87);text-align:left;font-weight:300;font-size:18px}.style_performance_result_search_form_table td:last-child,.style_performance_result_search_form_table th:last-child{text-align:right}.style_performance_result_search_form_table td{color:rgba(0,0,0,.87)}.style_performance_result_avatar{width:70px;height:70px}.style_performance_result_pagination_wrapper{grid-column:2/3;grid-row:4/5;justify-self:stretch;align-self:top;border-top:1px solid #d3d3d3;width:90%;margin-left:5%}.style_pagination{border-bottom-left-radius:6px!important;border-bottom-right-radius:6px!important}
        </style>
        <title>Performance Result</title>
    </head>

    <body>
        <div class="style_performance_result_wrapper" id="id_performance_result_wrapper">
            <div class="style_side_menu" id="id_side_menu">
                <div class="style_side_menu_item" id="id_side_menu_1" onclick="toggle_active_side_menu_item(this)">                    
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_account}" alt="" class="style_side_menu_item_link_icon" style="margin-top: 22.5px;">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_1">Himmy</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_2" onclick="toggle_active_side_menu_item(this)">
                    <spring:url var="current_admin_avatar_link" value="${sessionScope.current_admin_avatar}"></spring:url>
                        <a href="#" class="style_side_menu_item_link">
                            <img src="${current_admin_avatar_link}" alt="" class="style_side_menu_item_link_avatar" style="margin-top: 15px;">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_2" style="margin-left: 17.5px;">${sessionScope.current_admin_name}</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_3" onclick="toggle_active_side_menu_item(this)">
                    <c:url var="home_link" value="http://localhost:8080/corp_management_webapp/management/home"></c:url>
                    <a href="${home_link}" class="style_side_menu_item_link">
                        <img src="${img_dashboard}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_3">Home</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_4" onclick="toggle_active_side_menu_item(this)">
                    <c:url var="department_link" value="http://localhost:8080/corp_management_webapp/management/department"></c:url>
                    <a href="${department_link}" class="style_side_menu_item_link">
                        <img src="${img_department}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_4">Department</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_5" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_account}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_5">Account</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_6" onclick="toggle_active_side_menu_item(this)">
                    <c:url var="employee_link" value="http://localhost:8080/corp_management_webapp/management/employee"></c:url>
                    <a href="${employee_link}" class="style_side_menu_item_link">
                        <img src="${img_employee}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_6">Employee</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_7" onclick="toggle_active_side_menu_item(this)">
                    <c:url var="performance_rate_link" value="http://localhost:8080/corp_management_webapp/management/performance_rate"></c:url>
                    <a href="${performance_rate_link}" class="style_side_menu_item_link">
                        <img src="${img_performance_rate}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_7">Performance Rate</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_8" onclick="toggle_active_side_menu_item(this)">
                    <c:url var="performance_result_link" value="http://localhost:8080/corp_management_webapp/management/performance_result"></c:url>
                    <a href="${performance_result_link}" class="style_side_menu_item_link">
                        <img src="${img_performance_result}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_8">Performance Result</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_9" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_chart}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_9">Chart</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_10" onclick="toggle_active_side_menu_item(this)">
                    <c:choose>
                        <c:when test="${sessionScope.current_result_page == 'employees_result'}">

                            <a style="cursor: pointer;" class="style_side_menu_item_link" onclick="exportTableToExcel('id_employee_result_table', 'employee_performance_result')">
                                <img src="${img_export}" alt="" class="style_side_menu_item_link_icon">
                                <span class="style_side_menu_item_link_text" id="id_side_menu_text_10">Export</span>
                            </a>
                        </c:when>
                        <c:when test="${sessionScope.current_result_page == 'departments_result'}">

                            <a style="cursor: pointer;" class="style_side_menu_item_link" onclick="exportTableToExcel('id_department_result_table', 'department_result_table')">
                                <img src="${img_export}" alt="" class="style_side_menu_item_link_icon">
                                <span class="style_side_menu_item_link_text" id="id_side_menu_text_10">Export</span>
                            </a>
                        </c:when>
                    </c:choose>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_11">
                    <c:url var="logout_link" value="http://localhost:8080/corp_management_webapp/login/logout"></c:url>
                    <a href="${logout_link}" class="style_side_menu_item_link">
                        <img src="${img_logout}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_11">Log Out</span>
                    </a>
                </div>
            </div>
            <div class="style_main_container" id="id_main_container">
                <button class="style_toggle_side_menu_button style_circle_button" onclick="toggle_side_menu()">
                    <svg class="" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                    <g>
                    <path class="style_toggle_side_menu_button_icon" id="id_toggle_side_menu_button_icon"></path>
                    </g>
                    </svg>
                </button>
                <div class="style_side_menu_current_item" style="margin-left: 60px;">Performance Result</div>
                <div class="style_performance_result_tabs_wrapper" id="id_performance_result_tabs_wrapper">
                    <c:choose>
                        <c:when test="${sessionScope.current_result_page == 'employees_result'}">
                            <button class="style_performance_result_tabs_button style_performance_result_tabs_button_toggle" id="id_performance_result_employee_tabs"
                                    onclick="toggle_performance_tabs_pane('id_performance_result_employee_tabs', 'id_performance_employee_result_search_form_wrapper')">
                                Employees
                            </button>
                            <button class="style_performance_result_tabs_button" id="id_performance_result_department_tabs" onclick="toggle_performance_tabs_pane('id_performance_result_department_tabs', 'id_performance_result_department_search_form_wrapper')">
                                Departments
                            </button>
                        </c:when>
                        <c:when test="${sessionScope.current_result_page == 'departments_result'}">
                            <button class="style_performance_result_tabs_button" id="id_performance_result_employee_tabs"
                                    onclick="toggle_performance_tabs_pane('id_performance_result_employee_tabs', 'id_performance_employee_result_search_form_wrapper')">
                                Employees
                            </button>
                            <button class="style_performance_result_tabs_button style_performance_result_tabs_button_toggle" id="id_performance_result_department_tabs" onclick="toggle_performance_tabs_pane('id_performance_result_department_tabs', 'id_performance_result_department_search_form_wrapper')">
                                Departments
                            </button>
                        </c:when>
                    </c:choose>                    
                </div>
                <c:choose>
                    <c:when test="${sessionScope.current_result_page == 'employees_result'}">
                        <div class="style_performance_result_search_form_wrapper style_performance_result_search_form_wrapper_toggle" id="id_performance_employee_result_search_form_wrapper">
                        </c:when>
                        <c:otherwise>
                            <div class="style_performance_result_search_form_wrapper" id="id_performance_employee_result_search_form_wrapper">
                            </c:otherwise>
                        </c:choose>                
                        <form action="${pageContext.servletContext.contextPath}/performance_result/employee" class="style_performance_result_search_form">
                            <div class="style_performance_result_search_form_search_field_wrapper">
                                <div class="style_performance_result_search_form_input_text_wrapper">
                                    <label for="id_performance_result_employee_search_form_input_text" class="style_form_input_text_label" id="id_performance_result_employee_search_form_input_text_label">Employee's Name</label>
                                    <input type="text" name="employee_search_name" value="" class="style_form_input_text" id="id_performance_result_employee_search_form_input_text"
                                           onfocus="show_focus_border('id_performance_result_employee_search_form_input_text_focus_border'); show_focus_label('id_performance_result_employee_search_form_input_text_label');"
                                           onfocusout="hide_focus_border('id_performance_result_employee_search_form_input_text_focus_border'); hide_focus_label('id_performance_result_employee_search_form_input_text_label', 'id_performance_result_employee_search_form_input_text');">
                                    <input type="hidden" name="page" value="${requestScope.current_page_number}">
                                    <input type="hidden" name="entries" value="${requestScope.entries}">
                                    <div class="style_form_textfield_border" id="id_performance_result_employee_search_form_input_text_border"></div>
                                    <div class="style_form_textfield_focus_border" id="id_performance_result_employee_search_form_input_text_focus_border"></div>
                                </div>
                                <button class="style_performance_result_search_form_button style_circle_button" type="submit" value="" name="">
                                    <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                    <g>
                                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                    </g>
                                    </svg>
                                </button>
                            </div>

                        </form>
                        <div class="style_performance_result_search_form_table_wrapper">
                            <c:if test="${requestScope.employees_result_list != null}">
                                <div class="style_performance_result_search_form_table_result">Found ${requestScope.total_result} results for employee's name like "${requestScope.current_search_name}"</div>
                            </c:if>
                            <div style="grid-row:1/2;grid-column:2/3;align-self:center;justify-self:right;margin-right: 5px;" class="style_custom_select_option">
                                <span style="margin-right: 10px; font-size: 18px;">Entries per page: </span>
                                <select id="id_entries" onchange="reload_employee_result_table_entries()">
                                    <c:choose>
                                        <c:when test="${requestScope.entries == 5}">
                                            <option value="5" selected>5</option>
                                        </c:when>
                                        <c:when test="${requestScope.entries != 5}">
                                            <option value="5">5</option>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${requestScope.entries == 10}">
                                            <option value="10" selected>10</option>
                                        </c:when>
                                        <c:when test="${requestScope.entries != 10}">
                                            <option value="10">10</option>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${requestScope.entries == 15}">
                                            <option value="15" selected>15</option>
                                        </c:when>
                                        <c:when test="${requestScope.entries != 15}">
                                            <option value="15">15</option>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${requestScope.entries == 20}">
                                            <option value="20" selected>20</option>
                                        </c:when>
                                        <c:when test="${requestScope.entries != 20}">
                                            <option value="20">20</option>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${requestScope.entries == 25}">
                                            <option value="25" selected>25</option>
                                        </c:when>
                                        <c:when test="${requestScope.entries != 25}">
                                            <option value="25">25</option>
                                        </c:when>
                                    </c:choose>
                                </select>
                            </div>
                                <table id="id_employee_result_table" class="style_performance_result_search_form_table">
                                <tr>
                                    <th>#</th>
                                    <th>Avatar</th>
                                    <th>ID</th>
                                    <th>Full Name</th>
                                    <th>Department</th>
                                    <th>Downvotes</th>
                                    <th>Upvotes</th>
                                    <th>Result</th>
                                </tr>

                                <c:choose>
                                    <c:when test="${requestScope.employees_result_list.size() >= 1}">
                                        <c:set var="index" value="${requestScope.employee_index}"></c:set>
                                        <c:forEach items="${requestScope.employees_result_list}" var="employee_result">
                                            <tr>
                                                <td>${index}</td>
                                                <td>
                                                    <spring:url var="img_avatar_table" value="${employee_result.employeeAvatar}"></spring:url>
                                                    <img src="${img_avatar_table}" alt="" class="style_performance_result_avatar">                                                
                                                </td>
                                                <td>${employee_result.employeeId}</td>
                                                <td>${employee_result.employeeName}</td>
                                                <td>${employee_result.departmentName}</td>
                                                <td style="color: #f44336">${employee_result.totalDownvotes}</td>
                                                <td style="color: #4caf50">${employee_result.totalUpvotes}</td>
                                                <c:if test="${employee_result.result >= 0}">
                                                    <td style="font-size: 24px; color: #4caf50">
                                                        <strong>${employee_result.result}</strong>
                                                    </td>
                                                </c:if>
                                                <c:if test="${employee_result.result < 0}">
                                                    <td style="font-size: 24px; color: #f44336">
                                                        <strong>${employee_result.result}</strong>
                                                    </td>
                                                </c:if>                                            
                                            </tr>

                                            <c:set var="index" value="${index + 1}"></c:set>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${requestScope.employees_result_list.size() < 1}">
                                        <tr>
                                            <td colspan="6" style="font-size: 30px; padding-top: 20px;">
                                                Nothing to display
                                            </td>
                                        </tr>
                                    </c:when>
                                </c:choose>
                            </table>
                        </div>
                        <c:if test="${requestScope.employees_result_list.size() >= 1}">
                            <div class="style_performance_result_pagination_wrapper">
                                <ul class="style_pagination">
                                    <li class="style_pagination_item" id="id_employee_pagination_item_previous">
                                        <c:choose>
                                            <c:when test="${requestScope.current_page_number > 1 && requestScope.current_page_number <= requestScope.total_pages}">
                                                <c:url var="pagination_previous_button_action" value="http://localhost:8080/corp_management_webapp/performance_result/employee/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.current_page_number - 1}&entries=${requestScope.entries}"></c:url>
                                            </c:when>
                                            <c:when test="${requestScope.current_page_number <= 1}">
                                                <c:url var="pagination_previous_button_action" value="http://localhost:8080/corp_management_webapp/performance_result/employee/?employee_search_name=${requestScope.current_search_name}&page=1&entries=${requestScope.entries}"></c:url>
                                            </c:when>
                                        </c:choose>
                                        <button style="display: inline-block" class="style_circle_button" id="id_pagination_item_button_previous">
                                            <a style="width: 40px; height: 40px; border-radius: 50%; display: inline-block; position: absolute" href = "${pagination_previous_button_action}"></a>
                                            <span class="style_pagination_item_button_icon">
                                                <svg focusable="false" viewBox="0 0 20 18" aria-hidden="true">
                                                <g>
                                                <path d="M15.41 16.09l-4.58-4.59 4.58-4.59L14 5.5l-6 6 6 6z"></path>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="style_pagination_item_button_cover"></span>
                                        </button>
                                    </li>
                                    <span style="margin-right: 20px; margin-left: 20px;">Page ${requestScope.current_page_number} of ${requestScope.total_pages}</span>
                                    <li class="style_pagination_item" id="id_pagination_item_next">
                                        <c:choose>
                                            <c:when test="${requestScope.current_page_number >= 1 && requestScope.current_page_number < requestScope.total_pages}">
                                                <c:url var="pagination_next_button_action" value="http://localhost:8080/corp_management_webapp/performance_result/employee/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.current_page_number + 1}&entries=${requestScope.entries}"></c:url>
                                            </c:when>
                                            <c:when test="${requestScope.current_page_number >= requestScope.total_pages}">
                                                <c:url var="pagination_next_button_action" value="http://localhost:8080/corp_management_webapp/performance_result/employee/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.total_pages}&entries=${requestScope.entries}"></c:url>
                                            </c:when>
                                        </c:choose>
                                        <button class="style_circle_button" id="id_pagination_item_button_next" onclick="">
                                            <a style="width: 40px; height: 40px; border-radius: 50%; display: inline-block; position: absolute" href = "${pagination_next_button_action}"></a>
                                            <span class="style_pagination_item_button_icon">
                                                <svg focusable="false" viewBox="0 0 20 18" aria-hidden="true">
                                                <g>
                                                <path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z"></path>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="style_pagination_item_button_cover"></span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </c:if>

                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.current_result_page == 'departments_result'}">
                            <div class="style_performance_result_search_form_wrapper style_performance_result_search_form_wrapper_toggle" id="id_performance_result_department_search_form_wrapper">
                            </c:when>
                            <c:otherwise>
                                <div class="style_performance_result_search_form_wrapper" id="id_performance_result_department_search_form_wrapper">
                                </c:otherwise>
                            </c:choose> 

                            <form action="${pageContext.servletContext.contextPath}/performance_result/department" class="style_performance_result_search_form">
                                <div class="style_performance_result_search_form_search_field_wrapper">
                                    <div class="style_performance_result_search_form_input_text_wrapper">
                                        <label for="id_performance_result_department_search_form_input_text" class="style_form_input_text_label" id="id_performance_result_department_search_form_input_text_label">Department's Name</label>
                                        <input type="text" name="department_search_name" value="" class="style_form_input_text" id="id_performance_result_department_search_form_input_text"
                                               onfocus="show_focus_border('id_performance_result_department_search_form_input_text_focus_border'); show_focus_label('id_performance_result_department_search_form_input_text_label');"
                                               onfocusout="hide_focus_border('id_performance_result_department_search_form_input_text_focus_border'); hide_focus_label('id_performance_result_department_search_form_input_text_label', 'id_performance_result_department_search_form_input_text');">
                                        <div class="style_form_textfield_border" id="id_performance_result_department_search_form_input_text_border"></div>
                                        <div class="style_form_textfield_focus_border" id="id_performance_result_department_search_form_input_text_focus_border"></div>
                                    </div>
                                    <button class="style_performance_result_search_form_button style_circle_button" type="submit" value="" name="">
                                        <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                        <g>
                                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                        </g>
                                        </svg>
                                    </button>
                                </div>
                            </form>
                            <div class="style_performance_result_search_form_table_wrapper" style="border-bottom-right-radius: 6px;border-bottom-left-radius: 6px;">
                                <div class="style_performance_result_search_form_table_result">Found ${requestScope.departments_result_list.size()} results</div>
                                <table id="id_department_result_table" class="style_performance_result_search_form_table">
                                    <tr>
                                        <th>#</th>
                                        <th>Department Name</th>
                                        <th>Total Employees</th>
                                        <th>Downvotes</th>
                                        <th>Upvotes</th>
                                        <th>Result</th>
                                    </tr>
                                    <c:set var="department_index" value="${requestScope.current_department_index}"></c:set>
                                    <c:forEach items="${requestScope.departments_result_list}" var="department_result">
                                        <tr>
                                            <td>${department_index}</td>
                                            <td>${department_result.departmentName}</td>
                                            <td>${department_result.totalEmployees}</td>
                                            <td style="color: #f44336">${department_result.totalDownvotes}</td>
                                            <td style="color: #4caf50">${department_result.totalUpvotes}</td>
                                            <c:if test="${department_result.result >= 0}">
                                                <td style="font-size: 24px; color: #4caf50">
                                                    <strong>${department_result.result}</strong>
                                                </td>
                                            </c:if>
                                            <c:if test="${department_result.result < 0}">
                                                <td style="font-size: 24px; color: #f44336">
                                                    <strong>${department_result.result}</strong>
                                                </td>
                                            </c:if>
                                        </tr>
                                        <c:set var="department_index" value="${department_index + 1}"></c:set>
                                    </c:forEach>

                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                </body>
                <script src="${js_jquery}"></script>
                <script src="${js_myeffects}"></script>
                <script>
                                                   function reload_employee_result_table_entries() {
                                                       var entries = parseInt($('#id_entries').val());
                                                       location.href = 'http://localhost:8080/corp_management_webapp/performance_result/employee/?employee_search_name=${requestScope.current_search_name}&page=1&entries=' + entries;
                                                   }
                </script>

                </html>
