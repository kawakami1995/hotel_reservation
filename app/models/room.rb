class Room < ApplicationRecord
    mount_uploader :room_image, ImageUploader 
    belongs_to :user
end
