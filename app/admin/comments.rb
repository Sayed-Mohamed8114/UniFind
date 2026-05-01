# app/admin/comments.rb

ActiveAdmin.register Comment do
  permit_params :content, :user_id, :item_id

  index do
    selectable_column
    id_column

    column :content
    column :user
    column :item
    column :created_at

    actions
  end

  filter :content
  filter :user
  filter :item
  filter :created_at

  form do |f|
    f.inputs do
      f.input :content
      f.input :user
      f.input :item
    end
    f.actions
  end
end