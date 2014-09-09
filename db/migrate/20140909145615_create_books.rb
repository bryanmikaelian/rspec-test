class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :subtitle
      t.string :isbn
      t.timestamps
    end
  end
end
