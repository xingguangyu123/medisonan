json.extract! survey, :id, :name, :discription, :state, :progress, :created_at, :updated_at
json.url survey_url(survey, format: :json)
