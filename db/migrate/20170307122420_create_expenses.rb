class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :description
      t.float :price
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
