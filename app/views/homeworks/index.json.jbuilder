
# json.array!(@homeworks) do |homework|
#   json.student do |json|
#     json.(homework.user, :first_name, :last_name, :email)
#   end
#   json.assignments do |json|
#     json.(homework.assignment, :date, :description)
#   end
#   json.homeworks do |json|
#     json.(homework, :link_to_homework, :finished?)
#     json.url homework_url(homework, format: :json)
#   end
# end

# json.array!(@homeworks) do |homework|
#   json.student(homework.user, :first_name, :last_name, :email)
#   json.assignment(homework.assignment, :date, :description)
#   json.homework(homework, :link_to_homework, :finished)
# end

json.array!(@users) do |user|
  json.student(user, :name, :email)
  json.assignments(user.homeworks) do |homework|
    json.assignment(homework.assignment, :date, :description)
    json.homework(homework, :link_to_homework, :finished)
  end
end
