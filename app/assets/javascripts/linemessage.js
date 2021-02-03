$(function(){
  $('.student_link').on('click',function(){
    const line_uid = $(this).parent().find('span').html();
    sessionStorage.setItem('LINEID',line_uid);
    window.location.href = '/lineusers/new';
  });
  $('#link_line_id').val(sessionStorage.getItem('LINEID'));
});