ActiveAdmin.register User do
  permit_params :email, :name, :academic_id, :blocked

  filter :email
  filter :name
  filter :academic_id
  filter :created_at
  filter :blocked

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :academic_id
    column :blocked
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :academic_id
      f.input :blocked, as: :boolean
    end
    f.actions
  end
end