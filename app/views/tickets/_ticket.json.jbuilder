json.extract! ticket, :id, :title, :dateOfEvent, :message, :token, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
