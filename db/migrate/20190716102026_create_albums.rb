class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums, id: :uuid do |t|
      t.string :name
      t.uuid :account_id

      t.timestamps
    end
  end
end
