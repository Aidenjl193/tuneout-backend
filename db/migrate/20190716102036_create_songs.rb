class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, id: :uuid do |t|
      t.string :name
      t.uuid :album_id

      t.timestamps
    end
  end
end
