class Profile < ApplicationRecord
  belongs_to :user
  has_one :profile_photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
