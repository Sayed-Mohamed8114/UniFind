ActiveAdmin.register User do
  permit_params :email, :name, :academic_id

  filter :email
  filter :name
  filter :academic_id
  filter :created_at

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :academic_id
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :academic_id
    end
    f.actions
  end
end