class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.float :mensal_cost
      t.string :animal_type
      t.references :owner, index: true, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
