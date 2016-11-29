class Profile < ApplicationRecord
  belongs_to :user
  has_one :photo

  def full_name
    "#{first_name} #{last_name}"
  end
end
