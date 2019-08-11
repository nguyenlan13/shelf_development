class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.string :content
      t.string :favorite_quote
      t.integer :rating
    end
  end
end
