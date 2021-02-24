json.array! @students do |student|
  json.id student.id
  json.student_name student.student_name
end