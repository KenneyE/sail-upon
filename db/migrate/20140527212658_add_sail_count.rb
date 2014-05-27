class AddSailCount < ActiveRecord::Migration
  def change
    add_column :users, :sail_count, :integer, null: false, default: 0
  end
end
