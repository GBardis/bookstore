class Author < ApplicationRecord
  has_and_belongs_to_many :books
  # validations
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
