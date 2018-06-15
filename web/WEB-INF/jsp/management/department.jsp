<%-- 
    Document   : department
    Created on : Jun 7, 2018, 7:51:35 PM
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
        <link rel="stylesheet" href="${css_components}">
        <link rel="stylesheet" href="${css_side_menu}">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
        <style>
            body{margin:0;padding:0;width:100%;min-height:768px;height:100%;font-family:Roboto,sans-serif}.style_main_container{float:right;display:grid;grid-template-columns:100px auto 100px;grid-template-rows:80px 50px auto 50px;width:calc(100% - 260px);min-height:768px;height:auto;background-color:#eee;transition:.35s ease}.style_main_container_expand{width:calc(100% - 80px);transition:.35s ease}.style_department_management_search_form_wrapper{grid-column:2/3;grid-row:3/4}.style_department_management_search_form{display:grid;grid-template-columns:auto;grid-template-rows:80px 20px}.style_department_management_search_form_search_field_wrapper{grid-row:1/2;display:grid;grid-template-columns:auto 50px}.style_department_management_search_form_input_text_wrapper{grid-column:1/2;width:100%;height:60px;align-self:center}.style_department_management_search_form_button{grid-column:2/3;justify-self:right;align-self:center}.style_department_management_search_form_table_wrapper{grid-row:2/3;width:100%;display:grid;grid-template-rows:60px auto 25px;grid-template-columns:20px auto 20px;background-color:#fff;border-radius:6px;box-shadow:0 1px 4px 0 rgba(0,0,0,.14)}.style_department_management_search_form_table_result{grid-row:1/2;grid-column:2/3;font-size:18px;color:#3c4858;align-self:center}.style_department_management_search_form_table{grid-row:2/3;grid-column:2/3;width:100%;border-collapse:collapse;font-size:1em}.style_department_management_search_form_table tr{height:50px;border-bottom:1px solid #d3d3d3}.style_department_management_search_form_table tr:last-child{border:none}.style_department_management_search_form_table td,th{padding:5px}.style_department_management_search_form_table th{color:rgba(0,0,0,.87);text-align:left;font-weight:300;font-size:18px}.style_department_management_search_form_table th:last-child{text-align:right}.style_department_management_search_form_table td{color:rgba(0,0,0,.87)}.style_department_search_form_table_action_wrapper{padding:0!important;display:grid;grid-template-columns:auto 50px 50px 50px 10px;grid-template-rows:50px}.style_department_search_form_table_action_view_button{grid-column:2/3;grid-row:1/2}.style_department_search_form_table_action_edit_button{grid-column:3/4;grid-row:1/2}.style_department_search_form_table_action_delete_button{grid-column:4/5;grid-row:1/2}.style_department_detail_wrapper{position:fixed;width:100%;min-height:768px;height:auto;z-index:20;visibility:hidden;opacity:0;background-color:rgba(0,0,0,.3);transition:all .5s linear}.style_department_detail_wrapper_toggle{visibility:visible;opacity:1;transition:all .2s linear}.style_department_detail_modal{position:absolute;width:500px;height:400px;margin-top:-500px;margin-left:calc((100vw - 500px)/ 2);background-color:#fff;border-radius:6px;box-shadow:0 1px 4px 0 gray;display:grid;grid-template-rows:10px 20px auto;grid-template-columns:10px auto 20px 10px;grid-gap:10px;transition:margin-top .5s ease}.style_department_detail_modal_close_button,.style_department_detail_modal_close_button>img{width:20px;display:inline-block;height:20px}.style_department_detail_modal_close_button{grid-row:2/3;grid-column:3/4;margin:0;padding:0;outline:0;border:none;background-color:transparent;cursor:pointer}.style_department_detail_modal_content{grid-row:3/4;grid-column:2/4}.style_department_detail_modal_content_item{width:auto;height:20px;line-height:30px;margin-top:30px}.style_department_detail_modal_content_item:first-child{margin-top:0}.style_department_detail_modal_content_label{font-size:18px;color:#3c4858;font-weight:600}.style_department_detail_modal_content_content{font-size:18 px;color:#3c4858;margin-left:20px}.style_department_detail_form_submit_button{float:right;margin-top:60px}
        </style>
        <title>Department</title>
    </head>

    <body>
        <div class="style_department_management_wrapper" id="id_department_management_wrapper">
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
                <div class="style_side_menu_current_item">Department</div>
                <div class="style_department_management_search_form_wrapper">
                    <form action="${pageContext.servletContext.contextPath}/department/" class="style_department_management_search_form" method="get">
                        <div class="style_department_management_search_form_search_field_wrapper">
                            <div class="style_department_management_search_form_input_text_wrapper">
                                <label for="id_department_management_search_form_input_text" class="style_form_input_text_label" id="id_department_management_search_form_input_text_label">Find department</label>
                                <input type="text" name="search_department_name" value="" class="style_form_input_text" id="id_department_management_search_form_input_text" onfocus="show_focus_border('id_department_management_search_form_input_text_focus_border'); show_focus_label('id_department_management_search_form_input_text_label');"
                                       onfocusout="hide_focus_border('id_department_management_search_form_input_text_focus_border'); hide_focus_label('id_department_management_search_form_input_text_label', 'id_department_management_search_form_input_text');">
                                <div class="style_form_textfield_border" id="id_department_management_search_form_input_text_border"></div>
                                <div class="style_form_textfield_focus_border" id="id_department_management_search_form_input_text_focus_border"></div>
                            </div>
                            <button class="style_department_management_search_form_button style_circle_button" type="submit" value="" name="">
                                <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                <g>
                                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                </g>
                                </svg>
                            </button>
                        </div>                        
                    </form>
                    <div class="style_department_management_search_form_table_wrapper">
                        <div class="style_department_management_search_form_table_result">Found ${departments_list.size()} results</div>
                        <table class="style_department_management_search_form_table">
                            <tr>
                                <th>#</th>
                                <th>Department Name</th>
                                <th>Actions</th>
                            </tr>
                            <c:set var="department_result_index" value="1"></c:set>
                            <c:forEach items="${departments_list}" var="department">
                                <tr>
                                    <td>${department_result_index}</td>
                                    <td id="department_list_item_name_${department.departmentId}">${department.departmentName}</td>
                                    <td class="style_department_search_form_table_action_wrapper">
                                        <button class="style_department_search_form_table_action_view_button style_form_view_button" 
                                                onclick="load_department_to_view(${department.departmentId});">
                                            <svg style="fill: white; padding-top: 4px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                            <g>
                                            <path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"></path>
                                            </g>
                                            </svg>
                                        </button>
                                        <button class="style_department_search_form_table_action_edit_button style_form_edit_button" 
                                                onclick="load_department_to_form(${department.departmentId});">
                                            <svg style="fill: white; padding-top: 2px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                            <g>
                                            <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>
                                            </g>
                                            </svg>
                                        </button>
                                        <button class="style_department_search_form_table_action_delete_button style_form_delete_button">
                                            <svg style="fill: white; padding-top: 4px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                            <g>
                                            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                                            </g>
                                            </svg>
                                        </button>
                                    </td>
                                    <c:set var="department_result_index" value="${department_result_index + 1}"></c:set>
                                    </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_department_detail_wrapper" id="id_department_detail_wrapper">
            <div class="style_department_detail_modal" id="id_department_detail_modal">
                <button class="style_department_detail_modal_close_button" onclick="toggle_department_detail()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_department_detail_modal_content" id="id_department_detail_modal_content">
                    <div class="style_department_detail_modal_content_item">
                        <span class="style_department_detail_modal_content_label">
                            Department ID:
                        </span>
                        <span id="view_department_id" class="style_department_detail_modal_content_content">
                        </span>
                    </div>
                    <div class="style_department_detail_modal_content_item">
                        <span class="style_department_detail_modal_content_label">
                            Department Name:
                        </span>
                        <span id="view_department_name" class="style_department_detail_modal_content_content">
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="style_department_detail_wrapper" id="id_department_detail_form_wrapper">
            <div class="style_department_detail_modal" id="id_department_detail_form_modal">
                <button class="style_department_detail_modal_close_button" onclick="toggle_department_detail_form()">
                    <img src="${img_close}" alt="">
                </button>
                <div class="style_department_detail_modal_content">
                    <div class="style_department_detail_modal_content_item">
                        <div class="style_department_detail_modal_content_label">
                            Department name:
                        </div>
                        <input type="hidden" id="edit_department_id" name="edit_department_id" value=""/>
                        <input type="text" id="edit_department_name" value="" name="edit_department_name" class="style_form_input_text"
                               onfocus="show_focus_border('id_department_management_detail_form_input_text_focus_border')" onfocusout="hide_focus_border('id_department_management_detail_form_input_text_focus_border')">
                        <div class="style_form_textfield_border" id="id_department_management_detail_form_input_text_border"></div>
                        <div class="style_form_textfield_focus_border" id="id_department_management_detail_form_input_text_focus_border"></div>
                    </div>
                    <div style="margin-top: 30px;">
                        <button onclick="edit_department()" class="style_department_detail_form_submit_button style_primary_button">edit</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="${js_jquery}"></script>
    <script src="${js_myeffects}"></script>
    <script>
                            //Load Current Department via AJAX to modal view
                            function load_department_to_view(view_department_id) {
                                $.ajax({
                                    type: "GET",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/department/" + view_department_id,
                                    dataType: 'json',
                                    timeout: 10000,
                                    success: function (data) {
                                        $('#view_department_id').text(data.id);
                                        $('#view_department_name').text(data.departmentName);
                                        toggle_department_detail();
                                    }
                                });
                            }
                            ;
                            //Load Current Department via AJAX to modal form
                            function load_department_to_form(edit_department_id) {
                                $.ajax({
                                    type: "GET",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/department/" + edit_department_id,
                                    dataType: 'json',
                                    timeout: 10000,
                                    success: function (data) {
                                        $('#edit_department_id').val(data.id);
                                        $('#edit_department_name').val(data.departmentName);
                                        toggle_department_detail_form();
                                    }
                                });
                            }
                            ;
                            //Edit Current Department On Form
                            function edit_department() {
                                var department_id = parseInt($('#edit_department_id').val());
                                var department_name = $('#edit_department_name').val();
                                let data = {"id": department_id, "departmentName": department_name};
                                console.log(JSON.stringify(data));
                                $.ajax({
                                    type: "PUT",
                                    contentType: "application/json",
                                    url: "${pageContext.servletContext.contextPath}/department/" + department_id,
                                    data: JSON.stringify(data),
                                    dataType: 'json',
                                    timeout: 10000,
                                    success: function (data) {
                                        $('#edit_department_id').val(data.departmentId);
                                        $('#edit_department_name').val(data.departmentName);
                                        var department_name_id = '#department_list_item_name_' + data.id;
                                        $(department_name_id).text(data.departmentName);
                                    }
                                });
                            }
    </script>

</html>