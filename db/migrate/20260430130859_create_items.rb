class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.string :image_path
      t.boolean :is_resolved, :default => false

      t.timestamps
    end
  end
end
