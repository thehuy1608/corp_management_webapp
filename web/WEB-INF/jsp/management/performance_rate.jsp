<%-- 
    Document   : performance
    Created on : Jun 19, 2018, 2:41:16 PM
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
        <spring:url var="context" value="${pageContext.servletContext.contextPath}"></spring:url>
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
        <spring:url var="img_checked" value="/assets/images/icons/general/checked.png"></spring:url>
        <link rel="stylesheet" href="${css_components}">
        <link rel="stylesheet" href="${css_side_menu}">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
        <style>
            body{margin:0;padding:0;width:100%;min-height:768px;height:100%;font-family:Roboto,sans-serif}.style_main_container{float:right;display:grid;grid-template-columns:100px auto 100px;grid-template-rows:80px 50px auto 100px 50px;width:calc(100% - 260px);min-height:768px;height:auto;background-color:#eee;transition:.35s ease;overflow-y:auto}.style_main_container_expand{width:calc(100% - 80px);transition:.35s ease}.style_performance_rate_search_form_wrapper{grid-column:2/3;grid-row:3/4}.style_performance_rate_search_form{display:grid;grid-template-columns:auto;grid-template-rows:80px 20px}.style_performance_rate_search_form_search_field_wrapper{grid-row:1/2;display:grid;grid-template-columns:auto 50px}.style_performance_rate_search_form_input_text_wrapper{grid-column:1/2;width:100%;height:60px;align-self:center}.style_performance_rate_search_form_button{grid-column:2/3;justify-self:right;align-self:center}.style_performance_rate_search_form_table_wrapper{grid-row:2/3;width:100%;display:grid;grid-template-rows:60px auto 25px;grid-template-columns:20px auto 20px;background-color:#fff;border-top-left-radius:6px;border-top-right-radius:6px;box-shadow:0 1px 4px 0 rgba(0,0,0,.14)}.style_performance_rate_search_form_table_result{grid-row:1/2;grid-column:2/3;font-size:18px;color:#3c4858;align-self:center}.style_performance_rate_search_form_table{grid-row:2/3;grid-column:2/3;width:100%;border-collapse:collapse;font-size:1em}.style_performance_rate_search_form_table tr{height:50px;border-bottom:1px solid #d3d3d3}.style_performance_rate_search_form_table tr:last-child{border:none}.style_performance_rate_search_form_table td,th{padding:5px 10px 10px 5px}.style_performance_rate_search_form_table td:nth-child(5){word-break:break-all}.style_performance_rate_search_form_table th:first-child,td:first-child{width:15px}.style_performance_rate_search_form_table th{color:rgba(0,0,0,.87);text-align:left;font-weight:300;font-size:18px}.style_performance_rate_search_form_table th:last-child{text-align:right}.style_performance_rate_search_form_table td{color:rgba(0,0,0,.87)}.style_performance_rate_search_form_table_action_wrapper{padding:0!important;display:grid;grid-template-columns:auto 50px 10px 50px 10px;grid-template-rows:83px}.style_down_rate_button,.style_up_rate_button{align-self:center;width:40px;height:40px;padding-top:4px;transition:.3s ease;outline:0;cursor:pointer}.style_down_rate_button{grid-column:2/3;justify-self:center;border:none;border-radius:6px;background-color:#f44336;box-shadow:0 2px 2px 0 rgba(244,67,54,.14),0 3px 1px -2px rgba(244,67,54,.2),0 1px 5px 0 rgba(244,67,54,.12)}.style_down_rate_button:hover{box-shadow:0 14px 26px -12px rgba(244,67,54,.42),0 4px 23px 0 rgba(0,0,0,.12),0 8px 10px -5px rgba(244,67,54,.2);transition:.3s ease}.style_up_rate_button{grid-column:4/5;justify-self:center;border:none;border-radius:6px;background-color:#4caf50;box-shadow:0 2px 2px 0 rgba(76,175,80,.14),0 3px 1px -2px rgba(76,175,80,.2),0 1px 5px 0 rgba(76,175,80,.12)}.style_up_rate_button:hover{box-shadow:0 14px 26px -12px rgba(76,175,80,.42),0 4px 23px 0 rgba(0,0,0,.12),0 8px 10px -5px rgba(76,175,80,.2);transition:.3s ease}.style_performance_rate_avatar{width:70px;height:70px}.style_performance_rate_detail_wrapper{position:fixed;width:100%;min-height:768px;height:auto;z-index:20;visibility:hidden;opacity:0;background-color:rgba(0,0,0,.3);transition:all .5s linear}.style_performance_rate_detail_wrapper_toggle{visibility:visible;opacity:1;transition:all .2s linear}.style_performance_rate_detail_modal{position:absolute;width:500px;height:400px;margin-top:-500px;margin-left:calc((100vw - 500px)/ 2);background-color:#fff;border-radius:6px;box-shadow:0 1px 4px 0 gray;display:grid;grid-template-rows:10px 20px auto;grid-template-columns:10px auto 10px;grid-gap:10px;transition:margin-top .5s ease}.style_performance_rate_detail_modal_close_button{grid-row:2/3;grid-column:2/3;width:20px;height:20px;margin:0;padding:0;outline:0;border:none;display:inline-block;background-color:transparent;cursor:pointer;justify-self:right}.style_performance_rate_detail_modal_close_button>img{height:20px;width:20px;display:inline-block}.style_performance_rate_detail_modal_content{grid-row:3/4;grid-column:2/3}.style_performance_rate_detail_modal_content_item{width:auto;height:20px;line-height:30px;margin-top:30px}.style_performance_rate_detail_modal_content_item:first-child{margin-top:0}.style_performance_rate_detail_modal_content_label{font-size:18px;color:#3c4858;font-weight:600}.style_performance_rate_detail_modal_content_content{font-size:18 px;color:#3c4858;margin-left:20px}.style_performance_rate_down_vote_icon,.style_performance_rate_up_vote_icon{margin-left:180px}.style_performance_rate_pagination_wrapper{grid-column:2/3;grid-row:4/5;justify-self:stretch;align-self:top;border-top:1px solid #d3d3d3}.style_pagination{border-bottom-left-radius:6px!important;border-bottom-right-radius:6px!important}
        </style>
        <title>Performance</title>
    </head>

    <body>
        <div class="style_performance_rate_wrapper" id="id_performance_rate_wrapper">
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
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_export}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_10">Export</span>
                    </a>
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
                <div class="style_side_menu_current_item">Performance Rate</div>
                <div class="style_performance_rate_search_form_wrapper" id="id_performance_rate_search_form_wrapper">
                    <form action="${pageContext.servletContext.contextPath}/performance_rate/" class="style_performance_rate_search_form" method="get">
                        <div class="style_performance_rate_search_form_search_field_wrapper">
                            <div class="style_performance_rate_search_form_input_text_wrapper">
                                <label for="id_performance_rate_search_form_input_text" class="style_form_input_text_label" id="id_performance_rate_search_form_input_text_label">Employee's Name</label>
                                <input type="text" name="employee_search_name" value="" class="style_form_input_text" id="id_performance_rate_search_form_input_text" onfocus="show_focus_border('id_performance_rate_search_form_input_text_focus_border'); show_focus_label('id_performance_rate_search_form_input_text_label');"
                                       onfocusout="hide_focus_border('id_performance_rate_search_form_input_text_focus_border'); hide_focus_label('id_performance_rate_search_form_input_text_label', 'id_performance_rate_search_form_input_text');">
                                <input type="hidden" name="page" value="${requestScope.current_page_number}">
                                <input type="hidden" name="entries" value="${requestScope.entries}">
                                <div class="style_form_textfield_border" id="id_performance_rate_search_form_input_text_border"></div>
                                <div class="style_form_textfield_focus_border" id="id_performance_rate_search_form_input_text_focus_border"></div>
                            </div>
                            <button class="style_performance_rate_search_form_button style_circle_button" type="submit" value="" name="">
                                <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                <g>
                                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                </g>
                                </svg>
                            </button>
                        </div>

                    </form>
                    <div class="style_performance_rate_search_form_table_wrapper">
                        <c:if test="${requestScope.employees_list != null}">
                            <div class="style_performance_rate_search_form_table_result">Found ${requestScope.total_result} results for employee's name like "${requestScope.current_search_name}"</div>
                        </c:if>
                        <div style="grid-row:1/2;grid-column:2/3;align-self:center;justify-self:right;margin-right: 2px;" class="style_custom_select_option">
                            <span style="margin-right: 10px; font-size: 18px;">Entries per page: </span>
                            <select id="id_entries" onchange="reload_performance_rate_table_entries()">
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
                        <table class="style_performance_rate_search_form_table">
                            <tr>
                                <th>#</th>
                                <th>Avatar</th>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Department</th>
                                <th>Email</th>
                                <th>Actions</th>
                            </tr>
                            <c:choose>
                                <c:when test="${requestScope.employees_list.size() >= 1}">
                                    <c:set var="index" value="${requestScope.employee_index}"></c:set>
                                    <c:forEach items="${requestScope.employees_list}" var="employee">
                                        <tr>
                                            <td>${index}</td>
                                            <td>
                                                <spring:url var="img_avatar_table" value="${employee.employeeAvatar}"></spring:url>
                                                <img src="${img_avatar_table}" alt="" class="style_performance_rate_avatar">
                                            </td>
                                            <td>${employee.employeeId}</td>
                                            <td>${employee.employeeName}</td>
                                            <td>${employee.department.departmentName}</td>
                                            <td>${employee.employeeEmail}</td>
                                            <td class="style_performance_rate_search_form_table_action_wrapper">
                                                <button class="style_down_rate_button" onclick="load_employee_to_downvote('${employee.employeeName}', ${employee.employeeId});">
                                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                                    <path fill="none" d="M24 24H0V0h24v24z" />
                                                    <path fill="white" d="M22 4h-2c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h2V4zM2.17 11.12c-.11.25-.17.52-.17.8V13c0 1.1.9 2 2 2h5.5l-.92 4.65c-.05.22-.02.46.08.66.23.45.52.86.88 1.22L10 22l6.41-6.41c.38-.38.59-.89.59-1.42V6.34C17 5.05 15.95 4 14.66 4h-8.1c-.71 0-1.36.37-1.72.97l-2.67 6.15z"
                                                          />
                                                    </svg>
                                                </button>
                                                <button class="style_up_rate_button" onclick="load_employee_to_upvote('${employee.employeeName}', ${employee.employeeId});">
                                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                                    <path fill="none" d="M24 24H0V0h24v24z" />
                                                    <path fill="white" d="M2 20h2c.55 0 1-.45 1-1v-9c0-.55-.45-1-1-1H2v11zm19.83-7.12c.11-.25.17-.52.17-.8V11c0-1.1-.9-2-2-2h-5.5l.92-4.65c.05-.22.02-.46-.08-.66-.23-.45-.52-.86-.88-1.22L14 2 7.59 8.41C7.21 8.79 7 9.3 7 9.83v7.84C7 18.95 8.05 20 9.34 20h8.11c.7 0 1.36-.37 1.72-.97l2.66-6.15z"
                                                          />
                                                    </svg>
                                                </button>
                                            </td>
                                        </tr>
                                        <c:set var="index" value="${index + 1}"></c:set>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${requestScope.employees_list.size() < 1}">
                                    <tr>
                                        <td colspan="6" style="font-size: 30px; padding-top: 20px;">
                                            Nothing to display
                                        </td>
                                    </tr>
                                </c:when>
                            </c:choose>                            
                        </table>
                    </div>
                </div>
                <c:if test="${requestScope.employees_list.size() >= 1}">

                    <div class="style_performance_rate_pagination_wrapper">
                        <ul class="style_pagination">
                            <li class="style_pagination_item" id="id_pagination_item_previous">
                                <c:choose>
                                    <c:when test="${requestScope.current_page_number > 1 && requestScope.current_page_number <= requestScope.total_pages}">
                                        <c:url var="pagination_previous_button_action" value="http://localhost:8080/corp_management_webapp/performance_rate/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.current_page_number - 1}&entries=${requestScope.entries}"></c:url>
                                    </c:when>
                                    <c:when test="${requestScope.current_page_number <= 1}">
                                        <c:url var="pagination_previous_button_action" value="http://localhost:8080/corp_management_webapp/performance_rate/?employee_search_name=${requestScope.current_search_name}&page=1&entries=${requestScope.entries}"></c:url>
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
                                        <c:url var="pagination_next_button_action" value="http://localhost:8080/corp_management_webapp/performance_rate/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.current_page_number + 1}&entries=${requestScope.entries}"></c:url>
                                    </c:when>
                                    <c:when test="${requestScope.current_page_number >= requestScope.total_pages}">
                                        <c:url var="pagination_next_button_action" value="http://localhost:8080/corp_management_webapp/performance_rate/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.total_pages}&entries=${requestScope.entries}"></c:url>
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
        </div>
        <div class="style_performance_rate_detail_wrapper" id="id_performance_rate_upvote_wrapper">
            <div class="style_performance_rate_detail_modal" id="id_performance_rate_upvote_modal">
                <button class="style_performance_rate_detail_modal_close_button" onclick="toggle_performance_rate_upvote()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_performance_rate_detail_modal_content" id="id_performance_rate_detail_modal_content">
                    <div class="style_performance_rate_up_vote_icon">
                        <svg width="100px" height="100px" viewBox="0 0 24 24">
                        <path d="M0 0h24v24H0z" fill="none" />
                        <path fill="#4caf50" d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"
                              />
                        </svg>
                    </div>
                    <div id="id_upvote_employee_name" style="margin-top: 20px; margin-bottom: 30px; font-size: 20px; font-weight: 600;">
                        You're giving James Butt an upvote.
                    </div>
                    <label for="id_performance_rate_upvote_reason_input_text" class="style_form_input_text_label" id="id_performance_rate_upvote_reason_input_text_label">Explain why:</label>
                    <input type="text" name="upvotePerformanceDescription" value="" class="style_form_input_text" id="id_performance_rate_upvote_reason_input_text" onfocus="show_focus_border('id_performance_rate_upvote_reason_input_text_focus_border'); show_focus_label('id_performance_rate_upvote_reason_input_text_label');"
                           onfocusout="hide_focus_border('id_performance_rate_upvote_reason_input_text_focus_border'); hide_focus_label('id_performance_rate_upvote_reason_input_text_label', 'id_performance_rate_upvote_reason_input_text');">
                    <div class="style_form_textfield_border" id="id_performance_rate_upvote_reason_input_text_border"></div>
                    <div class="style_form_textfield_focus_border" id="id_performance_rate_upvote_reason_input_text_focus_border"></div>

                    <button id="id_upvote_button" style="margin-left: 170px; margin-top: 30px; font-size: 14px; font-weight: 600;text-transform: capitalize;" class="style_success_button">
                        upvote
                    </button>
                </div>

            </div>
        </div>
        <div class="style_performance_rate_detail_wrapper" id="id_performance_rate_downvote_wrapper">
            <div class="style_performance_rate_detail_modal" id="id_performance_rate_downvote_modal">
                <button class="style_performance_rate_detail_modal_close_button" onclick="toggle_performance_rate_downvote()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_performance_rate_detail_modal_content" id="id_performance_rate_downvote_modal_content">
                    <div class="style_performance_rate_down_vote_icon">
                        <svg width="100px" height="100px" viewBox="0 0 24 24">
                        <path fill="none" d="M0 0h24v24H0V0z" />
                        <path fill="#f44336" d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 3c-2.33 0-4.31 1.46-5.11 3.5h10.22c-.8-2.04-2.78-3.5-5.11-3.5z"
                              />
                        </svg>
                    </div>
                    <div id="id_downvote_employee_name" style="margin-top: 20px; margin-bottom: 30px; font-size: 20px; font-weight: 600;">
                        You're giving James Butt a downvote.
                    </div>
                    <label for="id_performance_rate_downvote_reason_input_text" class="style_form_input_text_label" id="id_performance_rate_downvote_reason_input_text_label">Explain why:</label>
                    <input type="text" name="" value="" class="style_form_input_text" id="id_performance_rate_downvote_reason_input_text" onfocus="show_focus_border('id_performance_rate_downvote_reason_input_text_focus_border'); show_focus_label('id_performance_rate_downvote_reason_input_text_label');"
                           onfocusout="hide_focus_border('id_performance_rate_downvote_reason_input_text_focus_border'); hide_focus_label('id_performance_rate_downvote_reason_input_text_label', 'id_performance_rate_downvote_reason_input_text');">
                    <div class="style_form_textfield_border" id="id_performance_rate_upvote_reason_input_text_border"></div>
                    <div class="style_form_textfield_focus_border" id="id_performance_rate_downvote_reason_input_text_focus_border"></div>

                    <button id="id_downvote_button" style="margin-left: 170px; margin-top: 30px; font-size: 14px; font-weight: 500; text-transform: capitalize; " class="style_danger_button">
                        downvote
                    </button>
                </div>
            </div>
        </div>
        <div class="style_performance_rate_detail_wrapper" id="id_performance_rate_success_wrapper">
            <div class="style_performance_rate_detail_modal" id="id_performance_rate_success_modal">
                <button class="style_performance_rate_detail_modal_close_button" onclick="toggle_performance_rate_success()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_performance_rate_detail_modal_content" id="id_performance_rate_success_modal_content">
                    <div style="height: 128px; width: 128px; border-radius: 50%; margin-left: 166px; box-shadow: 0 14px 26px -12px rgba(153, 153, 153, 0.42),
                         0 4px 23px 0px rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(153, 153, 153, 0.2);">
                        <img src="${img_checked}">
                    </div>
                    <div id="id_performance_rate_success_form_message" style="text-align: center; font-size: 35px; margin-top: 60px;">
                        Add Employee Successful !
                    </div>
                    <div>
                        <button onclick="toggle_performance_rate_success()" class="style_success_button" style="font-size: 16px;margin-left: 170px; margin-top: 60px;">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_loading_wrapper" id="id_loading_wrapper">
            <div class="style_loader_wrapper" id="id_loader_wrapper">
                <div class="style_loader" id="id_loader">

                </div>
            </div>
        </div>
    </body>
    <script src="${js_jquery}"></script>
    <script src="${js_myeffects}"></script>
    <script>
                    function reload_performance_rate_table_entries() {
                        var entries = parseInt($('#id_entries').val());
                        location.href = 'http://localhost:8080/corp_management_webapp/performance_rate/?employee_search_name=${requestScope.employee_search_name}&page=1&entries=' + entries;
                    }

                    function load_employee_to_downvote(employee_name, employee_id) {
                        $("#id_downvote_employee_name").text("You're giving " + employee_name + " a downvote.");
                        $("#id_downvote_button").attr("onclick", "performance_downvote(" + 1 + "," + employee_id + ")");
                        toggle_performance_rate_downvote();
                    }

                    function load_employee_to_upvote(employee_name, employee_id) {
                        $("#id_upvote_employee_name").text("You're giving " + employee_name + " an upvote.");
                        $("#id_upvote_button").attr("onclick", "performance_upvote(" + 1 + "," + employee_id + ")");
                        toggle_performance_rate_upvote();
                    }

                    function performance_upvote(administrator_id, employee_id) {
                        toggle_loading_pane();
                        var performance_result = 1;
                        var performance_description = $("#id_performance_rate_upvote_reason_input_text").val();
                        var performance_added_date = new Date();
                        var performance_modified_date = new Date();
                        let data = {
                            "administratorId": administrator_id,
                            "employeeId": employee_id,
                            "performanceResult": performance_result,
                            "performanceDescription": performance_description,
                            "performanceAddedDate": performance_added_date,
                            "performanceModifiedDate": performance_modified_date
                        };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json",
                            url: "${pageContext.servletContext.contextPath}/performance_rate",
                            data: JSON.stringify(data),
                            dataType: "json",
                            timeout: 10000,
                            success: function (response_data) {
                                toggle_performance_rate_upvote();
                                $("#id_performance_rate_success_form_message").text('Add Upvote Successful !');
                                toggle_performance_rate_success();
                                toggle_loading_pane();
                            }
                        });
                    }

                    function performance_downvote(administrator_id, employee_id) {
                        toggle_loading_pane();
                        var performance_result = -1;
                        var performance_description = $("#id_performance_rate_upvote_reason_input_text").val();
                        var performance_added_date = new Date();
                        var performance_modified_date = new Date();
                        let data = {
                            "administratorId": administrator_id,
                            "employeeId": employee_id,
                            "performanceResult": performance_result,
                            "performanceDescription": performance_description,
                            "performanceAddedDate": performance_added_date,
                            "performanceModifiedDate": performance_modified_date
                        };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json",
                            url: "${pageContext.servletContext.contextPath}/performance_rate",
                            data: JSON.stringify(data),
                            dataType: "json",
                            timeout: 10000,
                            success: function (response_data) {
                                toggle_performance_rate_downvote();
                                $("#id_performance_rate_success_form_message").text('Add Downvote Successful !');
                                toggle_performance_rate_success();
                                toggle_loading_pane();
                            }
                        });
                    }
    </script>
</html>
