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

    def artists_songs_alphabetically
        self.songs.order(title: :asc)
    end

    def self.artists_songs
        songs_hash_arr = []
        self.all.each do |artist|
            artist.songs.each do |song|
                songs_hash_arr.push({title: song.title})
            end
        end
        songs_hash_arr
    end

end