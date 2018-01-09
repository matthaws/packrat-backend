class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id, presence: true
      t.integer :article_id, presence: true

      t.timestamps
    end

    add_index :bookmarks, [:user_id, :article_id], unique: true
  end
end
