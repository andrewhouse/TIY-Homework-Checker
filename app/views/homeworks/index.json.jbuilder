
json.array!(@homeworks) do |homework|
  json.student do |json|
    json.(homework.user, :first_name, :last_name, :email)
  end
  json.assignments do |json|
    json.(homework.assignment, :date, :description)
  end
  json.homeworks do |json|
    json.extract! homework, :link_to_homework, :finished?, :help
    json.url homework_url(homework, format: :json)
  end
end
