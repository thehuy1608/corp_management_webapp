<%-- 
    Document   : login
    Created on : Jun 21, 2018, 12:42:35 PM
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
    <spring:url var="css_components" value="/assets/css/components.css" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="css_side_menu" value="/assets/css/side_menu.css" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="js_myeffects" value="/assets/js/my_effects.js" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="js_jquery" value="/assets/js/jquery_3.3.1.js" context="${pageContext.servletContext.contextPath}"></spring:url>
        <spring:url var="background_image" value="/assets/images/background/side_menu/side_menu_background_v1.jpg"></spring:url>
    
        <link rel="stylesheet" href="${css_components}">
        <link rel="stylesheet" href="${css_side_menu}">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
    <style>
        body{margin:0;padding:0;font-family:Roboto,sans-serif;height:100vh;width:100vw}.background_wrapper{position:fixed;background-image:url(${background_image});background-position:center center;height:100%;width:100%}.main_container{position:absolute;z-index:50;display:grid;grid-template-columns:auto 400px auto;grid-template-rows:auto 500px auto;background-color:transparent;width:100%;height:100%}.login_form_modal{grid-row:2/3;grid-column:2/3;background-color:#fff;border-radius:6px;box-shadow:1px 1px 4px 0 rgba(0,0,0,.14)}.login_form_wrapper{width:80%;margin-left:10%}.style_login_message{font-size:16px;font-weight:bolder;letter-spacing:1px;color:red;margin-top:30px}.login_form_loginname_wrapper{margin-top:10px}.login_form_password_wrapper{margin-top:30px}.login_form_submit_button_wrapper{margin-left:calc((100% - 120px)/ 2);margin-top:50px}.login_form_submit_with_face_button_wrapper{margin-left:calc((100% - 120px)/ 2);margin-top:30px}.style_forget_password_wrapper{text-align:right;margin-top:50px}.style_forget_password{font-size:18px;text-decoration:none;outline:0;color:#07337a;transition:.3s ease}.style_forget_password:hover{color:#ff4500;transition:.3s ease}
    </style>
    <title>Login</title>
</head>

<body>
    <div class="background_wrapper"></div>
    <div class="main_container">
        <div class="login_form_modal">
            <form action="${pageContext.servletContext.contextPath}/login" class="login_form_wrapper" method="POST">
                <div class="style_login_message">
                    ${requestScope.login_message}
                </div>
                <div class="login_form_loginname_wrapper">
                    <label for="id_login_form_input_loginname" class="style_form_input_text_label" id="id_login_form_input_loginname_label">Login Name</label>
                    <input type="text" name="loginname" value="" class="style_form_input_text" id="id_login_form_input_loginname" onfocus="show_focus_border('id_login_form_input_loginname_focus_border'); show_focus_label('id_login_form_input_loginname_label');"
                           onfocusout="hide_focus_border('id_login_form_input_loginname_focus_border'); hide_focus_label('id_login_form_input_loginname_label', 'id_login_form_input_loginname');" required>
                    <div class="style_form_textfield_border" id="id_login_form_input_loginname_border"></div>
                    <div class="style_form_textfield_focus_border" id="id_login_form_input_loginname_focus_border"></div>
                </div>
                <div class="login_form_password_wrapper">
                    <label for="id_login_form_input_password" class="style_form_input_text_label" id="id_login_form_input_password_label">Password</label>
                    <input type="password" name="password" value="" class="style_form_input_text" id="id_login_form_input_password" onfocus="show_focus_border('id_login_form_input_password_focus_border'); show_focus_label('id_login_form_input_password_label');"
                           onfocusout="hide_focus_border('id_login_form_input_password_focus_border'); hide_focus_label('id_login_form_input_password_label', 'id_login_form_input_password');" required>
                    <div class="style_form_textfield_border" id="id_login_form_input_password_border"></div>
                    <div class="style_form_textfield_focus_border" id="id_login_form_input_password_focus_border"></div>
                </div>
                <div class="login_form_submit_button_wrapper">
                    <button name="account" style="text-transform: capitalize;" type="submit" class="style_primary_button">Sign in</button>
                </div>
                <div style="margin-top: 30px; text-align: center; font-size: 16px; font-weight: bold;">OR</div>
                <div class="login_form_submit_with_face_button_wrapper">
                    <button style="text-transform: capitalize;" type="submit" class="style_success_button">Login with Face</button>
                </div>
                <spring:url var="forget_password_link" value="/login/forget_password"></spring:url>
                <div class="style_forget_password_wrapper">
                    <a href="${forget_password_link}" class="style_forget_password">Forget password?</a>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="${js_jquery}"></script>
                <script src="${js_myeffects}"></script>

</html>
