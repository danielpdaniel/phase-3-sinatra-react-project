class SongsAddPerformanceLink < ActiveRecord::Migration[6.1]
  def change
    change_table :songs do |t|
      t.string :performance_link
    end
  end
end
