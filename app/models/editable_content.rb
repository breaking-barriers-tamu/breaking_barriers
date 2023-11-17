class EditableContent < ApplicationRecord
  has_rich_text :description
end
