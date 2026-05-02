class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      # who receives the notification
      t.references :user, null: false, foreign_key: true

      # polymorphic sender (User or AdminUser)
      t.references :sender, polymorphic: true, null: false

      # related item
      t.references :item, null: false, foreign_key: true

      # type of notification
      t.string :notification_type, null: false

      # read status
      t.boolean :is_read, default: false, null: false

      t.timestamps
    end

    add_index :notifications, :notification_type
    add_index :notifications, :is_read
  end
end