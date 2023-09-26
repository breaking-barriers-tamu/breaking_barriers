# frozen_string_literal: true

json.extract!(event_log, :id, :hourlog_id, :user_id, :event_id, :hours, :created_at, :updated_at)
json.url(event_log_url(event_log, format: :json))
