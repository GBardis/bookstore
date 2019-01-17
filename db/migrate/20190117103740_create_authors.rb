class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :email, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :date_of_birth
      t.timestamps
    end
  end
end
