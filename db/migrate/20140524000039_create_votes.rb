class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, null: false
      t.references :website, index: true, null: false
      t.boolean :upvote, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :website_id], unique: true
  end
end
