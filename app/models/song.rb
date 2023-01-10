class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :covers
    # has_many :artists, through: :covers

    def artists_and_coverers
        artist = Artist.find(self.artist_id)
        covers = Cover.where(song_id: self.id)
        coverers = []
        covers.each do |cover|
           coverers.push(Artist.find(cover.artist_id).name.to_str)
        end
        puts "song: #{self.title}, og artist: #{artist}, covering artists: #{coverers}"
    end

    def self.song_id_by_title title
        selected_song = Song.find_by(title: title)
        selected_song.id
    end
end