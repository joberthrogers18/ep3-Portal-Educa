class CreateSobres < ActiveRecord::Migration[5.1]
  def change
    create_table :sobres do |t|

      t.timestamps
    end
  end
end
