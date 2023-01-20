class CreatePermisos < ActiveRecord::Migration[5.2]
  def change
    create_table :permisos do |t|
      t.string :url
      t.string :descripcion
      t.string :opcion
      t.string :icono
      t.boolean :activo, default: true

      t.timestamps
    end
  end
end
