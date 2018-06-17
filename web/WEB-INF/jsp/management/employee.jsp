<%-- 
    Document   : employee
    Created on : Jun 15, 2018, 12:38:24 AM
    Author     : WIN 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <base href="${pageContext.servletContext.contextPath}" />
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
        <title>Employee</title>
        <style>
            body{margin:0;padding:0;width:100%;min-height:768px;height:100%;font-family:Roboto,sans-serif}body::-webkit-scrollbar{border-radius:6px;width:5px}body::-webkit-scrollbar-track{border-radius:6px;background:#f1f1f1;box-shadow:inset 0 0 6px rgba(0,0,0,.3)}body::-webkit-scrollbar-thumb{border-radius:6px;background:#888}body::-webkit-scrollbar-thumb:hover{border-radius:6px;background:#555}.style_main_container{float:right;display:grid;grid-template-columns:100px auto 100px;grid-template-rows:80px 50px auto 100px 50px;width:calc(100% - 260px);min-height:768px;height:auto;background-color:#eee;transition:.35s ease;overflow-y:auto}.style_main_container_expand{width:calc(100% - 80px);transition:.35s ease}.style_add_employee_section_wrapper{grid-column:2/3;grid-row:2/3;justify-self:left;align-self:stretch}.style_add_employee_section_text{font-size:18px;margin-left:20px;margin-top:-10px}.style_employee_search_form_wrapper{grid-column:2/3;grid-row:3/4}.style_employee_search_form{display:grid;grid-template-columns:auto;grid-template-rows:80px 20px}.style_employee_search_form_search_field_wrapper{grid-row:1/2;display:grid;grid-template-columns:auto 50px}.style_employee_search_form_input_text_wrapper{grid-column:1/2;width:100%;height:60px;align-self:center}.style_employee_search_form_button{grid-column:2/3;justify-self:right;align-self:center}.style_employee_search_form_table_wrapper{grid-row:2/3;width:100%;display:grid;grid-template-rows:60px auto 25px;grid-template-columns:20px auto 20px;background-color:#fff;border-top-left-radius:6px;border-top-right-radius:6px;box-shadow:0 1px 4px 0 rgba(0,0,0,.14)}.style_employee_search_form_table_result{grid-row:1/2;grid-column:2/3;font-size:18px;color:#3c4858;align-self:center}.style_employee_search_form_table{grid-row:2/3;grid-column:2/3;width:100%;border-collapse:collapse;font-size:1em}.style_employee_search_form_table tr{height:50px;border-bottom:1px solid #d3d3d3}.style_employee_search_form_table tr:last-child{border:none}.style_employee_search_form_table td,th{padding:5px 10px 10px 5px}.style_employee_search_form_table td:nth-child(5){word-break:break-all}.style_employee_search_form_table th:first-child,td:first-child{width:15px}.style_employee_search_form_table th{color:rgba(0,0,0,.87);text-align:left;font-weight:300;font-size:18px}.style_employee_search_form_table th:last-child{text-align:right}.style_employee_search_form_table td{color:rgba(0,0,0,.87)}.style_employee_search_form_table_action_wrapper{padding:0!important;display:grid;grid-template-columns:auto 50px 50px 50px 10px;grid-template-rows:83px}.style_employee_search_form_table_action_view_button{grid-column:2/3;grid-row:1/2}.style_employee_search_form_table_action_edit_button{grid-column:3/4;grid-row:1/2}.style_employee_search_form_table_action_delete_button{grid-column:4/5;grid-row:1/2}.style_employee_avatar{width:70px;height:70px}.style_employee_pagination_wrapper{grid-column:2/3;grid-row:4/5;justify-self:stretch;align-self:top;border-top:1px solid #d3d3d3}.style_pagination{border-bottom-left-radius:6px!important;border-bottom-right-radius:6px!important}.style_employee_detail_wrapper{position:fixed;width:100%;min-height:768px;height:auto;z-index:20;visibility:hidden;opacity:0;background-color:rgba(0,0,0,.3);transition:all .5s linear}.style_employee_detail_wrapper_toggle{visibility:visible;opacity:1;transition:all .2s linear}.style_employee_detail_modal{position:absolute;width:500px;height:500px;margin-top:-500px;margin-left:calc((100vw - 500px)/ 2);background-color:#fff;border-radius:6px;box-shadow:0 1px 4px 0 #636363;display:grid;grid-template-rows:10px 20px auto;grid-template-columns:10px auto 20px 10px;grid-gap:10px;transition:margin-top .5s ease}.style_employee_detail_modal_close_button,.style_employee_detail_modal_close_button>img{width:20px;height:20px;display:inline-block}.style_employee_detail_modal_close_button{grid-row:2/3;grid-column:3/4;margin:0;padding:0;outline:0;border:none;background-color:transparent;cursor:pointer}.style_employee_detail_modal_avatar,.style_employee_detail_modal_avatar>img,.style_employee_detail_modal_avatar_cover,.style_employee_detail_modal_avatar_upload{width:150px;height:150px;border-radius:50%}.style_employee_detail_modal_content{grid-row:3/4;grid-column:2/4;margin-top:30px}.style_employee_detail_modal_avatar{position:absolute;margin-top:-170px;margin-left:155px;box-shadow:0 16px 38px -12px rgba(0,0,0,.56),0 4px 25px 0 rgba(0,0,0,.12),0 8px 10px -5px rgba(0,0,0,.2)}.style_employee_detail_modal_avatar:hover>.style_employee_detail_modal_avatar_cover{opacity:1;transition:.4s ease}.style_employee_detail_modal_avatar_cover{position:absolute;display:inline-block;margin-top:-153px;background-color:rgba(0,0,0,.8);opacity:0;transition:.4s ease}.style_employee_detail_modal_avatar_upload{position:absolute;z-index:10;outline:0;cursor:pointer;opacity:0;background-color:transparent}.style_employee_detail_modal_avatar_cover_text{position:absolute;z-index:5;text-align:center;margin-top:45px;margin-left:25px;color:#fff;font-size:16px;font-weight:400}.style_employee_detail_modal_content_viewport{width:auto;height:400px;background-color:transparent;overflow-y:auto;scroll-behavior:smooth}.style_employee_detail_modal_content_viewport::-webkit-scrollbar{width:5px;background-color:#f1f1f1}.style_employee_detail_modal_content_viewport::-webkit-scrollbar-track{border-radius:6px;box-shadow:inset 0 0 6px rgba(0,0,0,.1);background-color:#f1f1f1}.style_employee_detail_modal_content_viewport::-webkit-scrollbar-thumb{border-radius:6px;background-image:-webkit-gradient(linear,left bottom,left top,color-stop(.44,#e16cf3),color-stop(.72,#be4bd1),color-stop(.86,#9c27b0))}.style_employee_detail_modal_content_item_wrapper{width:auto;height:1500px}.style_employee_detail_modal_content_item{width:400px;height:85px;margin-top:30px;margin-left:25px;padding-left:15px;padding-top:5px;border-radius:6px;box-shadow:0 1px 4px 0 rgba(0,0,0,.3);background-color:#fff}.style_employee_detail_modal_content_item:first-child{margin-top:2px}.style_employee_detail_modal_content_item:last-child{margin-bottom:4px}.style_employee_detail_modal_content_item_label{font-size:18px;color:#9c27b0;font-weight:bolder;font-style:italic;margin-top:10px}.style_employee_detail_modal_content_item_text{font-size:20px;color:#3c4858;margin-left:10px;margin-top:15px}.style_employee_detail_form_submit_button{float:right;margin-top:20px;margin-right:15px;margin-bottom:25px}
        </style>
    </head>

    <body>
        <div class="style_employee_management_wrapper">
            <div class="style_side_menu" id="id_side_menu">
                <div class="style_side_menu_item" id="id_side_menu_1" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_account}" alt="" class="style_side_menu_item_link_icon" style="margin-top: 22.5px;">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_1">Himmy</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_2" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_avatar}" alt="" class="style_side_menu_item_link_avatar" style="margin-top: 15px;">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_2" style="margin-left: 17.5px;">Thảo My</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_3" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_dashboard}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_3">Dashboard</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_4" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
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
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_employee}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_6">Employee</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_7" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
                        <img src="${img_performance_rate}" alt="" class="style_side_menu_item_link_icon">
                        <span class="style_side_menu_item_link_text" id="id_side_menu_text_7">Performance Rate</span>
                    </a>
                </div>
                <div class="style_side_menu_item" id="id_side_menu_8" onclick="toggle_active_side_menu_item(this)">
                    <a href="#" class="style_side_menu_item_link">
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
                    <a href="#" class="style_side_menu_item_link">
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
                <div class="style_side_menu_current_item">Employee</div>
                <div class="style_add_employee_section_wrapper">
                    <button class="style_add_employee_section_button style_circle_button" onclick="toggle_employee_add_form()">
                        <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                        <g>
                        <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"></path>
                        </g>
                        </svg>
                    </button>
                    <span class="style_add_employee_section_text">Add new employee</span>
                </div>
                <div class="style_employee_search_form_wrapper">
                    <form action="${pageContext.servletContext.contextPath}/employee/ " method="get" class="style_employee_search_form">
                        <div class="style_employee_search_form_search_field_wrapper">
                            <div class="style_employee_search_form_input_text_wrapper">
                                <label for="id_employee_search_form_input_text" class="style_form_input_text_label" id="id_employee_search_form_input_text_label">Find employee</label>
                                <input type="text" name="employee_search_name" value="" class="style_form_input_text" id="id_employee_search_form_input_text" onfocus="show_focus_border('id_employee_search_form_input_text_focus_border'); show_focus_label('id_employee_search_form_input_text_label');"
                                       onfocusout="hide_focus_border('id_employee_search_form_input_text_focus_border'); hide_focus_label('id_employee_search_form_input_text_label', 'id_employee_search_form_input_text');">
                                <input type="hidden" name="page" value="${request.current_page_number}">
                                <div class="style_form_textfield_border" id="id_employee_search_form_input_text_border"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_search_form_input_text_focus_border"></div>
                            </div>
                            <button class="style_employee_search_form_button style_circle_button" type="submit" value="" name="">
                                <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                <g>
                                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                </g>
                                </svg>
                            </button>
                        </div>
                    </form>
                    <div class="style_employee_search_form_table_wrapper">
                        <c:if test="${requestScope.employees_list != null}">
                            <div class="style_employee_search_form_table_result">Found ${requestScope.total_result} results for employee's name like "${requestScope.current_search_name}"</div>
                        </c:if>
                        <table class="style_employee_search_form_table">
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
                                                <img src="${img_avatar_table}" alt="" class="style_employee_avatar">
                                            </td>
                                            <td>${employee.employeeId}</td>
                                            <td>${employee.employeeName}</td>
                                            <td>${employee.department.departmentName}</td>
                                            <td>${employee.employeeEmail}</td>
                                            <td class="style_employee_search_form_table_action_wrapper">
                                                <button class="style_employee_search_form_table_action_view_button style_form_view_button" onclick="load_employee_to_view(${employee.employeeId})">
                                                    <svg style="fill: white; padding-top: 4px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                                    <g>
                                                    <path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"></path>
                                                    </g>
                                                    </svg>
                                                </button>
                                                <button class="style_employee_search_form_table_action_edit_button style_form_edit_button" onclick="load_employee_to_edit(${employee.employeeId})">
                                                    <svg style="fill: white; padding-top: 2px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                                    <g>
                                                    <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>
                                                    </g>
                                                    </svg>
                                                </button>
                                                <button class="style_employee_search_form_table_action_delete_button style_form_delete_button" onclick="load_employee_to_delete(${employee.employeeId})">
                                                    <svg style="fill: white; padding-top: 4px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                                    <g>
                                                    <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                                                    </g>
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

                    <div class="style_employee_pagination_wrapper">
                        <ul class="style_pagination">
                            <li class="style_pagination_item" id="id_pagination_item_previous">
                                <c:choose>
                                    <c:when test="${requestScope.current_page_number > 1 && requestScope.current_page_number <= requestScope.total_pages}">
                                        <c:url var="pagination_previous_button_action" value="http://localhost:8080/corp_management_webapp/employee/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.current_page_number - 1}"></c:url>
                                    </c:when>
                                    <c:when test="${requestScope.current_page_number <= 1}">
                                        <c:url var="pagination_previous_button_action" value="http://localhost:8080/corp_management_webapp/employee/?employee_search_name=${requestScope.current_search_name}&page=1"></c:url>
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
                                        <c:url var="pagination_next_button_action" value="http://localhost:8080/corp_management_webapp/employee/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.current_page_number + 1}"></c:url>
                                    </c:when>
                                    <c:when test="${requestScope.current_page_number >= requestScope.total_pages}">
                                        <c:url var="pagination_next_button_action" value="http://localhost:8080/corp_management_webapp/employee/?employee_search_name=${requestScope.current_search_name}&page=${requestScope.total_pages}"></c:url>
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
        <div class="style_employee_detail_wrapper" id="id_employee_detail_wrapper">
            <div class="style_employee_detail_modal" id="id_employee_detail_modal">
                <button class="style_employee_detail_modal_close_button" onclick="toggle_employee_detail()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_employee_detail_modal_content" id="id_employee_detail_modal_content">
                    <div class="style_employee_detail_modal_avatar" id="id_employee_detail_modal_avatar">
                        <img id="id_view_employee_avatar" src="${img_avatar_view}" alt="">
                    </div>
                    <div class="style_employee_detail_modal_content_viewport">
                        <div class="style_employee_detail_modal_content_wrapper">
                            <div class="style_employee_detail_modal_content_item">
                                <div class="style_employee_detail_modal_content_item_label">ID:</div>
                                <div class="style_employee_detail_modal_content_item_text" id="id_view_employee_id">
                                    1
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item">
                                <div class="style_employee_detail_modal_content_item_label">Full Name:</div>
                                <div class="style_employee_detail_modal_content_item_text" id="id_view_employee_name">
                                    James Butt
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Department:</div>
                                <div class="style_employee_detail_modal_content_item_text" id="id_view_employee_department">
                                    Accounting and Finance
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Gender:</div>
                                <div class="style_employee_detail_modal_content_item_text"  id="id_view_employee_gender">
                                    Male
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Date of Birth:</div>
                                <div class="style_employee_detail_modal_content_item_text" id="id_view_employee_date_of_birth">
                                    14-10-1989
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Salary:</div>
                                <div class="style_employee_detail_modal_content_item_text"  id="id_view_employee_salary">
                                    $9853
                                </div>
                            </div>
                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Level:</div>
                                <div class="style_employee_detail_modal_content_item_text"  id="id_view_employee_level">
                                    6
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Phone Number:</div>
                                <div class="style_employee_detail_modal_content_item_text"  id="id_view_employee_phone_number">
                                    504-621-8927
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Email:</div>
                                <div class="style_employee_detail_modal_content_item_text"  id="id_view_employee_email">
                                    jbutt@gmail.com
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_employee_detail_wrapper" id="id_employee_edit_form_wrapper">
            <div class="style_employee_detail_modal" id="id_employee_edit_form_modal">
                <button class="style_employee_detail_modal_close_button" onclick="toggle_employee_edit_form()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_employee_detail_modal_content" id="id_employee_detail_modal_content">
                    <div class="style_employee_detail_modal_avatar" id="id_employee_detail_modal_avatar">
                        <img id="id_edit_employee_avatar" src="${img_avatar}" alt="">
                        <div class="style_employee_detail_modal_avatar_cover">
                            <input class="style_employee_detail_modal_avatar_upload" type="file" accept="image/*" title=" " name="employee_edit_avatar" onchange="read_url(this, 'id_edit_employee_avatar')">

                            <div class="style_employee_detail_modal_avatar_cover_text">
                                <svg style="fill: white; height: 30px; width: 30px; margin-left: 5px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                <g>
                                <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>
                                </g>
                                </svg>
                                <br> Change avatar
                            </div>
                        </div>
                    </div>
                    <div class="style_employee_detail_modal_content_viewport">
                        <div class="style_employee_detail_modal_content_wrapper">
                            <div class="style_employee_detail_modal_content_item">
                                <div class="style_employee_detail_modal_content_item_label">ID:</div>
                                <div class="style_employee_detail_modal_content_item_text" style="font-weight: 600; margin-left: 0;" id="id_edit_employee_id">
                                    1
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item">
                                <div class="style_employee_detail_modal_content_item_label">Full Name:</div>
                                <input type="text" value="James Butt" name="employee_edit_name" class="style_form_input_text" id="id_edit_employee_name"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_1')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_1')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_1" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_1" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Department:</div>
                                <select name="employee_edit_department" id="id_edit_employee_department" class="style_form_combo_box" style="width: 96%">
                                    <option value="1">Production</option>

                                    <option value="2">Research and Development</option>

                                    <option value="3">Purchasing</option>

                                    <option value="4">Marketing</option>

                                    <option value="5">Human Resource Management</option>

                                    <option value="6">Accounting and Finance</option>

                                    <option value="7">Public Relations</option>

                                    <option value="8">Sales</option>

                                    <option value="9">IT</option>

                                    <option value="10">Customer Service</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Gender:</div>
                                <select name="employee_edit_gender" id="id_edit_employee_gender" class="style_form_combo_box" style="width: 96%">
                                    <option value="Male">Male</option>

                                    <option value="Female">Female</option>

                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Date of Birth:</div>
                                <input id="id_edit_employee_date_of_birth" name="employee_edit_date_of_birth" type="date" value="1989-10-14" class="style_form_input_date" onfocus="show_focus_border('id_employee_detail_form_input_focus_border_4')"
                                       onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_4')">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_4" style="width: 60%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_4" style="width: 60%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Salary:</div>
                                <input type="text" value="$9853" name="employee_edit_salary" class="style_form_input_text" id="id_edit_employee_salary"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_5')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_5')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_5" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_5" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Level:</div>
                                <select name="employee_edit_level" id="id_edit_employee_level" class="style_form_combo_box" style="width: 96%">
                                    <option value="1">1</option>

                                    <option value="2">2</option>

                                    <option value="3">3</option>

                                    <option value="4">4</option>

                                    <option value="5">5</option>

                                    <option value="6">6</option>

                                    <option value="7">7</option>

                                    <option value="8">8</option>

                                    <option value="9">9</option>

                                    <option value="10">10</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Phone Number:</div>
                                <input type="text" value="504-621-8927" name="employee_edit_phone_number" class="style_form_input_text" id="id_edit_employee_phone_number"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_7')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_7')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_7" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_7" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Email:</div>
                                <input type="text" value="jbutt@gmail.com" name="employee_edit_email" class="style_form_input_text" id="id_edit_employee_email"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_8')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_8')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_8" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_8" style="width: 96%;"></div>
                            </div>

                            <div>
                                <button id="id_employee_edit_button" class="style_employee_detail_form_submit_button style_primary_button">edit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_employee_detail_wrapper" id="id_employee_add_form_wrapper">
            <div class="style_employee_detail_modal" id="id_employee_add_form_modal">
                <button class="style_employee_detail_modal_close_button" onclick="toggle_employee_add_form()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_employee_detail_modal_content" id="id_employee_detail_modal_content">
                    <div class="style_employee_detail_modal_avatar" id="id_employee_add_form_avatar">
                        <img alt="" id="id_employee_add_form_avatar_image" src="data:image/png;base64,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">
                        <div class="style_employee_detail_modal_avatar_cover">
                            <input class="style_employee_detail_modal_avatar_upload" id="id_employee_add_form_avatar_input" type="file" accept="image/*" title=" " name="employee_add_avatar" onchange="read_url(this, 'id_employee_add_form_avatar_image')">

                            <div class="style_employee_detail_modal_avatar_cover_text">
                                <svg style="fill: white; height: 30px; width: 30px; margin-left: 5px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                <g>
                                <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>
                                </g>
                                </svg>
                                <br> Change avatar
                            </div>
                        </div>
                    </div>
                    <div class="style_employee_detail_modal_content_viewport">
                        <div class="style_employee_detail_modal_content_wrapper">
                            <div class="style_employee_detail_modal_content_item">
                                <div class="style_employee_detail_modal_content_item_label">Full Name:</div>
                                <input type="text" value="" name="employee_add_name" class="style_form_input_text" id="id_employee_detail_add_form_modal_employee_name"
                                       onfocus="show_focus_border('id_employee_detail_add_form_input_focus_border_1')" onfocusout="hide_focus_border('id_employee_detail_add_form_input_focus_border_1')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_add_form_input_border_1" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_add_form_input_focus_border_1" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Department:</div>
                                <select name="" id="employee_add_department" class="style_form_combo_box" style="width: 96%">
                                    <option value="1">Production</option>

                                    <option value="2">Research and Development</option>

                                    <option value="3">Purchasing</option>

                                    <option value="4">Marketing</option>

                                    <option value="5">Human Resource Management</option>

                                    <option value="6">Accounting and Finance</option>

                                    <option value="7">Public Relations</option>

                                    <option value="8">Sales</option>

                                    <option value="9">IT</option>

                                    <option value="10">Customer Service</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Gender:</div>
                                <select name="" id="employee_add_gender" class="style_form_combo_box" style="width: 96%">
                                    <option value="Male">Male</option>

                                    <option value="Female">Female</option>

                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Date of Birth:</div>
                                <input name="employee_add_date_of_birth" type="date" value="" class="style_form_input_date" onfocus="show_focus_border('id_employee_detail_add_form_input_focus_border_4')"
                                       onfocusout="hide_focus_border('id_employee_detail_add_form_input_focus_border_4')">
                                <div class="style_form_textfield_border" id="id_employee_detail_add_form_input_border_4" style="width: 60%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_add_form_input_focus_border_4" style="width: 60%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Salary:</div>
                                <input type="text" value="" name="employee_add_salary" class="style_form_input_text" id="id_employee_detail_add_form_modal_employee_salary"
                                       onfocus="show_focus_border('id_employee_detail_add_form_input_focus_border_5')" onfocusout="hide_focus_border('id_employee_detail_add_form_input_focus_border_5')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_add_form_input_border_5" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_add_form_input_focus_border_5" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Level:</div>
                                <select name="" id="employee_add_level" class="style_form_combo_box" style="width: 96%">
                                    <option value="1">1</option>

                                    <option value="2">2</option>

                                    <option value="3">3</option>

                                    <option value="4">4</option>

                                    <option value="5">5</option>

                                    <option value="6">6</option>

                                    <option value="7">7</option>

                                    <option value="8">8</option>

                                    <option value="9">9</option>

                                    <option value="10">10</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Phone Number:</div>
                                <input type="text" value="" name="employee_add_phone_number" class="style_form_input_text" id="id_employee_detail_add_form_modal_employee_phone_number"
                                       onfocus="show_focus_border('id_employee_detail_add_form_input_focus_border_7')" onfocusout="hide_focus_border('id_employee_detail_add_form_input_focus_border_7')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_add_form_input_border_7" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_add_form_input_focus_border_7" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Email:</div>
                                <input type="text" value="" name="employee_add_email" class="style_form_input_text" id="id_employee_detail_add_form_modal_employee_email"
                                       onfocus="show_focus_border('id_employee_detail_add_form_input_focus_border_8')" onfocusout="hide_focus_border('id_employee_detail_add_form_input_focus_border_8')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_add_form_input_border_8" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_add_form_input_focus_border_8" style="width: 96%;"></div>
                            </div>

                            <div>
                                <button class="style_employee_detail_form_submit_button style_success_button" onclick="add_employee()">add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_employee_detail_wrapper" id="id_employee_delete_form_wrapper">
            <div class="style_employee_detail_modal" id="id_employee_delete_form_modal">
                <button class="style_employee_detail_modal_close_button" onclick="toggle_employee_delete_form()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_employee_detail_modal_content" id="id_employee_detail_modal_content">
                    <div class="style_employee_detail_modal_content_item_label" style="color: black;">Please confirm the ID of the employee you want to delete:</div>
                    <input type="text" value="" name="employee_delete_id" class="style_form_input_text" id="id_employee_delete_form_modal_employee_id"
                           onfocus="show_focus_border('id_employee_delete_form_input_focus_border')" onfocusout="hide_focus_border('id_employee_delete_form_input_focus_border')"
                           style="margin-top: 0px;">
                    <div class="style_form_textfield_border" id="id_employee_delete_form_input_border" style="width: 96%;"></div>
                    <div class="style_form_textfield_focus_border" id="id_employee_delete_form_input_focus_border" style="width: 96%;"></div>                    
                    <div>
                        <button id="id_employee_delete_button" class="style_employee_detail_form_submit_button style_danger_button">delete</button>
                    </div>
                    <div style='margin-top: 100px; color: #f44336;'>
                        <h2 id="id_employee_delete_message">
                            ID does not match. Failed to delete.
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_employee_detail_wrapper" id="id_employee_success_form_wrapper">
            <div class="style_employee_detail_modal" id="id_employee_success_form_modal">
                <button class="style_employee_detail_modal_close_button" onclick="employee_success_form_button_action()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_employee_detail_modal_content" id="id_employee_success_form_modal_content">
                    <div style="height: 128px; width: 128px; border-radius: 50%; margin-left: 166px; box-shadow: 0 14px 26px -12px rgba(153, 153, 153, 0.42),
                         0 4px 23px 0px rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(153, 153, 153, 0.2);">
                        <img src="${img_checked}">
                    </div>
                    <div id="id_employee_success_form_message" style="text-align: center; font-size: 35px; margin-top: 60px;">
                        Add Employee Successful !
                    </div>
                    <div>
                        <button onclick="employee_success_form_button_action()" class="style_success_button" style="font-size: 16px;margin-left: 170px; margin-top: 60px;">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="${js_jquery}"></script>
    <script src="${js_myeffects}"></script>
    <script>
                            //Preview avatar image before upload
                            function read_url(input, target_image_source) {
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();

                                    reader.onload = function (e) {
                                        $('#' + target_image_source).attr('src', e.target.result);
                                    };

                                    reader.readAsDataURL(input.files[0]);
                                }
                            }

                            function load_employee_to_view(view_employee_id) {
                                $.ajax({
                                    type: "GET",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/employee/" + view_employee_id,
                                    dataType: 'json',
                                    timeout: 10000,
                                    success: function (data) {
                                        $("#id_view_employee_id").text(data.id);
                                        $("#id_view_employee_name").text(data.employeeName);
                                        $("#id_view_employee_department").text(data.departmentName);
                                        $("#id_view_employee_gender").text(data.employeeGender);
                                        $("#id_view_employee_date_of_birth").text(new Date(data.employeeDateOfBirth).toLocaleDateString());
                                        $("#id_view_employee_salary").text(data.employeeSalary);
                                        $("#id_view_employee_level").text(data.employeeLevel);
                                        $("#id_view_employee_phone_number").text(data.employeePhoneNumber);
                                        $("#id_view_employee_email").text(data.employeeEmail);
                                        $("#id_view_employee_avatar").attr("src", "http://localhost:8080/corp_management_webapp/" + data.employeeAvatar);
                                        toggle_employee_detail();
                                    }
                                });
                            }

                            function load_employee_to_edit(edit_employee_id) {
                                $.ajax({
                                    type: "GET",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/employee/" + edit_employee_id,
                                    dataType: 'json',
                                    timeout: 10000,
                                    success: function (data) {
                                        $("#id_edit_employee_id").text(data.id);
                                        $("#id_edit_employee_name").val(data.employeeName);
                                        $("#id_edit_employee_department").val(data.departmentId);
                                        $("#id_edit_employee_gender").val(data.employeeGender);
                                        var date = new Date(data.employeeDateOfBirth);
                                        var day = ("0" + date.getDate()).slice(-2);
                                        var month = ("0" + (date.getMonth() + 1)).slice(-2);
                                        var year = date.getFullYear();
                                        $("#id_edit_employee_date_of_birth").val(year + "-" + month + "-" + day);
                                        $("#id_edit_employee_salary").val(data.employeeSalary);
                                        $("#id_edit_employee_level").val(data.employeeLevel);
                                        $("#id_edit_employee_phone_number").val(data.employeePhoneNumber);
                                        $("#id_edit_employee_email").val(data.employeeEmail);
                                        $("#id_edit_employee_avatar").attr("src", "http://localhost:8080/corp_management_webapp/" + data.employeeAvatar);
                                        $("#id_employee_edit_button").attr("onclick", 'edit_employee(' + data.id + ')');
                                        toggle_employee_edit_form();
                                    }
                                });
                            }

                            function load_employee_to_delete(delete_employee_id) {
                                $("#id_employee_delete_button").attr("onclick", 'delete_employee(' + delete_employee_id + ')');
                                toggle_employee_delete_form();
                            }



                            function add_employee() {
                                var branchId = 1;
                                var departmentId = parseInt($('#employee_add_department').val());
                                var employeeName = $('input[name=employee_add_name]').val().trim();
                                var employeeGender = $('#employee_add_gender').val();
                                var employeeAvatar = $('#id_employee_add_form_avatar_image').attr('src');
                                var employeeDateOfBirth = $('input[name=employee_add_date_of_birth]').val();
                                var employeeSalary = parseFloat($('input[name=employee_add_salary]').val().trim());
                                var employeeLevel = parseInt($('#employee_add_level').val());
                                var employeePhoneNumber = $('input[name=employee_add_phone_number]').val().trim();
                                var employeeEmail = $('input[name=employee_add_email]').val().trim();
                                var employeeDescription = 'null';
                                var employeeModifiedDate = new Date();
                                let data = {
                                    "branchId": branchId,
                                    "departmentId": departmentId,
                                    "employeeName": employeeName,
                                    "employeeGender": employeeGender,
                                    "employeeAvatar": employeeAvatar,
                                    "employeeDateOfBirth": employeeDateOfBirth,
                                    "employeeSalary": employeeSalary,
                                    "employeeLevel": employeeLevel,
                                    "employeePhoneNumber": employeePhoneNumber,
                                    "employeeEmail": employeeEmail,
                                    "employeeDescription": employeeDescription,
                                    "modifiedDate": employeeModifiedDate
                                };
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/employee",
                                    data: JSON.stringify(data),
                                    dataType: "json",
                                    timeout: 10000,
                                    success: function (response_data) {
                                        toggle_employee_add_form();
                                        $("#id_employee_success_form_message").text('Add Employee Successful !');
                                        toggle_employee_success_form();
                                    }
                                });
                            }

                            function edit_employee(edit_employee_id) {
                                var branchId = 1;
                                var departmentId = parseInt($('#id_edit_employee_department').val());
                                var departmentName = $('#id_edit_employee_department option:selected').text();
                                var employeeName = $('input[name=employee_edit_name]').val().trim();
                                var employeeGender = $('#id_edit_employee_gender').val();
                                var employeeAvatar = $('#id_edit_employee_avatar').attr('src');
                                var employeeDateOfBirth = $('input[name=employee_edit_date_of_birth]').val();
                                var employeeSalary = parseFloat($('input[name=employee_edit_salary]').val().trim());
                                var employeeLevel = parseInt($('#id_edit_employee_level').val());
                                var employeePhoneNumber = $('input[name=employee_edit_phone_number]').val().trim();
                                var employeeEmail = $('input[name=employee_edit_email]').val().trim();
                                var employeeDescription = 'null';
                                var employeeModifiedDate = new Date();
                                let data = {
                                    "branchId": branchId,
                                    "departmentId": departmentId,
                                    "departmentName": departmentName,
                                    "employeeName": employeeName,
                                    "employeeGender": employeeGender,
                                    "employeeAvatar": employeeAvatar,
                                    "employeeDateOfBirth": employeeDateOfBirth,
                                    "employeeSalary": employeeSalary,
                                    "employeeLevel": employeeLevel,
                                    "employeePhoneNumber": employeePhoneNumber,
                                    "employeeEmail": employeeEmail,
                                    "employeeDescription": employeeDescription,
                                    "modifiedDate": employeeModifiedDate
                                };
                                $.ajax({
                                    type: "PUT",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/employee/" + edit_employee_id,
                                    data: JSON.stringify(data),
                                    dataType: "json",
                                    timeout: 10000,
                                    success: function (response_data) {
                                        toggle_employee_edit_form();
                                        $("#id_employee_success_form_message").text('Edit Employee Successful !');
                                        toggle_employee_success_form();
                                    }
                                });
                            }

                            function delete_employee(delete_employee_id) {
                                var confirm_delete_employee_id = parseInt($('input[name=employee_delete_id]').val());
                                if (confirm_delete_employee_id === delete_employee_id) {
                                    $.ajax({
                                        type: "DELETE",
                                        contentType: "application/json",
                                        url: "${pageContext.servletContext.contextPath}/employee/" + delete_employee_id,
                                        dataType: "json",
                                        timeout: 10000,
                                        success: function (response_data) {
                                            toggle_employee_delete_form();
                                            $("#id_employee_success_form_message").text('Delete Employee Successful !');
                                            toggle_employee_success_form();
                                        }
                                    });
                                } else {
                                    $("#id_employee_delete_message").text("ID does not match. Failed to delete");
                                }

                            }





    </script>

</html>
