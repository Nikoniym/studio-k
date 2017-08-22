ActiveAdmin.register Content do
  menu parent: 'Оформление, наполнение'
  actions :all, :except => [:show]
  permit_params :name, :name_shot,  :slide_image_id, :description, :user_ids => []

  config.sort_order = 'slide_images.position'


  controller do
    def scoped_collection
      end_of_association_chain.joins(:slide_image).order('slide_images.position')
    end
  end

  index do
    column :slide_image do |s|
      s.slide_image.position
    end
    column :name
    column :name_shot
    column :description
    column  :user_ids do |u|
     u.users.map{|us| us.first_name}
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :slide_image_id,  :label => 'Слайд', :as => :select, :collection =>SlideImage.all.map{|u| [u.name, u.id]}
      f.input  :name, :label => 'Тренировка', :as => :select, :collection =>TrainingName.all.map{|u| u.name }
      f.input  :name_shot, :label => 'Сокращённое имя', :as => :select, :collection =>TrainingName.all.map{|u| [u.name, u.name_shot]}
      f.input  :description, label: 'Описание'
      f.input :users, :label => 'Преподаватель', :as => :select, :collection => User.with_role(:teacher).map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
