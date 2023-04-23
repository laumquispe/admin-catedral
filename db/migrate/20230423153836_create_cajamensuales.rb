class CreateCajamensuales < ActiveRecord::Migration[5.2]
  def change
    create_table :cajamensuales do |t|
      t.string :periodo, limit:10
      t.numeric :saldoinicial
      t.numeric :ingreso
      t.numeric :egreso
      t.numeric :saldocierre
      t.references :created_by,  foreign_key: { to_table: :usuarios }
      t.references :updated_by,  foreign_key: { to_table: :usuarios }   
      t.timestamps
    end
  end
end
