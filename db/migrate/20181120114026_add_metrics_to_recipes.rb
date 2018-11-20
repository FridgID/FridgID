class AddMetricsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :metrics, :text
  end
end
