class AddCajacerradaToCajageneral < ActiveRecord::Migration[5.2]
  def change
     add_column :cajagenerales, :registrocerrado, :boolean, default:false
  end
end
