//Toggle side menu button onclick handler
var toggle_side_menu = function () {
    var id_side_menu = document.getElementById("id_side_menu");
    var id_main_container = document.getElementById("id_main_container");
    var id_toggle_side_menu_button_icon = document.getElementById(
            "id_toggle_side_menu_button_icon"
            );
    var id_side_menu_1 = document.getElementById("id_side_menu_1");
    var id_side_menu_2 = document.getElementById("id_side_menu_2");
    var id_side_menu_3 = document.getElementById("id_side_menu_3");
    var id_side_menu_4 = document.getElementById("id_side_menu_4");
    var id_side_menu_5 = document.getElementById("id_side_menu_5");
    var id_side_menu_6 = document.getElementById("id_side_menu_6");
    var id_side_menu_7 = document.getElementById("id_side_menu_7");
    var id_side_menu_8 = document.getElementById("id_side_menu_8");
    var id_side_menu_9 = document.getElementById("id_side_menu_9");
    var id_side_menu_10 = document.getElementById("id_side_menu_10");
    var id_side_menu_11 = document.getElementById("id_side_menu_11");

    var id_side_menu_text_1 = document.getElementById("id_side_menu_text_1");
    var id_side_menu_text_2 = document.getElementById("id_side_menu_text_2");
    var id_side_menu_text_3 = document.getElementById("id_side_menu_text_3");
    var id_side_menu_text_4 = document.getElementById("id_side_menu_text_4");
    var id_side_menu_text_5 = document.getElementById("id_side_menu_text_5");
    var id_side_menu_text_6 = document.getElementById("id_side_menu_text_6");
    var id_side_menu_text_7 = document.getElementById("id_side_menu_text_7");
    var id_side_menu_text_8 = document.getElementById("id_side_menu_text_8");
    var id_side_menu_text_9 = document.getElementById("id_side_menu_text_9");
    var id_side_menu_text_10 = document.getElementById("id_side_menu_text_10");
    var id_side_menu_text_11 = document.getElementById("id_side_menu_text_11");

    id_side_menu.classList.toggle("style_side_menu_collapse");
    id_main_container.classList.toggle("style_main_container_expand");
    id_toggle_side_menu_button_icon.classList.toggle(
            "style_toggle_side_menu_button_icon_toggle"
            );

    id_side_menu_text_1.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_2.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_3.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_4.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_5.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_6.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_7.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_8.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_9.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_10.classList.toggle("style_side_menu_item_text_toggle");
    id_side_menu_text_11.classList.toggle("style_side_menu_item_text_toggle");

    id_side_menu_1.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_2.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_3.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_4.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_5.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_6.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_7.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_8.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_9.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_10.classList.toggle("style_side_menu_item_toggle");
    id_side_menu_11.classList.toggle("style_side_menu_item_toggle");
};

//Toggle active state of side menu item when its actived or not
var side_menu_items = document.getElementsByClassName("style_side_menu_item");
var toggle_active_side_menu_item = function (element) {
    Array.prototype.forEach.call(side_menu_items, function (item) {
        if (item.classList.contains("style_side_menu_item_active")) {
            item.classList.remove("style_side_menu_item_active");
        }
    });
    element.classList.add("style_side_menu_item_active");
};


//Toggle border when focus on text field
var show_focus_border = function (id_focus_border_name) {
    var id_focus_border = document.getElementById(id_focus_border_name);
    id_focus_border.style.transform = "scaleX(1)";
};

var hide_focus_border = function (id_focus_border_name) {
    var id_focus_border = document.getElementById(id_focus_border_name);
    id_focus_border.style.transform = "scaleX(0)";
};

//Toggle label when focus on textfield
var show_focus_label = function (id_focus_label_name) {
    var id_focus_label = document.getElementById(id_focus_label_name);
    id_focus_label.style.transform = "translate(0, 0px) scale(0.75)";
};


