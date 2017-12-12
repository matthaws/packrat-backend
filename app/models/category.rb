class Category < ApplicationRecord
  validates :subject, presence: true
end
