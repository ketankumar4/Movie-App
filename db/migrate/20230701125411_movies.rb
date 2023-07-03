class Movies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :fav, :boolean
  end
end
