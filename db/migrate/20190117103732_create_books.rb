class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, unique: true, null: false
      t.string :description
      t.string :isbn, unique: true, null: false
      t.integer :visibility, default: 1
      t.datetime :creation_date
      t.belongs_to :publisher, index: true
      t.timestamps
    end
  end
end
