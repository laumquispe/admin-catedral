class CreateTipocomprobantes < ActiveRecord::Migration[5.2]
  def change
    create_table :tipocomprobantes do |t|
      t.string :descripcion
      t.string :abreviacion
      t.boolean :activo, default:true

      t.timestamps
    end
  end
end
