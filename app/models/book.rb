class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :publisher

  validates :isbn, format: { with: /[0-9\-xX{13}]/,
                             message: 'Please check isbn format' }
  validates :isbn, uniqueness: true
  validates :title, uniqueness: true
  validates :publisher, :authors, presence: true
end
