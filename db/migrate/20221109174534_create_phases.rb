class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.string :nomenclatura
      t.string :proceso
      t.string :descripcion
      t.integer :moneda
      t.float :referencial
      t.float :estimado
      t.integer :periodo
      t.integer :convocatoria
      t.integer :sele
      t.float :sele2
      t.string :sele3
      t.integer :sele4
      t.integer :sele5
      t.integer :sele6
      t.integer :sele7
      t.string :obs
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
