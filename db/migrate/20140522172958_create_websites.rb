class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.integer :submitter_id, null: false

      t.timestamps
    end
    add_index :websites, :url, unique: true
  end
end
