class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :orden
      t.string :obs
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
