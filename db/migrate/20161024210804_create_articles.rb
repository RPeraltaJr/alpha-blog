class CreateArticles < ActiveRecord::Migration
  def change
    
    create_table :articles do |t|
      # we need to add column(s)
      t.string :title
    end
    
  end
end
