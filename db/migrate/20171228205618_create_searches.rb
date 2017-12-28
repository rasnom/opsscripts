class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
    	t.date :search_date, null: false
    	t.string :query, null: false
    	t.string :url, null: false

      t.timestamps
    end
  end
end
