class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :author_id
      t.string :title
      t.string :authors
      t.string :year
    end
  end
end
