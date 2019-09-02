class SongsController < ApplicationController

  def index
    songs = Song.where("name ILIKE ?", "%#{params[:filter]}%").order('created_at DESC').limit(10)
    render json: songs.to_json(:methods => :song_url, :include => [
               :album => {:methods => :cover_art}
             ])
  end
  
  def show
    song = Song.find(params[:id])
    render json: song.to_json(:methods => :song_url)
  end
end
