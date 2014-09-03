function documentLoad(){
  $('.ass').tooltip();
  $(".jquery-ui-date").datepicker({
    altField: "#recorded-at-alt",
    altFormat: "yy-mm-d"
  });
}

$(document).ready(documentLoad);
