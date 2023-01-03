class Artist < ActiveRecord::Base
    has_many :songs
    has_many :covers
    # has_many :songs, through: :covers
end