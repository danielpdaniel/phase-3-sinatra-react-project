

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  
  get "/test" do
    tests = TestData.all
    tests.to_json(methods: [:say_test])
  end

  get "/artists" do
    artists = Artist.all.sort_by_name
    
    # artists.to_json( include: {songs: {include: {artist: {only: [:name]}}}, covers: {include: {song: {include: {artist: {only: [:name]}}}}}})
    artists.to_json( include: {songs: {include: {artist: {only: [:name]}, covers: {include: :artist}}}, covers: {include: {song: {include: {artist: {only: [:name]}}}}}})
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

  patch "/artists/:id" do 
    artist = Artist.find(params[:id])
    artist.update(
      name: params[:name]
    )

    artist.to_json(include: [:songs, covers: {include: [:song]}])
  end

  delete "/artists/:id" do
    artist = Artist.find(params[:id])
    # Song.destroy_by(artist_id: params[:id])
    # Cover.destroy_by(artist_id: params[:id])
    
    artist.destroy

    artist.to_json(include: {songs: {include: [:artist]}, covers: {include: {artist: {include: {songs: {include: {covers: {include: [:artist]}}}}}}}})
  end

  get "/songs" do
    songs = Song.all
    songs.to_json(include: [:artist, covers: {include: [:artist]}])
  end

  get "/songs/:id" do
    song = Song.find(params[:id])
    
    song.to_json(include: [:artist, covers: {include: [:artist]}])
  end

  get "/songs/:id/covers" do
    song = Song.find(params[:id])
    covers = song.covers
    covers.to_json(include: :artist)
  end

  patch "/songs/:id" do
    song = Song.find(params[:id])
    song.update(
      title: params[:title],
      performance_link: params[:performance_link]
    )
    song.to_json(include: {artist: {include: {songs: {include: {artist: {only: [:name]}, covers: {include: [:artist]}}}}}, covers:{include: [:artist]}})
  end

  post "/songs" do
    new_song = Song.create(
      title: params[:title],
      artist_id: params[:artist_id],
      performance_link: params[:performance_link]
    )

    new_song.to_json(include: {artist: {include: {songs: {include: {artist: {only: [:name]}, covers: {include: :artist}}}, covers: {include: {song: {include: {artist: {only: [:name]}}}}}}}})
  end

  delete "/songs/:id" do
    song_to_delete = Song.find(params[:id])
    song_to_delete.destroy
    song_to_delete.to_json(include: {artist: {include: {songs: {include: [:artist]}, covers: {include: {song: {include: [:artist]}}}}}})
  end

  get "/covers" do
    covers = {covers: Cover.all, coverArtists: Cover.all.test_class_method}
    covers.to_json(methods: [:test_instance_method])
  end

  post "/covers" do
    new_cover = Cover.create(
      song_id: params[:song_id],
      artist_id: params[:artist_id],
      performance_link: params[:performance_link]
    )
    # new_cover.to_json(include: {artist: {include: {songs: {include: [:artist, :covers]}, covers: {include: {song: {include: [:artist]}}}}}})
    # new_cover.to_json(include: {song: {include: [:covers, artist: {include: [:songs, :covers]}]}})
    # new_cover.to_json(include: {song: {include: {covers: {include: [:artist]}, artist: {only: [:name]}}}})
    new_cover.to_json(include: {artist: {include: {covers: {include: {song: {include: {artist: {only: [:name]}}}}}, songs: {include: {artist: {only: [:name]}, covers: {include: [:artist]}} }} }, song: {include: {artist: {include: {songs: {include: {artist: {only: [:name]}, covers: {include: [:artist]}} }} }, covers: {include: [:artist]} } }})
  end

  patch "/covers/:id" do
    cover = Cover.find(params[:id])
    cover.update(
      artist_id: params[:artist_id],
      performance_link: params[:performance_link]
    )
    # cover.to_json(include: [:artist])
    cover.to_json(include: {artist: {include: {covers: {include: {song: {include: {artist: {only: [:name]}}}}}, songs: {include: {artist: {only: [:name]}, covers: {include: [:artist]}} }} }, song: {include: {artist: {include: {songs: {include: {artist: {only: [:name]}} }} }, covers: {include: [:artist]} } }})

  end

  delete "/covers/:id" do
    cover_to_delete = Cover.find(params[:id])
    cover_to_delete.destroy
    
    # cover_to_delete.to_json(include: {artist: {include: {songs: {include: [:artist]}, covers: {include: {song: {include: [:artist]}}}}}})
    cover_to_delete.to_json(include: {artist: {include: {covers: {include: {song: {include: {artist: {only: [:name]}}}}}, songs: {include: {artist: {only: [:name]}, covers: {include: [:artist]}} }} }, song: {include: {artist: {include: {songs: {include: {artist: {only: [:name]}, covers: {include: [:artist]}} }} }, covers: {include: [:artist]} } }})
  end


end
