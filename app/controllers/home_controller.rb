class HomeController < ApplicationController
  layout "special_layout", only: [:index]

  def index
    @slides = SlideImage.order(:position)
    @albums = Album.order(:position).where(publish: true)
    @meets = Meet.order(:date)
    @contents = Content.joins(:slide_image).order('slide_images.position')
    @time_table = TablePublish.new
    @price = SelectCash.order(:price)
    @teachers = User.where(show_teacher: true).with_role(:teacher)
  end

  def select_teacher
    @user = User.find params[:id]
    @id = params[:content_id]
  end
end
