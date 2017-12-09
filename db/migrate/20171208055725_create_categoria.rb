class CreateCategoria < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria do |t|

      t.timestamps
    end
  end
end
