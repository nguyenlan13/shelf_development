class CreateFaveQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :fave_quotes do |t|
      t.integer :user_id
      t.text :quote
      t.references :quotable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
