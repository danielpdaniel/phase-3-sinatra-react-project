class Artist < ActiveRecord::Base
    has_many :songs
    has_many :covers
    # has_many :songs, through: :covers

    def self.sort_by_name
        Artist.order(name: :asc)
    end
end