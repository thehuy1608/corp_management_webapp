/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var department_home = 'http://localhost:8080/corp_management_webapp/department/';

//GET LIST OF ALL DEPARTMENTS
function get_all_departments() {
    $.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: department_home,
        dataType: 'json',
        timeout: 10000,
        success: function (data) {
            $('#id_department_management_search_form_table > tbody').empty();
            $.each(data, function (index, department) {
                var department_name_id = 'id_department_list_item_name_' + (index + 1);
                $('#id_department_management_search_form_table > tbody').append(
                        '<tr>' +
                        '<td id="' + department_name_id + '">' + (index + 1) + '</td>' +
                        '<td>' + department.departmentName + '</td>' +
                        '<td class="style_department_search_form_table_action_wrapper">' + '<button class="style_department_search_form_table_action_view_button style_form_view_button" ' +
                        '                                                onclick="view_department' +
                        '                                            <svg style="fill: white; padding-top: 4px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">' +
                        '                                            <g>' +
                        '                                            <path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"></path>' +
                        '                                            </g>' +
                        '                                            </svg>' +
                        '                                        </button>' +
                        '                                        <button class="style_department_search_form_table_action_edit_button style_form_edit_button" ' +
                        '                                                onclick="">' +
                        '                                            <svg style="fill: white; padding-top: 2px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">' +
                        '                                            <g>' +
                        '                                            <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>' +
                        '                                            </g>' +
                        '                                            </svg>' +
                        '                                        </button>' +
                        '                                        <button class="style_department_search_form_table_action_delete_button style_form_delete_button">' +
                        '                                            <svg style="fill: white; padding-top: 4px;" focusable="false" viewBox="0 0 24 24" aria-hidden="true">' +
                        '                                            <g>' +
                        '                                            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>' +
                        '                                            </g>' +
                        '                                            </svg>' +
                        '                                        </button>' + '</td>' +
                        '</tr>'
                        );
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus + errorThrown);
        }
    });
}


$('#id_department_management_search_form_button').click(function (event) {
    event.preventDefault();
    get_all_departments();
});


//Load Current Department via AJAX to modal view
function load_department_to_view(view_department_id) {
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "${pageContext.servletContext.contextPath}/department/get_department?department_id=" + view_department_id,
        dataType: 'json',
        timeout: 10000
    }).then(function (data) {
        $('#view_department_id').text(data.departmentId);
        $('#view_department_name').text(data.departmentName);
        toggle_department_detail();
    });
}
;

//Load Current Department via AJAX to modal form
function load_department_to_form(edit_department_id) {
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "${pageContext.servletContext.contextPath}/department/get_department?department_id=" + edit_department_id,
        dataType: 'json',
        timeout: 10000
    }).then(function (data) {
        $('#edit_department_id').val(data.departmentId);
        $('#edit_department_name').val(data.departmentName);
        toggle_department_detail_form();
    });
}
;

//Edit Current Department On Form
function edit_department() {
    var department_id = $('#edit_department_id').val();
    var department_name = $('#edit_department_name').val();
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "${pageContext.servletContext.contextPath}/department/edit_department?edit_department_id=" + department_id + "&edit_department_name=" + department_name,
        dataType: 'json',
        timeout: 10000
    }).then(function (data) {
        $('#edit_department_id').val(data.departmentId);
        $('#edit_department_name').val(data.departmentName);
        var department_name_id = '#department_list_item_name_' + data.departmentId;
        $(department_name_id).text(data.departmentName);
    });
}

