$(function(){
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);      
      $('form')[0].reset();
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    })
    .always(function() {
      $('.messages').prop('disabled', false);
    });
  });
});


