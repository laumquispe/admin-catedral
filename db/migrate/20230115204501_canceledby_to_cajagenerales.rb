class CanceledbyToCajagenerales < ActiveRecord::Migration[5.2]
  def change
    add_reference :cajagenerales, :canceled_by, foreign_key: {to_table: :usuarios}
    add_column :cajagenerales, :canceled_at, :datetime
  end
end
