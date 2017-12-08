class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
    t.string :title
    t.text :body
    t.string :author_name
    t.string :author_id
      t.timestamps

    end

  end
end
