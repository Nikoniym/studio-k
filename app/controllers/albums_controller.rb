class AlbumsController < ApplicationController
  def load_gallery
    @album = Album.find(params[:id])
    limit = @album.images.size
    limit = (1..limit).to_a.find_all{ |elem| elem % 4 == 0 }
    limit = limit[-1] if limit.present?
    @images = @album.images.order("RANDOM()").limit(limit.blank? || limit<=12 ? 12 : limit)

    respond_to do |format|
      format.js
    end
  end
end