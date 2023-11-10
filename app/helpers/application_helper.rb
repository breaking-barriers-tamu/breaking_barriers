# frozen_string_literal: true

module ApplicationHelper
    def truncate_text(text, length = 100)
        plain_text = text.to_plain_text # this is to get raw text from RichText
        plain_text.truncate(length, separator: ' ', omission: '...')
    end

    def time_in_words(from_time, to_time = Time.now)
        distance_in_hours = ((to_time - from_time) / 3600).round
        distance_in_minutes = ((to_time - from_time) / 60).round

        if distance_in_hours > 24
        "#{(distance_in_hours / 24).round} days"
        elsif distance_in_hours > 1
        "#{distance_in_hours} hours"
        else
        "#{distance_in_minutes} minutes"
        end
    end
end
