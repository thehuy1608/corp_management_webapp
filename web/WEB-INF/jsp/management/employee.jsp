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
                                                <button class="style_employee_search_form_table_action_edit_button style_form_edit_button" onclick="toggle_employee_edit_form()">
                                                    <svg style="fill: white; padding-top: 2px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                                    <g>
                                                    <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>
                                                    </g>
                                                    </svg>
                                                </button>
                                                <button class="style_employee_search_form_table_action_delete_button style_form_delete_button" onclick="toggle_employee_delete_form()">
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
                        <img src="${img_avatar}" alt="">
                        <div class="style_employee_detail_modal_avatar_cover">
                            <input class="style_employee_detail_modal_avatar_upload" type="file" accept="image/*" title=" " name="employee_edit_avatar">

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
                                <div class="style_employee_detail_modal_content_item_text">
                                    1
                                </div>
                            </div>

                            <div class="style_employee_detail_modal_content_item">
                                <div class="style_employee_detail_modal_content_item_label">Full Name:</div>
                                <input type="text" value="James Butt" name="employee_edit_name" class="style_form_input_text" id="id_employee_detail_form_modal_employee_name"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_1')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_1')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_1" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_1" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Department:</div>
                                <select name="employee_edit_department" id="" class="style_form_combo_box" style="width: 96%">
                                    <option value="">Accounting and Finance</option>

                                    <option value="">IT</option>

                                    <option value="">Public Relation</option>

                                    <option value="">Human Resource</option>

                                    <option value="">Management</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Gender:</div>
                                <select name="employee_edit_gender" id="" class="style_form_combo_box" style="width: 96%">
                                    <option value="">Male</option>

                                    <option value="">Female</option>

                                    <option value="">Other</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Date of Birth:</div>
                                <input name="employee_edit_date_of_birth" type="date" value="1989-10-14" class="style_form_input_date" onfocus="show_focus_border('id_employee_detail_form_input_focus_border_4')"
                                       onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_4')">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_4" style="width: 60%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_4" style="width: 60%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Salary:</div>
                                <input type="text" value="$9853" name="employee_edit_salary" class="style_form_input_text" id="id_employee_detail_form_modal_employee_salary"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_5')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_5')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_5" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_5" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Level:</div>
                                <select name="employee_edit_level" id="" class="style_form_combo_box" style="width: 96%">
                                    <option value="">1</option>

                                    <option value="">2</option>

                                    <option value="">3</option>

                                    <option value="">4</option>

                                    <option value="">5</option>

                                    <option selected value="">6</option>

                                    <option value="">7</option>

                                    <option value="">8</option>

                                    <option value="">9</option>

                                    <option value="">10</option>
                                </select>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Phone Number:</div>
                                <input type="text" value="504-621-8927" name="employee_edit_phone_number" class="style_form_input_text" id="id_employee_detail_form_modal_employee_phone_number"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_7')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_7')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_7" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_7" style="width: 96%;"></div>
                            </div>

                            <div class="style_employee_detail_modal_content_item ">
                                <div class="style_employee_detail_modal_content_item_label">Email:</div>
                                <input type="text" value="jbutt@gmail.com" name="employee_edit_email" class="style_form_input_text" id="id_employee_detail_form_modal_employee_email"
                                       onfocus="show_focus_border('id_employee_detail_form_input_focus_border_8')" onfocusout="hide_focus_border('id_employee_detail_form_input_focus_border_8')"
                                       style="margin-top: 0px;">
                                <div class="style_form_textfield_border" id="id_employee_detail_form_input_border_8" style="width: 96%;"></div>
                                <div class="style_form_textfield_focus_border" id="id_employee_detail_form_input_focus_border_8" style="width: 96%;"></div>
                            </div>

                            <div>
                                <button class="style_employee_detail_form_submit_button style_primary_button">edit</button>
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
                        <img src="${img_avatar}" alt="" id="id_employee_add_form_avatar_image">
                        <div class="style_employee_detail_modal_avatar_cover">
                            <input class="style_employee_detail_modal_avatar_upload" id="id_employee_add_form_avatar_input" type="file" accept="image/*" title=" " name="employee_add_avatar" onchange="read_url(this)">

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
                        <button class="style_employee_detail_form_submit_button style_danger_button">delete</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_employee_detail_wrapper" id="id_employee_success_form_wrapper">
            <div class="style_employee_detail_modal" id="id_employee_success_form_modal">
                <button class="style_employee_detail_modal_close_button" onclick="toggle_employee_success_form()">
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
                </div>
            </div>
        </div>
    </body>
    <script src="${js_jquery}"></script>
    <script src="${js_myeffects}"></script>
    <script>
                    //Preview avatar image before upload
                    function read_url(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                $('#id_employee_add_form_avatar_image').attr('src', e.target.result);
                            };

                            reader.readAsDataURL(input.files[0]);
                        }
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
                        console.log(JSON.stringify(data));
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
                                $("#id_view_employee_date_of_birth").text(data.employeeDateOfBirth);
                                $("#id_view_employee_salary").text(data.employeeSalary);
                                $("#id_view_employee_level").text(data.employeeLevel);
                                $("#id_view_employee_phone_number").text(data.employeePhoneNumber);
                                $("#id_view_employee_email").text(data.employeeEmail);
                                $("#id_view_employee_avatar").attr("src", "http://localhost:8080/corp_management_webapp/" + data.employeeAvatar);
                                toggle_employee_detail();
                            }
                        });
                    }
    </script>

</html>
