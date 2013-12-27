$(document).ready(function(){
  $("#brief-submit").click(function(){
    var mss = $('textarea#brief-comment-area').val();
    var text = "<li><a>Arron FENG</a><p>" + mss + "</p></li>";
    $("#brief-list").prepend(text);
    $('textarea#brief-comment-area').val('');
  });
});