class CreateSubpermisos < ActiveRecord::Migration[5.2]
  def change
    create_table :subpermisos do |t|
      t.string :url
      t.string :descripcion
      t.string :opcion
      t.string :icono
      t.boolean :activo, default: true
      t.references :permiso, foreign_key: true

      t.timestamps
    end
  end
end
