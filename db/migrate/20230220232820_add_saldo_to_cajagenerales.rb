class AddSaldoToCajagenerales < ActiveRecord::Migration[5.2]
  def change
     add_column :cajagenerales, :saldo, :numeric
  end
end
