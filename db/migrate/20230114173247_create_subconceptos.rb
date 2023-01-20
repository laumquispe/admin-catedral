class CreateSubconceptos < ActiveRecord::Migration[5.2]
  def change
    create_table :subconceptos do |t|
      t.string :descripcion
      t.boolean :activo, default:true
      t.references :concepto, foreign_key: true

      t.timestamps
    end
  end
end
