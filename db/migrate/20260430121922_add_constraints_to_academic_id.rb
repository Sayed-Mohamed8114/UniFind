class AddConstraintsToAcademicId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :academic_id, false
    add_index :users, :academic_id, unique: true
  end
end
