class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :url
      t.string :image
      t.text :description
      t.text :comment

      t.timestamps null: false
    end
  end
end
