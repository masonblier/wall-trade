# encoding: utf-8
require 'carrierwave/processing/rmagick'

class WallpaperUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def cache_dir
    "#{Rails.root}/tmp/uploads/#{Rails.env}"
  end

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [320, 200]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
