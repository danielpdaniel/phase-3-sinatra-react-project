

# Seed your database here


puts "Creating test data..."
TestData.create(name:"Test!", value: 3)

puts "seeding artists..."
Artist.create(name: "Lady Gaga")
Artist.create(name: "Frank Sinatra")
Artist.create(name: "Beyoncé")
Artist.create(name: "Orville Peck")


puts "seeding songs..."
Song.create(title: "New York, New York", artist_id: Artist.artist_id_by_name("Frank Sinatra"))
Song.create(title: "Born This Way", artist_id: Artist.artist_id_by_name("Lady Gaga"))

puts "seeding covers..."
Cover.create(song_id: Song.song_id_by_title("New York, New York"), artist_id: Artist.artist_id_by_name("Lady Gaga"), performance_link: "https://www.youtube.com/watch?v=hpiw3cDWmvc")
Cover.create(song_id: Song.song_id_by_title("New York, New York"), artist_id: Artist.artist_id_by_name("Beyoncé"), performance_link: "https://www.youtube.com/watch?v=hovCS_wk3Hc")
Cover.create(song_id: Song.song_id_by_title("Born This Way"), artist_id: Artist.artist_id_by_name("Orville Peck"), performance_link: "https://www.youtube.com/watch?v=2EOupP5bLnI")

puts "✅ Done seeding!"