var hide_focus_label = function (id_focus_label_name, id_input_text) {
    var input_search_value = document
            .getElementById(id_input_text)
            .value.trim();
    if (input_search_value) {
        //Do nothing
    } else {
        var id_focus_label = document.getElementById(id_focus_label_name);
        id_focus_label.style.transform = "translate(0, 20px) scale(1)";
    }
};


//Show/hide department detail
var toggle_department_detail = function () {
    var id_department_detail_wrapper = document.getElementById(
            "id_department_detail_wrapper"
            );
    var id_department_detail_modal = document.getElementById(
            "id_department_detail_modal"
            );
    var style_department_detail_modal = window.getComputedStyle(
            id_department_detail_modal
            );
    id_department_detail_wrapper.classList.toggle(
            "style_department_detail_wrapper_toggle"
            );
    if (style_department_detail_modal.marginTop === "-500px") {
        id_department_detail_modal.style.marginTop = "100px";
    } else {
        id_department_detail_modal.style.marginTop = "-500px";
    }
};

var toggle_department_detail_form = function () {
    var id_department_detail_form_wrapper = document.getElementById(
            "id_department_detail_form_wrapper"
            );
    var id_department_detail_form_modal = document.getElementById(
            "id_department_detail_form_modal"
            );
    var style_department_detail_form_modal = window.getComputedStyle(
            id_department_detail_form_modal
            );
    id_department_detail_form_wrapper.classList.toggle(
            "style_department_detail_wrapper_toggle"
            );
    if (style_department_detail_form_modal.marginTop === "-500px") {
        id_department_detail_form_modal.style.marginTop = "100px";
    } else {
        id_department_detail_form_modal.style.marginTop = "-500px";
    }
};

//Show/hide employee detail
var toggle_employee_detail = function () {
    var id_employee_detail_wrapper = document.getElementById(
            "id_employee_detail_wrapper"
            );
    var id_employee_detail_modal = document.getElementById(
            "id_employee_detail_modal"
            );
    var style_employee_detail_modal = window.getComputedStyle(
            id_employee_detail_modal
            );
    id_employee_detail_wrapper.classList.toggle(
            "style_employee_detail_wrapper_toggle"
            );
    if (style_employee_detail_modal.marginTop === "-500px") {
        id_employee_detail_modal.style.marginTop = "100px";
    } else {
        id_employee_detail_modal.style.marginTop = "-500px";
    }
};

var toggle_employee_edit_form = function () {
    var id_employee_edit_form_wrapper = document.getElementById(
            "id_employee_edit_form_wrapper"
            );
    var id_employee_edit_form_modal = document.getElementById(
            "id_employee_edit_form_modal"
            );
    var style_employee_edit_form_modal = window.getComputedStyle(
            id_employee_edit_form_modal
            );
    id_employee_edit_form_wrapper.classList.toggle(
            "style_employee_detail_wrapper_toggle"
            );
    if (style_employee_edit_form_modal.marginTop === "-500px") {
        id_employee_edit_form_modal.style.marginTop = "100px";
    } else {
        id_employee_edit_form_modal.style.marginTop = "-500px";
    }
};

var toggle_employee_add_form = function () {
    var id_employee_add_form_wrapper = document.getElementById(
            "id_employee_add_form_wrapper"
            );
    var id_employee_add_form_modal = document.getElementById(
            "id_employee_add_form_modal"
            );
    var style_employee_add_form_modal = window.getComputedStyle(
            id_employee_add_form_modal
            );
    id_employee_add_form_wrapper.classList.toggle(
            "style_employee_detail_wrapper_toggle"
            );
    if (style_employee_add_form_modal.marginTop === "-500px") {
        id_employee_add_form_modal.style.marginTop = "100px";
    } else {
        id_employee_add_form_modal.style.marginTop = "-500px";
    }
};

