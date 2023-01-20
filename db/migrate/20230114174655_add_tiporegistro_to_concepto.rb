class AddTiporegistroToConcepto < ActiveRecord::Migration[5.2]
  def change
    add_reference :conceptos, :tiporegistro, foreign_key: { to_table: :tiporegistros }
  end
end
