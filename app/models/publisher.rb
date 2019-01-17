class Publisher < ApplicationRecord
  has_many :books
  validates :name, length: { in: 0..255 }
  validates :name, uniqueness: true
end
