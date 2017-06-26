class AlbumsController < ApplicationController
  def load_gallery
    @album = Album.find(params[:id])
    @images = @album.images.all

    respond_to do |format|
      format.js
    end
  end
end