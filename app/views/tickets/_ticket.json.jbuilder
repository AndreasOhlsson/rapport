json.extract! ticket, :id, :title, :dateOfEvent, :message, :generatedId, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
