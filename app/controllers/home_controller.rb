class HomeController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.limit(10)

    dup_ids = []
    @wallpaper_sets = @tags.map do |tag|
      wallpapers = tag.taggings.where.not(taggable_id: dup_ids)
                    .order(created_at: :desc).limit(10).map(&:taggable)
      dup_ids.concat wallpapers.map(&:id)

      {
        name: tag.name,
        wallpapers: wallpapers
      }
    end
  end
end
