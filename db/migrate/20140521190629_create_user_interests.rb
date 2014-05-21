class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.references :user, index: true
      t.references :interest, index: true

      t.timestamps
    end

    add_index :user_interests, [:user_id, :interest_id], unique: true
  end
end
