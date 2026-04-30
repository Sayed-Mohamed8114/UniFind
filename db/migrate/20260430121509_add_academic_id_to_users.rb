class AddAcademicIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :academic_id, :string
  end
end
