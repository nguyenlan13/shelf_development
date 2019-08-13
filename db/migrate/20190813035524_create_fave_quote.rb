class CreateFaveQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :fave_quote do |t|
      t.integer :user_id
      t.text :quote
    end
  end
end
