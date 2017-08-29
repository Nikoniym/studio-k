class HomeController < ApplicationController
  layout "special_layout", only: [:index]

  def index
    @slides = SlideImage.order(:position)
    @albums = Album.order(:position).where(publish: true)
    @meets = Meet.order(:date)
    @contents = Content.joins(:slide_image).order('slide_images.position')
    @time_table = TablePublish.new
    @price = SelectCash.order(:price)
  end
end
