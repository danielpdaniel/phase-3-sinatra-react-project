class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  
  get "/test" do
    tests = TestData.all
    tests.to_json
  end

  get "/artists" do
    artists = Artist.all
    artists.to_json(include: [:songs, covers: {include: [:song]}])
  end

  get"/artists/:id" do
    artist = Artist.find(params[:id])
    artist.to_json
  end

  get "/artists/:id/songs" do
    songs = Song.where(artist_id: params[:id])
    songs.to_json
  end

  get "/artists/:id/covers" do
    covers = Cover.where(artist_id: params[:id])
    covers.to_json
  end

  post "/artists" do 
    new_artist = Artist.create(
      name: params[:name]
    )
    new_artist.to_json(include: [:songs, covers: {include: [:song]}])
  end

  get "/songs" do
    songs = Song.all
    songs.to_json
  end

  get "/songs/:id" do
    # song = Song.find(params[:id]).artists_and_coverers
    song = Song.find(params[:id])
    # song.artist = Artist.find(song.artist_id)
    # song.to_json(include: :artist, include: {covers: {include: [:artist]}})
    song.to_json(include: [:artist, covers: {include: [:artist]}])
  end

  get "/songs/:id/covers" do
    song = Song.find(params[:id])
    # covers = Cover.where(song_id: params[:id])
    covers = song.covers
    covers.to_json(include: :artist)
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
    new_cover.to_json(include: [:artist])
  end

  patch "/covers/:id" do
    cover = Cover.find(params[:id])
    cover.update(
      artist_id: params[:artist_id],
      performance_link: params[:performance_link]
    )
    cover.to_json(include: [:artist])
  end

  delete "/covers/:id" do
    cover_to_delete = Cover.find(params[:id])
    cover_to_delete.destroy
    
    cover_to_delete.to_json(include: [:artist])
  end


end
