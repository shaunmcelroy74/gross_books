class Publisher < ApplicationRecord
  has_many :books

  validates :publisher_name, presence: true, uniqueness: true
end
