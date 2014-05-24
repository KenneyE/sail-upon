class AddInterestColors < ActiveRecord::Migration
  def change
    add_column :interests, :color, :text, null: false, default: "dark-blue"
  end
end
