class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.string :title
      t.string :authors
      t.integer :year
      t.string :source
    end
  end
end
