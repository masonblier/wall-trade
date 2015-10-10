require "rails_helper"

RSpec.describe WallpapersController do

  let(:test_params) do
    {
      name: "valid name",
      image: fixture_file_upload("files/test.png", 'image/png')
    }
  end

  it "should index" do
    Wallpaper.create!(test_params)

    get :index
    expect(response).to be_success
    wallpapers = assigns(:wallpapers)
    expect(wallpapers.count).to eq(1)
  end

  it "should create" do
    post :create, wallpaper: test_params
    wallpaper = assigns(:wallpaper)
    expect(response).to redirect_to(wallpaper_path wallpaper)
    expect(wallpaper.name).to eq("valid name")
  end

  it "should read" do
    wallpaper = Wallpaper.create!(test_params)

    get :show, id: wallpaper.id
    values = assigns(:wallpaper)
    expect(response).to be_success
    expect(values.name).to eq("valid name")
  end

  it "should update" do
    wallpaper = Wallpaper.create!(test_params)
    new_params = test_params
    new_params[:name] = "updated name"

    patch :update, id: wallpaper.id, wallpaper: new_params
    expect(response).to redirect_to(wallpaper_path wallpaper)
    updated = assigns(:wallpaper)
    expect(updated.name).to eq("updated name")
  end

  it "should destroy" do
    wallpaper = Wallpaper.create!(test_params)

    delete :destroy, id: wallpaper.id
    expect(response).to redirect_to(wallpapers_path)

    get :index
    wallpapers = assigns(:wallpapers)
    expect(wallpapers.count).to eq(0)
  end

end
