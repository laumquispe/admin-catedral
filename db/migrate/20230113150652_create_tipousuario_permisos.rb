class CreateTipousuarioPermisos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipousuario_permisos do |t|
      t.references :tipousuario, foreign_key: true
      t.references :permiso, foreign_key: true

      t.timestamps
    end
  end
end
