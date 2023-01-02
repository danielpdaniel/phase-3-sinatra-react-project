class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/test" do
    tests = TestData.all
    tests.to_json
  end

  get "/artists" do
    artists = Artist.all
    artists.to_json
  end

  post "/artists" do 
    new_artist = Artist.create(
      name: params[:name]
    )
    new_artist.to_json
  end

  get "/songs" do
    songs = Song.all
    songs.to_json
  end

  post "/songs" do
    new_song = Song.create(
      title: params[:title],
      artist_id: params[:artist_id]
    )

    new_song.to_json
  end

  get "/covers" do
    covers = Cover.all
    covers.to_json
  end

  post "/covers" do
    new_cover = Cover.create(
      song_id: params[:song_id],
      artist_id: params[:artist_id],
      performance_link: params[:performance_link]
    )
    new_cover.to_json
  end
end
