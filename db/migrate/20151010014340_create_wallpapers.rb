class CreateWallpapers < ActiveRecord::Migration
  def change
    create_table :wallpapers do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
