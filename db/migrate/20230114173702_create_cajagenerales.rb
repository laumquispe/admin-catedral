class CreateCajagenerales < ActiveRecord::Migration[5.2]
  def change
    create_table :cajagenerales do |t|
      t.date :fecha
      t.references :tiporegistro, foreign_key: true
      t.references :concepto, foreign_key: true
      t.references :subconcepto, foreign_key: true
      t.references :tipocomprobante, foreign_key: true
      t.string :nrocomprobante
      t.string :nroordenpago
      t.references :proveedor
      t.references :formapago, foreign_key: true
      t.numeric :importe
      t.string :observacion
      t.boolean :activo, default:true
      t.references :created_by,  foreign_key: { to_table: :usuarios }
      t.references :updated_by,  foreign_key: { to_table: :usuarios }   

      t.timestamps
    end
  end
end
