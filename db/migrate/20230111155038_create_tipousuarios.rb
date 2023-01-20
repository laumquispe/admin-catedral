class CreateTipousuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :tipousuarios do |t|
      t.string :descripcion
      t.boolean :activo, default: true

      t.timestamps
    end
  end
end
