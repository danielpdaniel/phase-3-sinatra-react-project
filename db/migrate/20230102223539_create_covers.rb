class CreateCovers < ActiveRecord::Migration[6.1]
  def change
    create_table :covers do |t|
      t.integer :song_id
      t.integer :artist_id
      t.string :performance_link
    end
  end
end
