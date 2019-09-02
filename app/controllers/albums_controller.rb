class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    albums = Album.where("name ILIKE ?", "%#{params[:filter]}%").order('created_at DESC').limit(4)
    render json: albums.to_json(:methods => :cover_art)
  end
  
  def create
    album = Album.create(album_params)
    render json: album.to_json(:methods => :cover_art)
  end

  def show
    album = Album.find(params[:id])
    render json: album.to_json(
             :methods => :cover_art,
             :include => [
               :account,
               :songs => {
                 :methods => :song_url,
                 :include => [
                   :album => {:methods => :cover_art}
                 ]
               }
             ]
           )
  end

  def destroy
    album = Album.find(params[:id])
    if(album.account.user_id == current_user.id)
      album.destroy()
      render json: {message: "successful"}
    else
      render json: {error: "User does not own this object"}
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :account_id, :cover, songs: [])
  end
end
