json.extract! subject, :id, :subjectName, :teacher_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)