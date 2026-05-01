ActiveAdmin.register Item do
  permit_params :title, :description, :status, :user_id, :image_path, :is_resolved, :is_verified

  index do
    selectable_column
    id_column
    column :title
    column :status
    column :user
    column :is_resolved
    column :is_verified
    column :created_at
    actions
  end

  filter :title
  filter :status
  filter :is_resolved
  filter :is_verified
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :status
      f.input :user
      f.input :image_path
      f.input :is_resolved
      f.input :is_verified
    end
    f.actions
  end
end