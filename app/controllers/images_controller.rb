class ImagesController < ApplicationController
  def index
    @image = Image.new
    @album = Album.find(params[:album_id])
    @images = @album.images.all
  end

  def create
    @album = Album.find(params[:album_id])
    @image = @album.images.new(image_params)

    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to album_images_path
  end

  private
  def image_params
    params.require(:image).permit(:avatar)
  end
end
