class Room < ApplicationRecord
  mount_uploader :images, CoverUploaderUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user

end
