$(function(){
  $('#ios_enter').on('click',function(e){
    e.preventDefault();
    const sendData = {
      student_id:'',
      in_time:'',
      out_time:'',
    }
    sessionStorage.setItem('LINEID',line_uid);
    window.location.href = '/lineusers/new';
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