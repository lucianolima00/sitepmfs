json.extract! question, :id, :textStatement, :altA, :altB, :altC, :altD, :altE, :correctAlt, :questionnaire_id, :created_at, :updated_at
json.url question_url(question, format: :json)
