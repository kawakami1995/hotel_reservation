class Room < ApplicationRecord
    mount_uploader :room_image, ImageUploader 
    belongs_to :user
    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :price, presence: true, numericality: {only_integer: true, greater_than: 0}
    validates :address, presence: true
end
