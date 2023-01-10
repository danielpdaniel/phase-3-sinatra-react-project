class Artist < ActiveRecord::Base
    has_many :songs
    has_many :covers
    # has_many :songs, through: :covers

    def self.sort_by_name
        Artist.all.order(name: :asc)
    end

    def self.artist_id_by_name name
        artist = Artist.find_by(name: name)
        artist.id
    end
end