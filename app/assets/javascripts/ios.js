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

  $('#ios_student_id').on('keyup',function(){
    let input = $(this).val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/students',
      data: { ios_student_id: input},
      dataType: 'json'
    }).done(function(students){
      if (students.length > 0) {
        document.querySelector('#ios_student_name').textContent = students[0].student_name;
        document.querySelector('#ios_student_name').value = students[0].student_name;
        $.ajax({
          type:'GET',
          url: '/iostates',
          data: {ios_student_id: input},
          dataType: 'json'
        }).done(function(iostates){
          const iostate = iostates[0];
          if (iostate.iostat === 0) {
            document.querySelector('#form_checkin').removeClass('d-none');
          } else if (iostate.iostat === 1){
            document.querySelector('#form_checkout').removeClass('d-none');
          }
        }).fail(function () {
          
        });
      } else {
        document.querySelector('#ios_student_name').textContent === '' ? 'idを入力して下さい' : 'idが一致しません';
      }
    }).fail(function(){
      document.querySelector('#ios_student_name').textContent = '検索に失敗しました';
    });
  });


  
  
  




  $('#ios_enter').on('click',function(e){
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