class Page < ApplicationRecord
  validates :title, :content, :permalink, presence: true
  validates :permalink, uniqueness: true

  def to_param
    "#{id}-#{permalink}"
  end
end
