// HOLY SHIT THIS WORK
function commentAjax(){
  $('.post').on("ajax:success", function(e, data, status, xhr){
    // $(".comment-container").append(xhr.responseText);
    console.log(xhr);
  })
  .on("ajax:error", function(e, xhr, status, error) {
    $(".post").append("<p>ERROR</p>");
  })
}

function commentLogic(){
  $('.comment-btn').on('click', '.update', function(){
    $(this).hide();
    $('.post-comment').fadeIn();
  });
  $('.sub').on('click', function(){
    $('.comment-btn').show();
    $('.post-comment').hide();
  });
}



function preventSubmit(){
  $('.sub').submit(function(e){
    e.preventDefault();
  });
}

function loadDocument(){
  preventSubmit();
  commentAjax();
  commentLogic();
  $('.post-comment').hide();
}

$(document).ready(loadDocument);
