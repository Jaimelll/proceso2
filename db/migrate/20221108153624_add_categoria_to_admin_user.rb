class AddCategoriaToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :categoria, :integer
  end
end
