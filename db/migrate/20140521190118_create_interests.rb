class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
    add_index :interests, :name, unique: true
  end
end