var toggle_employee_delete_form = function () {
    var id_employee_delete_form_wrapper = document.getElementById(
            "id_employee_delete_form_wrapper"
            );
    var id_employee_delete_form_modal = document.getElementById(
            "id_employee_delete_form_modal"
            );
    var style_employee_delete_form_modal = window.getComputedStyle(
            id_employee_delete_form_modal
            );
    id_employee_delete_form_wrapper.classList.toggle(
            "style_employee_detail_wrapper_toggle"
            );
    if (style_employee_delete_form_modal.marginTop === "-500px") {
        id_employee_delete_form_modal.style.marginTop = "100px";
    } else {
        id_employee_delete_form_modal.style.marginTop = "-500px";
    }
    $("#id_employee_delete_message").text("");
};

var toggle_employee_success_form = function () {
    var id_employee_success_form_wrapper = document.getElementById(
            "id_employee_success_form_wrapper"
            );
    var id_employee_success_form_modal = document.getElementById(
            "id_employee_success_form_modal"
            );
    var style_employee_success_form_modal = window.getComputedStyle(
            id_employee_success_form_modal
            );
    id_employee_success_form_wrapper.classList.toggle(
            "style_employee_detail_wrapper_toggle"
            );
    if (style_employee_success_form_modal.marginTop === "-500px") {
        id_employee_success_form_modal.style.marginTop = "100px";
    } else {
        id_employee_success_form_modal.style.marginTop = "-500px";
    }
};

var employee_success_form_button_action = function () {
    location.href = location.href;
};

//Show/hide performance rate up-down vote
var toggle_performance_rate_upvote = function () {
    var id_performance_rate_upvote_wrapper = document.getElementById(
            "id_performance_rate_upvote_wrapper"
            );
    var id_performance_rate_upvote_modal = document.getElementById(
            "id_performance_rate_upvote_modal"
            );
    var style_performance_rate_upvote_modal = window.getComputedStyle(
            id_performance_rate_upvote_modal
            );
    id_performance_rate_upvote_wrapper.classList.toggle(
            "style_performance_rate_detail_wrapper_toggle"
            );
    if (style_performance_rate_upvote_modal.marginTop == "-500px") {
        id_performance_rate_upvote_modal.style.marginTop = "100px";
    } else {
        id_performance_rate_upvote_modal.style.marginTop = "-500px";
    }
};

var toggle_performance_rate_downvote = function () {
    var id_performance_rate_downvote_wrapper = document.getElementById(
            "id_performance_rate_downvote_wrapper"
            );
    var id_performance_rate_downvote_modal = document.getElementById(
            "id_performance_rate_downvote_modal"
            );
    var style_performance_rate_downvote_modal = window.getComputedStyle(
            id_performance_rate_downvote_modal
            );
    id_performance_rate_downvote_wrapper.classList.toggle(
            "style_performance_rate_detail_wrapper_toggle"
            );
    if (style_performance_rate_downvote_modal.marginTop == "-500px") {
        id_performance_rate_downvote_modal.style.marginTop = "100px";
    } else {
        id_performance_rate_downvote_modal.style.marginTop = "-500px";
    }
};

var toggle_performance_rate_success = function () {
    var id_performance_rate_success_wrapper = document.getElementById(
            "id_performance_rate_success_wrapper"
            );
    var id_performance_rate_success_modal = document.getElementById(
            "id_performance_rate_success_modal"
            );
    var style_performance_rate_success_modal = window.getComputedStyle(
            id_performance_rate_success_modal
            );
    id_performance_rate_success_wrapper.classList.toggle(
            "style_performance_rate_detail_wrapper_toggle"
            );
    if (style_performance_rate_success_modal.marginTop == "-500px") {
        id_performance_rate_success_modal.style.marginTop = "100px";
    } else {
        id_performance_rate_success_modal.style.marginTop = "-500px";
    }
};

var toggle_loading_pane = function () {
    var id_loading_wrapper = document.getElementById(
            "id_loading_wrapper"
            );
    id_loading_wrapper.classList.toggle(
            "style_loading_wrapper_toggle"
            );
};

