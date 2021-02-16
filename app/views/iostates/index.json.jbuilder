json.array! @iostates do |iostate|
  # binding.pry
  json.id iostate.id
  json.student_id iostate.student_id
  json.iostat iostate.iostat
end