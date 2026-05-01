ActiveAdmin.register Item do
  permit_params :title, :description, :status, :user_id, :image_path, :is_resolved

  index do
    selectable_column
    id_column
    column :title
    column :status
    column :user
    column :is_resolved
    column :created_at
    actions
  end

  filter :title
  filter :status
  filter :is_resolved

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :status
      f.input :user
      f.input :image_path
      f.input :is_resolved
    end
    f.actions
  end
end