class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description
      t.timestamps
    end

    add_index :articles, :url, unique: true
  end
end
