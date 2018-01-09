class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :subject, null: false
      t.timestamps
    end

    add_index :categories, :subject, unique: true
  end
end
