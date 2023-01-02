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

  get "/songs" do
    songs = Song.all
    songs.to_json
  end

  get "/covers" do
    covers = Cover.all
    covers.to_json
  end
end
