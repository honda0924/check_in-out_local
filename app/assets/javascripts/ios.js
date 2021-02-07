$(function(){
  $('#ios_enter').on('click',function(e){
    // e.preventDefault();
    const url = 'https://api.line.me/v2/bot/message/push';
    const sendBody = {
      to: gon.line_token,
      messages:'入室しました'
      // messages:`${student_name}さんが${stamp_time}に入室されました。`,
    }
    fetch(url,{
      method: 'POST',
      mode: 'no-cors',
      headers:{
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer {d1c4Y9CggTzklxQ+s44F2osUrTX/1KHvr5W9NwDyJuy4wmbYJ5Da6OsMxZA4PMhCuiYIy7OAjMpG/TSrsxSIj9KjCm0tN8dBN4malFiwlls4RwfLz41BbfHRTn9OwoKefzxwuHwvHUeEKxaqfWQMXgdB04t89/1O/w1cDnyilFU=}',        
      },
      body: JSON.stringify(sendBody),
    });
  });
  $('#ios_exit').on('click',function(){
    const line_uid = $(this).parent().find('span').html();
    sessionStorage.setItem('LINEID',line_uid);
    window.location.href = '/lineusers/new';
  });
  $('#ios_cancel').on('click',function(){
    const line_uid = $(this).parent().find('span').html();
    sessionStorage.setItem('LINEID',line_uid);
    window.location.href = '/lineusers/new';
  });

  $('#link_line_id').val(sessionStorage.getItem('LINEID'));
});