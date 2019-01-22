class Category < ApplicationRecord
  has_many :tests, dependent: :nullify
  scope_default :name_asc { order(title: :asc) }
end
