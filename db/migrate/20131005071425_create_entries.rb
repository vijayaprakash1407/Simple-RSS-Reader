class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :url
      t.datetime :published_date
      t.integer :feed_id

      t.timestamps
    end
  end
end
