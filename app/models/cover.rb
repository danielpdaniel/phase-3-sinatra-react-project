class Cover < ActiveRecord::Base
    belongs_to :artist
    belongs_to :song

    def test_instance_method
        self.artist.name
    end

    def self.test_class_method
        artists_array = []
        self.all.each do |cover|
            artists_array.push(cover.artist.name)
        end
        artists_array.uniq
    end
end