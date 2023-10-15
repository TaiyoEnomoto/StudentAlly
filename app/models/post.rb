class Post < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader
	has_many :plays, dependent: :destroy
	has_many :played_users, through: :plays, source: :user
	has_many :comments, dependent: :destroy
end