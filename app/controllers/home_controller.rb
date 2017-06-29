class HomeController < ApplicationController
  layout "special_layout", only: [:index]

  def index
    @slides = SlideImage.order(:position)
    @albums = Album.all
    @meets = Meet.order(:date)
    @contents = Content.joins(:slide_image).order('slide_images.position')
    @time_table = TablePublish.new

    # table = TablePublish.all
    # date_week = table.first.day_week
    # @head_class=''
    # @table_day=[]
    # @time_table={}
    # table.each do |t|
    #   dw = t.day_week
    #   if date_week == dw
    #     data = {day_week: t.day_week}
    #     data[:time_spending] = t.time_spending
    #     data[:training_name] = t.training_name
    #     data[:teacher] = t.teacher
    #     data[:name_class] = t.name_shot
    #     @head_class += t.name_shot + ' ' unless @head_class.include?(t.name_shot)
    #     @table_day+=[data]
    #     @day_name = t.day_week
    #   else
    #     @time_table[day_week: @day_name, head_class: @head_class]=@table_day if @table_day.present?
    #     @table_day=[]
    #     @head_class=''
    #     date_week = dw
    #     data = {day_week: t.day_week}
    #     data[:time_spending] = t.time_spending
    #     data[:training_name] = t.training_name
    #     data[:teacher] = t.teacher
    #     data[:name_class] = t.name_shot
    #     @head_class += t.name_shot + ' ' unless @head_class.include?(t.name_shot)
    #     @table_day+=[data]
    #     @day_name = t.day_week
    #   end
    # end
    # @time_table[day_week: @day_name, head_class: @head_class]=@table_day if @table_day.present?


  end
end