var toggle_performance_tabs_pane = function (id_tab_button_name, id_tab_name) {
    var id_tab_button = document.getElementById(id_tab_button_name);
    var id_tab = document.getElementById(id_tab_name);
    var id_tab_button_employee = document.getElementById("id_performance_result_employee_tabs");
    var id_tab_button_department = document.getElementById("id_performance_result_department_tabs");
    var id_tab_employee = document.getElementById("id_performance_employee_result_search_form_wrapper");
    var id_tab_department = document.getElementById("id_performance_result_department_search_form_wrapper");
    if (id_tab_button.classList.contains("style_performance_result_tabs_button_toggle ")) {

    } else {
        id_tab_button_employee.classList.remove("style_performance_result_tabs_button_toggle");
        id_tab_button_department.classList.remove("style_performance_result_tabs_button_toggle");
        id_tab_button.classList.add("style_performance_result_tabs_button_toggle");

        id_tab_employee.classList.remove("style_performance_result_search_form_wrapper_toggle");
        id_tab_department.classList.remove("style_performance_result_search_form_wrapper_toggle");
        id_tab.classList.add("style_performance_result_search_form_wrapper_toggle");
    }
};

function exportTableToExcel(tableID, filename = '') {
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

    // Specify file name
    filename = filename ? filename + '.xls' : 'excel_data.xls';

    // Create download link element
    downloadLink = document.createElement("a");

    document.body.appendChild(downloadLink);

    if (navigator.msSaveOrOpenBlob) {
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob(blob, filename);
    } else {
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

        // Setting the file name
        downloadLink.download = filename;

        //triggering the function
        downloadLink.click();
}
}

//var toggle_active_pagination = function (id_clicked_pagination_button) {
//    $(".style_pagination_item_button").each(function () {
//        $(this).removeClass("style_pagination_item_button_active");
//    });
//    $(id_clicked_pagination_button).addClass(
//            "style_pagination_item_button_active"
//            );
//};
//
//var load_pagination = function (n) {
//    /* 
//     var total_pages = Math.floor(Math.random() * 100) + 7;
//     var pages_period = Math.floor(total_pages / 7) + 1; */
//    var button_id_prefix = "#id_pagination_item_button_";
//    var button_id;
//    for (var i = 1; i <= 7; i++) {
//        button_id = button_id_prefix + i;
//        $(button_id).text(i + 7 * (n - 1) - 1);
//        $(button_id).removeClass("style_pagination_item_button_active");
//    }
//    $("#id_pagination_item_button_1").addClass(
//            "style_pagination_item_button_active"
//            );
//};
//
//var current_active_button = 1;
//var current_page_number = 1;
//var pagination_next_button_action = function (last_page) {
//    if (current_page_number < last_page - 1) {
//        var button_id = "#id_pagination_item_button_" + (current_active_button + 1);
//        $(button_id).click();
//        current_active_button += 1;
//        current_page_number += 1;
//        if (current_active_button === 7) {
//            current_active_button = 1;
//        }
//    } else if (current_page_number === last_page - 1) {
//        toggle_active_pagination("#id_pagination_item_button_7");
//        current_page_number += 1;
//        current_active_button = 7;
//    }
//};
//
//
//var pagination_previous_button_action = function () {
//    var button_id_prefix = "#id_pagination_item_button_";
//    var button_id;
//    if (current_page_number >= 2) {
//        if (current_active_button === 1) {
//            var n = Math.floor(current_page_number / 7);
//            for (var i = 1; i <= 7; i++) {
//                button_id = button_id_prefix + i;
//                $(button_id).text(i + 7 * (n - 1));
//                $(button_id).removeClass("style_pagination_item_button_active");
//            }
//            $("#id_pagination_item_button_6").addClass(
//                    "style_pagination_item_button_active"
//                    );
//            current_active_button = 6;
//            current_page_number -= 1;
//        } else {
//            button_id = "#id_pagination_item_button_" + (current_active_button - 1);
//            $(button_id).click();
//            current_active_button -= 1;
//            current_page_number -= 1;
//        }
//    }
//};






