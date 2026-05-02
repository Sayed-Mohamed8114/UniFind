ActiveAdmin.register Item do
  permit_params :title, :description, :status, :user_id, :image_path, :is_resolved

  index do
    selectable_column
    id_column
    column :title
    column :status
    column :user
    column :is_resolved
    column :is_verified
    column :created_at

    column "Actions" do |item|
      if !item.is_verified
        link_to "Verify", verify_admin_item_path(item), method: :put
      else
        "✔ Verified"
      end
    end

    actions
  end

  member_action :verify, method: :put do
    item = Item.find(params[:id])
    item.update(is_verified: true)

    # create notification for user
    Notification.create!(
      user: item.user,
      sender: current_admin_user,
      item: item,
      notification_type: :verified,
      is_read: false
    )

    redirect_to admin_items_path, notice: "Item verified"
  end
end