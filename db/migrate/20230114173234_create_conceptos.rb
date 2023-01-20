class CreateConceptos < ActiveRecord::Migration[5.2]
  def change
    create_table :conceptos do |t|
      t.string :descripcion
      t.boolean :activo, default:true

      t.timestamps
    end
  end
end
