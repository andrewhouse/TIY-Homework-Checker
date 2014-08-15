json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :date, :description
  json.url assignment_url(assignment, format: :json)
end
