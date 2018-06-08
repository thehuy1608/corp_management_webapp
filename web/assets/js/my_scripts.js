//Toggle side menu button onclick handler
var toggle_side_menu = function() {
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
var toggle_active_side_menu_item = function(element) {
  Array.prototype.forEach.call(side_menu_items, function(item) {
    if (item.classList.contains("style_side_menu_item_active")) {
      item.classList.remove("style_side_menu_item_active");
    }
  });
  element.classList.add("style_side_menu_item_active");
};


//Toggle border when focus on text field
var show_focus_border = function(id_focus_border_name) {
  var id_focus_border = document.getElementById(id_focus_border_name);
  id_focus_border.style.transform = "scaleX(1)";
};

var hide_focus_border = function(id_focus_border_name) {
  var id_focus_border = document.getElementById(id_focus_border_name);
  id_focus_border.style.transform = "scaleX(0)";
};

//Toggle label when focus on textfield
var show_focus_label = function(id_focus_label_name) {
  var id_focus_label = document.getElementById(id_focus_label_name);
  id_focus_label.style.transform = "translate(0, 0px) scale(0.75)";
};

var hide_focus_label = function(id_focus_label_name) {
  var input_search_value = document
    .getElementById("id_department_management_search_form_input_text")
    .value.trim();
  if (input_search_value) {
    //Do nothing
  } else {
    var id_focus_label = document.getElementById(id_focus_label_name);
    id_focus_label.style.transform = "translate(0, 20px) scale(1)";
  }
};

//Reload div
var reload_div = function (div_id) {
  $(div_id).load(location.href + ' ' + div_id + '>*', '');  
};


