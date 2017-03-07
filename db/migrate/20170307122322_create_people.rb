class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :password_digest
      t.float :credit, default: 0

      t.timestamps
    end
  end
end
