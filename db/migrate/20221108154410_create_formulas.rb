class CreateFormulas < ActiveRecord::Migration[7.0]
  def change
    create_table :formulas do |t|
      t.string :nombre
      t.string :descripcion
      t.string :obs
      t.integer :orden
      t.integer :cantidad
      t.integer :numero
      t.integer :acti
      t.integer :respon
      t.integer :respon2
      t.references :admin_user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
