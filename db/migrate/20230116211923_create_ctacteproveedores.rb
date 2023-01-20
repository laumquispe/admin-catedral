class CreateCtacteproveedores < ActiveRecord::Migration[5.2]
  def change
    create_table :ctacteproveedores do |t|
      t.date :fecha
      t.references :proveedor, foreign_key: true
      t.string :numerofactura
      t.numeric :ingreso
      t.numeric :egreso
      t.boolean :activo, default: true
      t.datetime :canceled_at
      t.references :created_by,  foreign_key: { to_table: :usuarios }
      t.references :updated_by,  foreign_key: { to_table: :usuarios }  
      t.references :canceled_by,  foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
