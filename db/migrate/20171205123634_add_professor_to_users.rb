class AddProfessorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :professor, :boolean, default: false
  end
end
