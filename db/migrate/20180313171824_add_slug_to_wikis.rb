class AddSlugToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :slug, :string
  end
end
