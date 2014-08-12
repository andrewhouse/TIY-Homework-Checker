json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :link_to_homework, :finished?, :assignment, :help
  json.url homework_url(homework, format: :json)
end
