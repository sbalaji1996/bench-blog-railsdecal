class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :blog_id
      	t.datetime :date
      	t.string :title
      	t.string :text

      	t.timestamps
    end
  end
end
