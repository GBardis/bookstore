class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, unique: true
      t.string :description
      t.string :isbn, unique: true, default: false
      t.boolean :visibility
      t.datetime :creation_date
      t.timestamps
    end
  end
end
