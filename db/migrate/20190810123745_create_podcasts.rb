class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.integer :author_id
      t.string :name
      t.string :episode_title
      t.integer :year
      t.string :source
      t.timestamps
    end
  end
end
