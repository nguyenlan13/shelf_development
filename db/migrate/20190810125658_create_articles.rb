class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author(s)
      t.integer :year
      t.string :source
  end
end
