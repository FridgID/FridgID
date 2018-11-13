class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :from_month
      t.string :to_month

      t.timestamps
    end
  end
end
