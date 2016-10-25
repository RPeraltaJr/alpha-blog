class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text # Add column to 'table', 'name of attribute' and 'text or string (etc)'
    add_column :articles, :created_at, :datetime  # Add timestamp column (MUST BE 'created_at' and 'datetime')
    add_column :articles, :updated_at, :datetime # '' '' ''
  end
end
