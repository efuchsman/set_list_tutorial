class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
  end

  def create
   artist = Artist.create(artist_params)
   redirect_to "/artists"
  end

  def artist_params
    params.permit(:name)# or for multiple =>, years_active,...,...)
  end
end
