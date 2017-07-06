class HomeController < ApplicationController
  layout "special_layout", only: [:index]

  def index
    @slides = SlideImage.order(:position)
    @albums = Album.order(id: :desc)
    @meets = Meet.order(:date)
    @contents = Content.joins(:slide_image).order('slide_images.position')
    @time_table = TablePublish.new
  end
end
