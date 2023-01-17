class Cover < ActiveRecord::Base
    belongs_to :artist
    belongs_to :song

    def find_covers
        Cover.where(artist_id: self.id)
    end
end