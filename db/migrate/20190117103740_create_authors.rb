class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :email, unique: true
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
