json.extract! question, :id, :questiontype, :description, :created_at, :updated_at
json.url question_url(question, format: :json)
