# frozen_string_literal: true

module ApplicationHelper
    def truncate_text(text, length = 100)
        plain_text = text.to_plain_text # this is to get raw text from RichText
        plain_text.truncate(length, separator: ' ', omission: '...')
    end
end
