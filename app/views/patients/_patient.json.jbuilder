json.extract! patient, :id, :name, :phone, :sex, :sickHistory, :mainDoctor, :created_at, :updated_at
json.url patient_url(patient, format: :json)
