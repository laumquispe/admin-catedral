class CreateTipousuarioSubpermisos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipousuario_subpermisos do |t|
      t.references :tipousuario, foreign_key: true
      t.references :subpermiso, foreign_key: true

      t.timestamps
    end
  end
end
