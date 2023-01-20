class CreateTiporegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :tiporegistros do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
