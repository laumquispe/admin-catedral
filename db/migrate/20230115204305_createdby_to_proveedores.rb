class CreatedbyToProveedores < ActiveRecord::Migration[5.2]
  def change
    add_reference :proveedores, :created_by, foreign_key: {to_table: :usuarios}
    add_reference :proveedores, :updated_by, foreign_key: {to_table: :usuarios}
  end
end
