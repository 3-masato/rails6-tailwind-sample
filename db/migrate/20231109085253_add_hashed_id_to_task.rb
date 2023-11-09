class AddHashedIdToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :hashed_id, :string
    add_index :tasks, :hashed_id, unique: true
  end
end
