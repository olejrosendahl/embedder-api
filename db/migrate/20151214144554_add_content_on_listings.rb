class AddContentOnListings < ActiveRecord::Migration
  def change
    add_column :listings, :content, :text, null: false
  end
end
