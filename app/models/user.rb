class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :products, dependent: :destroy
  
  has_many :friendships
  has_many :friends, :through => :friendships

  # def has_profile?
  #   profile.present?
  # end

  # def full_name
  #   profile.full_name
  # end
end
