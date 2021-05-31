class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :title
    	t.text   :description
      t.string :link
    	t.string :file_size
      t.string :duration
      t.integer :sequence
      
      t.datetime :published_at
      t.timestamps
    end
  end
end
