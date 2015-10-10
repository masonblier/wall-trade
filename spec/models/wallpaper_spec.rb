require "rails_helper"

RSpec.describe WallpapersController do

  let(:valid_params) do
    {
      name: "valid name",
      image: File.open(Rails.root.join("spec/fixtures/files/test.png"))
    }
  end

  it "should require name" do
    params = valid_params
    params[:name] = nil
    wallpaper = Wallpaper.new valid_params
    expect(wallpaper.save).to be(false)
  end

  it "should require image" do
    params = valid_params
    params[:image] = nil
    wallpaper = Wallpaper.new valid_params
    expect(wallpaper.save).to be(false)
  end

  it "should save valid params" do
    wallpaper = Wallpaper.new valid_params
    expect { wallpaper.save }.to change(Wallpaper, :count).from(0).to(1)
  end

end
