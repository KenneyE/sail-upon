class CreateWebsiteInterests < ActiveRecord::Migration
  def change
    create_table :website_interests do |t|
      t.references :website, index: true
      t.references :interest, index: true

      t.timestamps
    end
  end
end
