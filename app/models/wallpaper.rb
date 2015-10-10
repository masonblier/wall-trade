class Wallpaper < ActiveRecord::Base
  validates :name, presence: true
  validates :image, presence: true

  mount_uploader :image, WallpaperUploader
end
