class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categories do |t|
      t.integer :article_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end

    add_index :article_categories, [:article_id, :category_id], unique: true
  end
end
