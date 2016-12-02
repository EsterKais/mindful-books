class ProfilePhoto < ApplicationRecord
  belongs_to :profile

  mount_uploader :image, ImageUploader

end
