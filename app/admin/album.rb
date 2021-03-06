ActiveAdmin.register Album do
  config.clear_sidebar_sections!
  menu parent: 'Оформление, наполнение'
  actions :all, :except => [:show]
  permit_params :avatar, :name, :position, :publish

  index do

    id_column
    column :name
    column  :avatar do |album|
      image_tag album.avatar.url(:thumb)
    end
    column :position
    column :publish
    actions defaults: false do |album|
      item 'Открыть', album_images_path(album), class: 'member_link'
      item 'Изменить', edit_admin_album_path(album), class: 'member_link'
      item 'Удалить', admin_album_path(album), method: :delete, data: { confirm: 'Вы уверены?' }, class: 'member_link'
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :avatar
      f.input :position
      f.input :publish
      f.actions
      end
  end

  # index as: :grid do |album|
  #   link_to image_tag(album.avatar.url(:thumb)) + album.name, album_images_path(album)
  # end
end
