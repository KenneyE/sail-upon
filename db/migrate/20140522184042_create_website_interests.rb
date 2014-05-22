class CreateWebsiteInterests < ActiveRecord::Migration
  def change
    create_table :website_interests do |t|
      t.references :website, index: true, null: false
      t.references :interest, index: true, null: false

      t.timestamps
    end
    add_index :website_interests, [:website_id, :interest_id], unique: true
  end
end
