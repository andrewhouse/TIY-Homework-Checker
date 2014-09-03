function documentLoad(){
  $('.ass').tooltip();
  $(".jquery-ui-date").datepicker({
    altField: "#recorded-at-alt",
    altFormat: "yy-mm-d"
  });
  $('#accordion').accordion({active: false, collapsible: true});
}

$(document).ready(documentLoad);
