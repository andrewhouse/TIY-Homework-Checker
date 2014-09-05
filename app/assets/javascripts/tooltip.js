function jqToolTip(){
  $('.ass').tooltip();
}

function jqDatePicker(){
  $(".jquery-ui-date").datepicker({
    altField: "#recorded-at-alt",
    altFormat: "yy-mm-d"
  });
}

function jqAccordion(){
  $('#accordion').accordion({active: false, collapsible: true});
}

function documentLoad(){
  jqToolTip();
  jqDatePicker();
  jqAccordion();
}




$(document).ready(documentLoad);
