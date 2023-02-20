class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :codigo,limit: 50
      t.string :html

      t.timestamps
    end
  end
end
