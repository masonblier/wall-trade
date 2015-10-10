class WallpapersController < ApplicationController
  def index
    @wallpapers = Wallpaper.all
  end

  def show
    @wallpaper = Wallpaper.find(params[:id])
  end

  def new
    @wallpaper = Wallpaper.new
  end

  def edit
    @wallpaper = Wallpaper.find(params[:id])
  end

  def create
    @wallpaper = Wallpaper.new(wallpaper_params)
    if @wallpaper.save
      redirect_to @wallpaper
    else
      render 'new'
    end
  end

  def update
    @wallpaper = Wallpaper.find(params[:id])

    if @wallpaper.update(wallpaper_params)
      redirect_to @wallpaper
    else
      render 'edit'
    end
  end

  def destroy
    @wallpaper = Wallpaper.find(params[:id])
    @wallpaper.destroy
    redirect_to wallpapers_path
  end

  private
    def wallpaper_params
      params.require(:wallpaper).permit(:name, :image)
    end

end
