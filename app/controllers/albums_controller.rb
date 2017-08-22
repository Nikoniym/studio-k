class AlbumsController < ApplicationController
  def load_gallery
    @album = Album.find(params[:id])
    @images = @album.images.order("RANDOM()").limit(12)

    respond_to do |format|
      format.js
    end
  end
end