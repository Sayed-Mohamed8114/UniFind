ActiveAdmin.register Notification do

  permit_params :user_id, :sender_id, :sender_type, :item_id, :notification_type, :is_read

  # -------------------------
  # Filters (Ransack-safe)
  # -------------------------
  filter :user
  filter :sender_id
  filter :sender_type
  filter :item
  filter :notification_type, as: :select, collection: Notification.notification_types.keys
  filter :is_read

  # -------------------------
  # Index page
  # -------------------------
  index do
    selectable_column
    id_column

    column :user
    column :sender
    column :item
    column :notification_type
    column :is_read
    column :created_at

    actions
  end

  # -------------------------
  # Show page
  # -------------------------
  show do
    attributes_table do
      row :id
      row :user
      row :sender
      row :item
      row :notification_type
      row :is_read
      row :created_at
      row :updated_at
    end
  end

  # -------------------------
  # Form
  # -------------------------
  form do |f|
    f.inputs do
      f.input :user
      f.input :sender_type, as: :select, collection: ["User", "AdminUser"]
      f.input :sender_id
      f.input :item
      f.input :notification_type, as: :select, collection: Notification.notification_types.keys
      f.input :is_read
    end

    f.actions
  end

end