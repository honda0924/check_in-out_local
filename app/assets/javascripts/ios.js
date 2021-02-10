$(function(){


  function showClock() {
    const week_chars=['日','月','火','水','木','金','土'];
    let now_time=new Date();
    let now_month=now_time.getMonth() + 1;
    let now_date=now_time.getDate();
    let now_day_of_the_week=now_time.getDay();
    let now_hour=('0' + now_time.getHours()).slice(-2);
    let now_minute=('0'+ now_time.getMinutes()).slice(-2);
    let now_second=('0' + now_time.getSeconds()).slice(-2);

    document.querySelector('#ios_time').textContent=`${now_month}/${now_date}(${week_chars[now_day_of_the_week]}) ${now_hour}:${now_minute}:${now_second}`;
  }

  setInterval(() => {
    showClock();
  }, 1000);


  
  
  




  $('#ios_enter').on('click',function(e){
    // // e.preventDefault();
    // const url = 'https://api.line.me/v2/bot/message/push';
    // const sendBody = {
    //   to: 'U0d1607fd7ec247b84f52da09b3ab30e1',
    //   messages:'入室しました'
    //   // messages:`${student_name}さんが${stamp_time}に入室されました。`,
    // }
    // fetch(url,{
    //   method: 'POST',
    //   mode: 'no-cors',
    //   headers:{
    //     'Content-Type' : 'application/json',
    //     'Authorization' : 'Bearer d1c4Y9CggTzklxQ+s44F2osUrTX/1KHvr5W9NwDyJuy4wmbYJ5Da6OsMxZA4PMhCuiYIy7OAjMpG/TSrsxSIj9KjCm0tN8dBN4malFiwlls4RwfLz41BbfHRTn9OwoKefzxwuHwvHUeEKxaqfWQMXgdB04t89/1O/w1cDnyilFU=;wq',        
    //   },
    //   body: JSON.stringify(sendBody),
    // });
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