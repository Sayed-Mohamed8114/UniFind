ActiveAdmin.register Claim do
  permit_params :user_id, :item_id, :content

  # Index page (list view)
  index do
    selectable_column
    id_column
    column :user
    column :item
    column :content
    column :created_at
    actions
  end

  # Filters
  filter :user
  filter :item
  filter :created_at

  # Form (create/edit)
  form do |f|
    f.inputs do
      f.input :user
      f.input :item
      f.input :content
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :user
      row :item
      row :content
      row :created_at
    end
  end
end