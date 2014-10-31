class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, default: ''
      t.string :author, default: ''
      t.string :isbn, default: ''
      t.integer :rating, default: 5

      t.timestamps null: false
    end
  end
end
