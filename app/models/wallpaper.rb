class Wallpaper < ActiveRecord::Base
  acts_as_taggable

  validates :name, presence: true
  validates :image, presence: true

  mount_uploader :image, WallpaperUploader

  def as_json(options)
    o = super
    o[:tags] = self.tag_list.map {|t| t.to_s}
    o
  end
end
