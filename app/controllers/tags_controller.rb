class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find_by_name params[:id]
    if @tag
      @wallpapers = @tag.taggings.map(&:taggable)
    end
  end
end
